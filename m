Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 225AFD384FC
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jan 2026 19:57:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB35CC8F296;
	Fri, 16 Jan 2026 18:57:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C77F4C8F28E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 18:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvCvun8bLWHpKbubZ9heF0ADR361YwUjiAcDRbnPYWKO/wm6aTmTo07M3XSIyPHi1/Cac7yxUdfQkCsA6updvvgOoXjovzr1fMOMAhIgbFJla980SXeqBj6GqS8Xw8TqEYlkE6mDXrPDT4T+DvmOZk1mMALNZXoii9xj7XBbLuODFtekOxOEWF1WNiKaYBl7vH7rGWREOuXpRZDB17k00qacMLKZoyO9TRhaUBPUkJKPI8PAWGxYNhLOcNKxNfltl/j4zINkckRiScBoW9GaY9kxbaBIsgri1Fa2SvHM/TldJgBp8nfdrn1dTALfRf7eVu3EB5s4cHIEV4rmsCNXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvVSioNIuFBFskoJfCHev1qXfCHm8AlubzHL11Z2b2E=;
 b=hQRkwhwaS7h0kjbNyuBWW8hncrMAOcwTx/8CpCHOKsbBklr52zvylFfhzlJacznH//rGm/JbArvt4098NoRR4SY2P5b9byLAi1y4E9ly3Pq+R5i7+h6j+Z0e6rd0wKbMFaiumlgiKzfRfAGNRNaVu9y8G/z819/mskHtLBz9F2KSzY38htpOw7n0CnxAG/24WBI7Dpc0OT3qucmPTWD4CAgdf9CronPNDYYfYVUxmIoYS9UX8pg+3cfBnp5qHAUDjtixfAznRi63TRRWmkMM/MXJWNLl8y+oAV/TEKSCjws5MiXAB85PhA2AYB/447xMjkr9cRXu3Kxt3toQkunjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=denx.de smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvVSioNIuFBFskoJfCHev1qXfCHm8AlubzHL11Z2b2E=;
 b=jjiiCp98gQ8inW3EMN38GKkEq1Asgw6SfCR0rKT+PNlfp06PYF9qSEzo63CcLNKCHRMLav0/PBOET79670UAjbbmGtTReEgqBTZUlI8BTMZliL4RfDQBarcrYcMGhHq3BwMC+GVPw4qQhwCHaivz4JyVCkd3mnyvgigyrbv8Zn+OrzfJ8zQZ470e8lZSiit75R+Rk/2likiuinfc+bCOVsU7Qz+RzsWL6GoDEzlG22muu5nhbTjMT+4dHqQbPEofwsY6FuMBk82FpweB8eslR/MVD7k0nTm/E1FjjBTDFvs9HS/+tvCv10TRt7toff9ka0BTjA+ZZOVrMqJbBFGIAQ==
