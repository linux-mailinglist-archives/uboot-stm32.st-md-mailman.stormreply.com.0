Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5B4CD01A6
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Dec 2025 14:42:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50394C87EDE;
	Fri, 19 Dec 2025 13:42:23 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011065.outbound.protection.outlook.com [52.101.70.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44048CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 13:42:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzoAYKaYLFXP4bRScU5qafJVDSQretPg6oLGK7CV48UlnIZTXk88VZmetf9mBLx7c2hEiWxP4e8pkupQ7kuTgvfvrz7MurrhiWL8LreEfmh/7bG/Tm8hX+C/MYHB4rLOVusZq3ZCG5hwrF3pkePFlB6hCinfHhWeBSm+Zh2eDk1aoPFTIjD8PO/q68gsfMZsGWsxQlwu0RBZA3tCesW/76G2XIwpIR53d0N0qzLVZz6RLyA9YfIpgRis83574S6ad9sp94LSynQzBnSqTDGtNh73cyYm+dQMECWUZ3j3bMgu7YhUkTs7DOk7v9POYCvdR3jALVvy7C9CLR7P35axYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYfimk0nhuC5I/uVlj+9zg2RldTGtixeHdy2WHHcpVk=;
 b=u3xuG15Sq37BbM+CD1tC24tzwecPGraIDtlqP71AvZ9134Nx1u17sDsoaRjk0jeddDUy4nE42dYXAwZyzqyFohjX7azvep4XpqUO+ngXCVjc+4mLTPmObNdfdDVnG7AiVrdCoxVbi9lY2XugNJq3MTd1PHL97zLV5xpg22jHZQ3dBAtU8bg3IC5WruYBxqK2ln6Cdv69EIqzQA7umBjrvOJVQozVNo+SHMo4BJ8EenT+kL5HecFJaq0+KVzcZKNcaIawyPhgMBN4CuqbOjQ8vL9OepR7KwkHjDgfa337eEoGCkMh16qhlS7+4trdzzs21xWuZG94VS3p1T9kF4yfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYfimk0nhuC5I/uVlj+9zg2RldTGtixeHdy2WHHcpVk=;
 b=FYIRA9b6YghT59ZnHZtKfDKAbVBJbih6Q4mI0lBjAkMNecJ3Vc5EHqF6+260xC+6ax+IBqKsXNvYWBCRYOQ0Sd61r9qu4ABQswLRWuky65yMWx6pPa3p+k2AKhnBbCS9yy6kxf2hhzjwXiCCvj3Uew7Gv3zL/1XIPX1spcEjdZtf7pSIruY7OJh0HgCht26HotKLqRx1Dm1BFFRdf0dMJQS+gROlmOeXL+TG3tWciyY2dj50f50yb7ncy2yibReqeTEVrGb83tNMwa4WH9p+QESj7alyMf2VWWPsvEh6EF5yHTmi4YyWIOdsKNMjBXZOCqoC+IFThdLrjCJnSMS0kA==
Received: from AM8P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::14)
 by AS2PR10MB6894.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 13:42:17 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::78) by AM8P190CA0009.outlook.office365.com
 (2603:10a6:20b:219::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 13:42:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 13:42:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 14:43:02 +0100
Received: from [10.252.21.85] (10.252.21.85) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 14:42:15 +0100
Message-ID: <1cbe447d-dac1-4dcb-9a96-51c4ee0bcf3e@foss.st.com>
Date: Fri, 19 Dec 2025 14:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Peng
 Fan" <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
X-Originating-IP: [10.252.21.85]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|AS2PR10MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa47ec7-ee0b-439c-77b8-08de3f046c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blZVVk12b252VVNLOTIzbnhtMlRHMGVwZjdxeWthSlhHWENZSm1NYWdNdXgy?=
 =?utf-8?B?TGZZNzEzVkwxY0FaZWxVdFdyNVB1bFBmeHNCWFY0K1ZJV3p1L1prb2xTb1hK?=
 =?utf-8?B?cmlWcGN6U0hSZGNjQWdYZzFUL2NsUDRMREJhS3VBb1ZCSzdTb3lGb284a0hQ?=
 =?utf-8?B?VDgzeGZLa2ovbVNMZFV0VSt3M3ROSVoxOVhsOENkYTNqRlVSeUNNYXBhMjJ3?=
 =?utf-8?B?STdsTW9TRFcwbGRYVmJTdFVCcWczQXkvTk9KbEpvT2FZeEtCbVRDelhoa0Za?=
 =?utf-8?B?aUFjaHdJL2V5L1VWNDBRa0hoenZUVXVTeGlic1pUSW0rQzN5aDM5VHlseFR5?=
 =?utf-8?B?RGcvVUxBQ3hWWm01RTlXaVdIOVAzM3VsQVhjTnVjNHFCb0Z2UXhmNnBWMXZo?=
 =?utf-8?B?RUgxTTFod1E2YmRwZDRYUC9tdlRxcUl1VlZEa1QwdzIrNkZiNXEzQmxsdysx?=
 =?utf-8?B?S21hU2dUTFpZbXZrTVZ4U3pwWVdqU0dCMkJMdGU4QWpzL0lhSUFZQzBYYU95?=
 =?utf-8?B?NzNxV1QxSzNwSFZJQkxMUzhCOVk0d3duckFqLzhkMnZ2Z3JBU3gyd0YrcWR6?=
 =?utf-8?B?WUZqK1dPRFlLUUhIQTYrMGNqOW1rdmFqR2s0SVM4eWEvaW1zdHF6NUVZZFZM?=
 =?utf-8?B?VlBOa1YzeXpPd0lRR2lGKzc2WDl4SExPTnlOalNYV1dtbzNxMlBzc29ZcWdY?=
 =?utf-8?B?WTAvWm54YTRpWkVGQ2hZakxtbDdVamNEN2Z6VDVkbWgxb002dExaZ0NXbEow?=
 =?utf-8?B?RTFBNjFqL01rems3UFYxbEdINmRWZmpvSDR2UkIxcktTN0Q1RUh4M1pnZDRI?=
 =?utf-8?B?bnRMTDJHMjJsME11S282V241K2pNdklIWGlMOGg1a20rTDdha1poRk5HNFE0?=
 =?utf-8?B?Y2cxUEI3aTJNWklpNDUvU0Z0UjZyYUkwZ1lIakFLQzE2bVhBcHNuMDBGRVNE?=
 =?utf-8?B?VE5WTi9rb1dUblNERnFvcVNGNkR6SE90cHNaWHdtcy81NXdsVVVKM2FVVEIy?=
 =?utf-8?B?L1IrK2Y0aTR5UHlZaTVtc09rM1l2cU44M05hVm1ldGozd2ZvY21hcElzeFl6?=
 =?utf-8?B?bWNHSmYwWDZlNDRpdUNIRS9hcUpWVHgwQzlMMTVvZG85c0YwNjBZbWVRajN1?=
 =?utf-8?B?UTh5YXEzd1QyLzJEbFhxcVZuMVh3WGN4SHFEUWd2Rm5oRXZ1UnB4UGdnUE8x?=
 =?utf-8?B?a0NFRG5nNXlZZEI1K3pkVXJpL3Z5RHVqVlkyZ2s4RnZpZWlkQUdaVkdiQWJO?=
 =?utf-8?B?RUh3THUzK0Z4RGdhWnV4SXl5cktpSnFleWxyZnFDa1pHSlJwNVFIbVNNZkx1?=
 =?utf-8?B?RkpiK2l5c3NEQ0JSUXkvSm5TQjFpTytLZDYwamxiZkxsVktYaU1CazRUWGpw?=
 =?utf-8?B?dHQrS2NkM0pkTXgzL0M0NlNaQlN0dXd0dk50REt3VVNaM2dwQWhRcWUvWldF?=
 =?utf-8?B?MEN0bmkxWmJlNHYwS2ZPQWpDNEF5engzV1VZSHJPems2MHpTclkvNGRvaEZt?=
 =?utf-8?B?UzNndkFZTG4vYzJsdGFHQlpWaHgrTHlaSGE2RGlpc3ZOR1E4and1a2wveTZ3?=
 =?utf-8?B?ZVdyRWFmLzlBZld5aGxwRVcycXp4L0RSQ0hxeGFCcjV6djJsNVVsUTU2djBv?=
 =?utf-8?B?Y2h0QVh0bkduWEgwUWw3Y3lTcVlvWG1raVhOQjBuM3pyZ2J2d2M1YUppSS9C?=
 =?utf-8?B?akhXSVZqMDZ1ckRndkxOazZ2SFl1VWpvWDFhNzJEdDFpcU1wcEM4aFluZXRa?=
 =?utf-8?B?Ull6dVBuUng0ZmF4SkhCeHB3Q0hGVXd0bXQ1VU9iOW9Ec0NsKzZMeFIzWVU3?=
 =?utf-8?B?Y1ZUTXNFQWYxSnF6bXhITFFZb3FCakx6Rjl3a09WalRMRkRBeGZUb3o5eHNx?=
 =?utf-8?B?YmFjRWFEaFBIdERDN3J1RGNYUjBESVJOR2JaRytzaWxGWWVDQm1mNnVtNW4z?=
 =?utf-8?B?SFFPbHN0cXJBd1gvNUtFdE9zZ0poNUxjL3BWRnFZalJuL2J5Q1BMUVc5L2RS?=
 =?utf-8?B?M1lJM3NzQTdGWU5CaFR0TmI5d0pTUEpGejF5THphOWIzVjg5UFVZM2Zkanpo?=
 =?utf-8?B?ZjFEc3dmTkdLaE83ZUl1RHlpcnFJUDlLdTVhZVBEaFFabmRvU3FGS1N2WXZr?=
 =?utf-8?Q?ayw8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: N7YKIoSXWcz8NkUiPUt8GnXe1xq6PJhxjdvDHJjpDNjQ41hGqEedD63rBujoCryo7isKTFlU1b1xra1xkxqNR4/dzXab+2vOnOJFe05WkR19zOyNJOJQOYtco+iKUUMpEueEmgt9v7p8OxOF4XbagqH5ewKJuN0rNlsarbtvB3VhVigj4FGuHnhpoV8KSofulqHy+IK5ikRSO/WlhwtGqzzzcORdiDWABliTfR73yE8Cc6d8irrrhO38ybprPr5HksGN7qS74wSwxYVA5Tsmdhc/VXkn8+phlCvlrpV5FykucTviS2VUz6WNbOiryiFKvp7Lx5YxFs+Tjttn/ZsbZzt2QepjTxJwsYGmzT7Ux7x6W2t60Bj5EXXioPJEuKj/TZxrOH4zDJQqO7A+TbPyRIfinPGqYzrrtTjvyW6XPlde13yMHa7f3uBkilIEXwGl/KIoSjc5t+I6onvxCGyzGlrLKhF3w52h27W/AqTcxhN2NyLAVg9HrR1el5uSEajPYw0lKC2Z11RapsFZTbrrWJzZwiERW2dRvUxIM3iSWnoYtsLae8cI1IP02fvzRo8VU194/X/W/fpBvQ8JK3rzHmvdtFfv4B+prwbX6nLkXZg8gVz++0LgnFNXCCJEZ29HxAIG3MFBpIecUA0skJDSIiy5TjY4h7h55AHiE1FtqolJo30fysxtcwqK8yJdMdXHFGVx8UeOgE7yiqTjb/uwXg==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:42:16.5377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa47ec7-ee0b-439c-77b8-08de3f046c84
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6894
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] Restore boot for
	STM32MP13/STM32MP2 board family
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

