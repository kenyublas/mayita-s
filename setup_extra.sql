-- ════════════════════════════════════════════════════════════
--  SQL ADICIONAL — Ejecutar UNA SOLA VEZ en el SQL Editor
--  de Supabase, DESPUÉS del SQL que ya tienes.
-- ════════════════════════════════════════════════════════════

-- ─────────────────────────────────────────────
-- 1) BUCKET DE STORAGE para fotos del menú
-- ─────────────────────────────────────────────
insert into storage.buckets (id, name, public)
values ('mayitas', 'mayitas', true)
on conflict (id) do nothing;

-- Políticas del bucket (lectura pública, escritura pública por ahora)
create policy "lectura_publica_mayitas" on storage.objects
  for select using (bucket_id = 'mayitas');

create policy "subir_publica_mayitas" on storage.objects
  for insert with check (bucket_id = 'mayitas');

create policy "actualizar_publica_mayitas" on storage.objects
  for update using (bucket_id = 'mayitas');

create policy "borrar_publica_mayitas" on storage.objects
  for delete using (bucket_id = 'mayitas');


-- ─────────────────────────────────────────────
-- 2) MIGRACIÓN — Cargar los 18 productos actuales
--    (Solo ejecutar si la tabla productos está vacía)
-- ─────────────────────────────────────────────
insert into productos (nombre, descripcion, precio, categoria, badge, orden, visible) values
('Salchipapa Simple',                    'Papas fritas con salchicha y tus salsas favoritas.',          10, 'salchipapa',  false,  1, true),
('Salchipapa Mayitas',                   'Nuestra versión premium con toppings secretos.',              15, 'salchipapa',  true,   2, true),
('Salchipapa a lo pobre',                'Nuestra versión premium con toppings secretos.',              13, 'salchipapa',  false,  3, true),
('Salchi Broaster 1/8',                  'Papas fritas con salchichas y broaster.',                     17, 'salchipapa',  true,   4, true),
('Salchi Broaster 1/4',                  'Papas fritas con salchichas y broaster para compartir.',     25, 'salchipapa',  false,  5, true),
('Hamburguesa Clásica',                  'Carne jugosa, lechuga, tomate y mayonesa casera.',             0, 'hamburguesa', false,  6, true),
('Hamburguesa Pollo Crocante Clásico',   'Doble pollo, queso americano.',                               12, 'hamburguesa', true,   7, true),
('Hamburguesa Mayitas',                  'Nuestra burger estrella. La más pedida del local.',            0, 'hamburguesa', true,   8, true),
('Broaster Personal',                    'Pollo broaster crocante con papas fritas doradas.',            0, 'broaster',    false,  9, true),
('Broaster Familiar',                    'Piezas de pollo broaster para compartir.',                     0, 'broaster',    true,  10, true),
('Piernas Broaster',                     'Pollo broaster crocante acompañado con papas y cremas.',      20, 'broaster',    false, 11, true),
('Nuggets',                              'Nuggets de pollo crocante para compartir.',                   17, 'broaster',    false, 12, true),
('Alitas BBQ',                           'Alitas crocantes bañadas en salsa BBQ especial.',             19, 'broaster',    false, 13, true),
('Alitas Acevichadas',                   'Alitas crocantes bañadas en salsa acevichada.',               18, 'broaster',    true,  14, true),
('Agua Mineral',                         'Agua fría 500ml.',                                             0, 'bebida',      false, 15, true),
('Combo 1',                              'Salchipapa + Hamburguesa + Gaseosa. ¡Ahorra más!',             0, 'combo',       true,  16, true),
('Combo 2',                              'Broaster + Salchipapa + Gaseosa. El más pedido.',              0, 'combo',       true,  17, true),
('Combo Familiar',                       '2 Hamburguesas + 2 Salchipapas + 2 Gaseosas.',                 0, 'combo',       false, 18, true);

-- ════════════════════════════════════════════════════════════
--  LISTO. Ya tienes:
--  - bucket "mayitas" para fotos
--  - tabla productos con tus 18 productos cargados
-- ════════════════════════════════════════════════════════════
