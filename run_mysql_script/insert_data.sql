USE task_reaper;

-- usersテーブル
INSERT INTO users (name, password, email) VALUES
('佐藤花子', 'password123', 'hanako.sato@example.com'),
('鈴木太郎', 'password456', 'taro.suzuki@example.com'),
('高橋洋子', 'password789', 'yoko.takahashi@example.com');

-- teamsテーブル
INSERT INTO teams (name, description) VALUES
('開発チーム', 'アプリケーションの開発を担当するチーム'),
('営業チーム', '顧客対応と販売を担当するチーム');

-- user_teamsテーブル
INSERT INTO user_teams (user_id, team_id) VALUES
(1, 1), -- 佐藤花子は開発チームに所属
(2, 1), -- 鈴木太郎は開発チームに所属
(3, 2); -- 高橋洋子は営業チームに所属

-- categoriesテーブル
INSERT INTO categories (team_id, name, color) VALUES
(1, '設計', '#FF5733'),
(1, 'テスト', '#33FF57'),
(2, '顧客管理', '#5733FF');

-- schedulesテーブル
INSERT INTO schedules (category_id, title, description, start_date, end_date, is_completed) VALUES
(1, '要件定義', '顧客の要件を整理し、文書化する', '2024-12-03', '2024-12-03', FALSE),
(2, '単体テスト', 'コードの動作確認テストを実施', '2024-12-04', '2024-12-15', FALSE),
(3, '顧客打ち合わせ', '顧客と今後の進捗を議論', '2024-12-05', '2024-12-05', TRUE);