Hi Marek

Can you give this patchset a try on STM32MP13 DHCOR board in SPL ?

Thanks
Patrice

On 12/15/25 15:56, Patrice Chotard wrote:
> Commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> is breaking boot for STM32MP1/STM32MP2 family board.
> 
> The issue is due to registering clock with default name "scmi-%zu".
> If one of these clocks has children clocks, it will generate an error
> when trying to register their child's clocks as shown below:
> 
> ...
> clk_register: failed to get ck_axi device (parent of qspi_k)
> clk_register: failed to get pll4_p device (parent of spi2_k)
> clk_register: failed to get pll4_p device (parent of spi3_k)
> clk_register: failed to get ck_hsi device (parent of usart3_k)
> clk_register: failed to get ck_hsi device (parent of uart5_k)
> clk_register: failed to get ck_hsi device (parent of uart7_k)
> ...
> 
> Clock management update for STM32MP13 and STM32MP25 SoCs family
> to no longer use clock name to establish relationship between
> parent and child clocks.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Changes in v3:
> - Rework clock management for STM32MP13/2
> - Link to v2: https://lore.kernel.org/r/20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com
> 
> ---
> Patrice Chotard (3):
>       clk: stm32mp13: Reorder include files
>       ARM: dts: stm32: Add SCMI clocks in rcc node for stm32mp131.dtsi
>       clk: stm32: Update clock management for STM32MP13/25
> 
>  arch/arm/dts/stm32mp13-u-boot.dtsi |  27 +++
>  drivers/clk/stm32/clk-stm32-core.c | 111 +++++++++-
>  drivers/clk/stm32/clk-stm32-core.h |  39 +++-
>  drivers/clk/stm32/clk-stm32mp13.c  | 441 +++++++++++++++++++++++++------------
>  drivers/clk/stm32/clk-stm32mp25.c  | 405 +++++++++++++++++++++-------------
>  5 files changed, 707 insertions(+), 316 deletions(-)
> ---
> base-commit: 0e0a198a68be71148f5ec27ef86796174f91436f
> change-id: 20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-e7497f503414
> 
> Best regards,

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