Received: from DU2PR04CA0262.eurprd04.prod.outlook.com (2603:10a6:10:28e::27)
 by GVXPR10MB9610.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:334::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 18:57:49 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::2e) by DU2PR04CA0262.outlook.office365.com
 (2603:10a6:10:28e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 18:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 18:57:48 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 19:59:05 +0100
Received: from localhost (10.252.20.137) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 16 Jan
 2026 19:57:30 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 16 Jan 2026 19:57:24 +0100
Message-ID: <20260116-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v4-0-d7cf17cd678c@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABWKamkC/53NwQrCMAwG4FcZPdvRpu2GnnwPkbKtqethdjRjK
 GPvbjcQ9KiQQ/4E/m9hhCkgsVOxsIRzoBDvOehDwbq+ud+QB5czAwFGgpQ8IU0xoW1jnKyPydI
 0KBhGqd4bmPxskiM7A8daH2tvhNJSs1w6JvThsYOXa8592Oqeuz/Ddv2byiO41lhh7RBabM8+E
 pU0lV0c2IbN6hMwPwMqA04Y4xrQFRrzDazr+gLmTxxJTwEAAA==
X-Change-ID: 20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-e7497f503414
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.20.137]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|GVXPR10MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c35062-e5ca-451d-8fb2-08de5531247b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wkx0b1U1OUE3UHRzZEtCUXc1VGRBb2lVWjd6anp3VGNhMEN3bnlwRkkvYzV0?=
 =?utf-8?B?eUNpTkFrLzZ6bXd1MC9Pa3JqTjJpbkJZeXdPZEpmKzZiWEQydTBjblA0Q240?=
 =?utf-8?B?Zk9lNkh1bmdRK2c5TFRjR2xNYkNSWmxMUzhFWnRCTTc2alg2UGJiaXo3R0Zx?=
 =?utf-8?B?VXFKd3IvYXpmTUNCL3o3ZnlrdkFXUEQ4c0piclcyeHZMTGVOSW81T2IwOWd6?=
 =?utf-8?B?ZXQ1RGNqeno4dzFLQ3FDeENPcjE2NXMrc053QUIrTHRrODRSRE5yeSsrWU55?=
 =?utf-8?B?SUptd3RPVUNaOXErZGtGZ3J2QytwVGo3VmFLRjlUZUdvbW5Ga2NqQnhHaU1D?=
 =?utf-8?B?VWhSWUM1QVUyVWJXbFU4MWF4NGhyd292Rzd2MUdGMndJRWxBeUZHeUFodnZs?=
 =?utf-8?B?dkU3OThwTTJqQjN5WkVpaVY1Z1ptaGxxZ3dKOUwxZ3NicVY0WVJ2V3puSlB6?=
 =?utf-8?B?OVppb3JBQjlFY0Z5RC9DMUszcVpDeXQwNkhJeEwrYUJtVzJwMUZWU2dDM3ND?=
 =?utf-8?B?b3dPRk5vN29FcHRKd3FVVTc1N3Q1T0dTQVBSejVzYzVKdEZWK3lPSEdXTkMx?=
 =?utf-8?B?bEJ3ZjBKYmxUTVcrVHlMS2FRNERzQlZqRTJKS0J5Mm0vbFIzV0FoRGkzVGZS?=
 =?utf-8?B?YjFGTGJubmRRWlFIREhYaTdUQ051N1ZhTWliQnJZbU4wSE81UmR4ZTNCWjdC?=
 =?utf-8?B?Y2pRbHZVOWVDWFlYZm1sdDZhSWQrbVZ1NktiL1RPNnZsSk1MQnlnRmU4K2h3?=
 =?utf-8?B?TzdpOVJrWmlBMVhaRFUydXV5aEQ5N2VXdWtUQTlvcXdLTU1pR0ZETFpuYnkv?=
 =?utf-8?B?K09sZVRKWnZPUzNyN2tkRHVQV1dONExncG9BYkZ1NFUyZFpXdVBWQUFjd2Mz?=
 =?utf-8?B?R3VKYzlqcXhnbGxKV2hwT1M1VTZtczBZSFlLZkNaSFF6djdOeVczMXVYMHA5?=
 =?utf-8?B?eHFXU1dwSmtITGs2bVNBMmNEZmZLNVlteVl2NXJPZ0RoR2FNSHZwN0pCYkRP?=
 =?utf-8?B?TnpWTmYrSGF1Uk5oWFJCYTRyTFpDWHdXdnJTcGVpSmlaSkI0YUZwSGcwZG91?=
 =?utf-8?B?VVpreVE5a3dpdXhFNnY3c2tQdzlJck0rT1FDOGdkSnJoZlNKb3JjbGQrRjE1?=
 =?utf-8?B?TFN3bXcraTRFMjJ0UytwOHR0a1VmZW1qWjB6MG9JU3pNOHB1U0NIYjF3TEJL?=
 =?utf-8?B?QWcvRHNqZzFsMll3YlhYcWk1UDEzQ0NiY09sR0pac25kTGJnQkNrZ25Zd1I1?=
 =?utf-8?B?bDVncC96bU1VS3lZNituUUduQzRqR2xENW5USzZJM2lCaEorZFJ4eG9RY0lV?=
 =?utf-8?B?b2FRTWhpV2ZLL2cvRm9wQmxwMnJOTVdaQWZ1UGV4Yy9xQ3ZleWI1U3oxK2oz?=
 =?utf-8?B?RGlONERRaW01OE5MdGZVUXlzNUNBQndJY1dxWko0TnhrK3NKbnl5TTl0K2JK?=
 =?utf-8?B?a2lsdUMxd2RNYjdzamRLSEZocnk5SEtNeTRnNmNDWGVueVpGazFCOFAwS3JZ?=
 =?utf-8?B?TzFoYWxKd1RxdUIwNGFvUXFCdzJnVitUczBqSDAvaHRwbGtKbVhRQll1RFJj?=
 =?utf-8?B?N0RlODRKY1hVOHl3MVNtTGVxaXM1T3c3S3NvTklZV2NnTEJjVE5rZ3VpcU5L?=
 =?utf-8?B?NFhBb3BYd0NadDRoR2ZGUE9sYjl0MEpoaWVId1hZMCtnNGNjNGRaMWNqVnlx?=
 =?utf-8?B?N0hIcUJqdEFxa0duL1RRWDdHMktPNGp6RFg2am9TTm1yQ0JrN01FK2RBSFlC?=
 =?utf-8?B?aUpwOXB5R1ZiMVlQdm9hVTdVZFFYU3p6LzZrSDhhTVgyY1YyMlUxK0RQWDJ4?=
 =?utf-8?B?R1VaR2lIQWpsQm4rbCtBMzdROGRXZ1BYcWVJenl2eHczcTJGckFWTkczZlF1?=
 =?utf-8?B?clFRSE0wN3dMMFJKa1pHczB6VFBiMlZlZ29vL0FNcDVUWkt5VTNpc3FmcGdP?=
 =?utf-8?B?dXhOZ0FFeHhGVzd6OTQrSUY3cjlTSEJ0blQ3N1VEQituR1hCb09DeW5DczJB?=
 =?utf-8?B?VmQwM1Q3V2FRNzVVVVNGTmV4VjExTFMyZktWK21kazBZcmphYkh0S0dzSjNK?=
 =?utf-8?B?bTU2Y2FqdWVZQncwL2FrYytub2FMc0V0Zzd3SGFYdm80WFgyaXYxa1BRWThn?=
 =?utf-8?B?eFdzaVBHVUt4Q3pXc1ArU1dQUmRyRXc2Q1dtSVFpaGNRaW5zZ0hHT0ZUSmJ3?=
 =?utf-8?B?S1B0TkxjR00wU0ZDWGhGWDFrWGNpMGhJU1Z4K1RleDhyZ201QXFlWFBYaUhk?=
 =?utf-8?Q?2AnR/tybVf9PcV4w12s89dM5Mlu9fJhhLg5YEnTzwQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2K9lS+mvcuiVNisy2iHz7eLhT8mHcfVZWZIxZ7aZaWgYdCmY7MuErnoffuKojGsJ68oTCkmLL52XuulfONcnY4kTTCA/vo0yjoCb9SRZTnEXAE6BwAWhweSw12kif/c1lxWd4r6grBBbfmwGOGqtPVN2oB6xlCPrrdaxdK0sPOGbmOgeDDRrKyhW2Y75yv6W88p/Shg6/2r1W6xBm0ywsWhdKCD3r2ZjajM2N5YbwOZO1KvjuMGHG9VFMHXRkuO9FPKIdK3lcVnl77mG7bLorxo/p68kX/WTF89qLM4dLDorx6b3y4FeVWfcLClV3mR0kWBDB4CZQ2q8woase37VF35Z6KbyIkh22vp30oDqmoxdt4PL4LJAVmejnHT8D+qEyjtlMWrKap5qeytAKCoNbPl5YLPGa0OdLwi5mRLQmbouENhA4EdFI4HFPGRFLKH/1lfa6clU/e66Z5pd3u4gTM3tCm5CmhgetzvvWOk/CuNDZ9I3NVnpA1BuAO9mP6SScJJ+GRHAOWxVl18cgQ7kAtTcJJ612HrynkRRuSdbykkEinsg+TnlL8OJmhqOvXRmf+SW6AbomeriAu6/OtU/3Uhhgd65zhno3dOjUvcATujzWDSX7JiAZCqUo0FJ1Y+4rVbigor6Iw6JLVyBrz4rWdNDKaKSteb0YlQprdklttlcjtJlVp07xVu+/GIeJ6gJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:57:48.5885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c35062-e5ca-451d-8fb2-08de5531247b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9610
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v4 0/3] Restore boot for STM32MP13/STM32MP2
	board family
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
is breaking boot for STM32MP1/STM32MP2 family board.

The issue is due to registering clock with default name "scmi-%zu".
If one of these clocks has children clocks, it will generate an error
when trying to register their child's clocks as shown below:

...
clk_register: failed to get ck_axi device (parent of qspi_k)
clk_register: failed to get pll4_p device (parent of spi2_k)
clk_register: failed to get pll4_p device (parent of spi3_k)
clk_register: failed to get ck_hsi device (parent of usart3_k)
clk_register: failed to get ck_hsi device (parent of uart5_k)
clk_register: failed to get ck_hsi device (parent of uart7_k)
...

Clock management update for STM32MP13 and STM32MP25 SoCs family
to no longer use clock name to establish relationship between
parent and child clocks.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v4:
- Fix data abort in clk_stm32_resolve_clk_name() during SPL boot.
- Link to v3: https://lore.kernel.org/r/20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com

Changes in v3:
- Rework clock management for STM32MP13/2
- Link to v2: https://lore.kernel.org/r/20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com

---
Patrice Chotard (3):
      clk: stm32mp13: Reorder include files
      ARM: dts: stm32: Add SCMI clocks in rcc node for stm32mp131.dtsi
      clk: stm32: Update clock management for STM32MP13/25

 arch/arm/dts/stm32mp13-u-boot.dtsi |  27 +++
 drivers/clk/stm32/clk-stm32-core.c | 116 ++++++++--
 drivers/clk/stm32/clk-stm32-core.h |  42 ++--
 drivers/clk/stm32/clk-stm32mp13.c  | 441 +++++++++++++++++++++++++------------
 drivers/clk/stm32/clk-stm32mp25.c  | 405 +++++++++++++++++++++-------------
 5 files changed, 709 insertions(+), 322 deletions(-)
---
base-commit: 1da640cc46ad84efb57bb45e02dd6c40265b5488
change-id: 20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-e7497f503414

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
