Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A4D3A20F
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 09:50:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 021F9C87ED3;
	Mon, 19 Jan 2026 08:50:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 946C6C1A979
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 08:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uA0Wnup7IYnpao1VxURiyY650PPC5D7GhszlRMwpSL8Io3FyXwKZKy9ElfLF0gM53SgQHS+9PuMnsSPQYdCQJUZXhkYgi9PmzHpRHML7/FIutrhc8RDyksnOVjz7mjtYgYPrFBK3OuiPTftd412YlHhbh8IR9Xp23YoDVDDoCokh0QDCwP6ay2tZAhfOPcJTXTAezeglLi4ZREmvEryya931epVoBCiam/HfFyo+dxYJ7ot5EXz/6E9ib69FL7yfdOE3Kz/FmtHiB85moqJ2QJBbUb9bmLFYinEpJNXhYO9li4AXZBXu2zr55QI52jHuOOvbSXE2oJRX1yamikZInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHHL8kLTXdVMwvZ8aGFRZcusmXYmRX/62JCo9npDOkQ=;
 b=T8bbmzUdCIFCIpwBExAwEYpRj3LpGtoQuSBzToyoOKIqzeglTejqk+H7hLSxFGJ5g4LEaZssdjfzwbOWU1uT2iJKL3iMVRTnFjO6/QZZ/wByQ3ehbWbjFKNujaFaeo5oIqEkTUuvec64OZhXIySC+c4/jm2pYJHYx1W6cs+0of7lYc9yi4s5POOMrwi14Fj2XpmHq304KBqomasYkCih9mNenE36NfzoMrS4S9vPTZ7NTRCcBXXqN7RgERA3RK5XRziKlOLOQrRZu87UTThCySVGHybN0IfnqrvdcU7WOi7KgdzbM9r1NotXOzavCVtjeCxohYISy9nd8webh8MPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHHL8kLTXdVMwvZ8aGFRZcusmXYmRX/62JCo9npDOkQ=;
 b=O9ZQD2uINeyNp7H8u7OdWColDf9/LeHtPojSV8I5pMmWCvA5Y9XEERH2RT0j/bItiiHjM40rLiCIddqJfkPgz/HtJYWLWO56dVqpsX6v6TkCvkuM1npj9sUUob4AUZqu5TGg5y1ueMf+zNRviN/zMNbOe/b35pa7U+fNhhiyITLVDT9pb+WL5ZjubuZZUOfwSEhu3FVPBzEe8atSgFcSlWNV+SSscu/+388jBiGLVlOSYhG0F8tRAFrJpxDz4NcthT6KQl06Y9Ygphw9bOrjm5tvEW2dwmmmJv+EC+ccNPdWvLd4TjXkO9HeykNFf47cKsA7gEGD+doSjk7CGLe7Hw==
Received: from DB9PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::32) by PR3PR10MB3915.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:4b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 08:50:33 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::48) by DB9PR01CA0027.outlook.office365.com
 (2603:10a6:10:1d8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 08:50:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 08:50:32 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 09:51:51 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 09:50:31 +0100
Message-ID: <f7038b76-37e6-4dca-bca3-53b39a1d0489@foss.st.com>
Date: Mon, 19 Jan 2026 09:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@nabladev.com>, <u-boot@lists.denx.de>
References: <20260108021705.518243-1-marex@nabladev.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260108021705.518243-1-marex@nabladev.com>
X-Originating-IP: [10.48.86.129]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|PR3PR10MB3915:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cea48eb-73af-421c-6cb5-08de5737ce4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ky9aWEtlVUVtS1Blbi9mb3NMUTJKWDd0Sk8vUi84VDBQV3lHYjlTaUM5K1dI?=
 =?utf-8?B?ckNjRU1acEU5R2IycENORS9QaEJaaGlyTzAzeTQ2QSs0K2g4bDJrY1JoSkZl?=
 =?utf-8?B?NS9oOUM5NUNxdy8zd3F4M21OdFIxUTY5UVFuT1RDUy9uZzd3SGRHRkE1cEcr?=
 =?utf-8?B?RjVjd0xraUtSWFB0VUNKdEN1QjBVMVpVRzNUVk9xWDh0N28xbW0zTE9reGhs?=
 =?utf-8?B?cE9VakF5REYwR096ZXNnOGJNNmRoc2V5SXZseEpmV0ZVRDJsZFpXbGVqQVc1?=
 =?utf-8?B?S2dnL21NZzlaWVl1R3QybUdRUDBodWlVMVhic3IvVzhmaTlxQTNLejRiVEsx?=
 =?utf-8?B?czU4Z2JMY2xKZWR6WWQ0WkJySFVscFFzMUNtV0RyVUlrOTZvZHBLN2JjSHF4?=
 =?utf-8?B?WDJNdlFSSXdRVFNwQU5GeUdkUlN3cUZuSFAvQllwY1hONnJpQ3ZmY3VtZElG?=
 =?utf-8?B?aHREWlZ0ZDlwb0gxSkhlaFdrbWtEQmEyNDdOdmVUYlhNcTFzeXpUTlQ4d0xn?=
 =?utf-8?B?NEVYc0NsaUlndGNLQUxEVUFLM1dLa0xVVHVjd28xcGlSdDFpdktMUzF2WU93?=
 =?utf-8?B?T2k4OUdJOU9DQkdBSGdqd1pTNzFnSjVhejFJWXc2N2dUd3cxN1dyNlRwdk9S?=
 =?utf-8?B?eFdONTZOQXlybkN5c0pVc1dyc3VNREg5V1M2NmM0cXBWbGx6OTFOb1NFdHM2?=
 =?utf-8?B?RlhOUVBjRXVuTHlndjlUNGF5alM1czNacXFkNTI5cVR3MHdmNUd2dG1KTi9M?=
 =?utf-8?B?cDhudC82Q0RzMytWSDZRb2dmUEJGTVRoNUMyaE50TVpLS2p6em45ZTEybkJX?=
 =?utf-8?B?UjFYeEExSEtMOHVjSU9oZzc5Q1N6ZXhNcnJBUUMybW5jcDk1dWFSeXZrN0lk?=
 =?utf-8?B?S09vc0JMQ3VhQzF0RE5XNGI0eUVycVZJWUo4UERJNjE3dStGU0JlNkNRcktn?=
 =?utf-8?B?aFBqbG1JdkEvbXYzQ3RGT1VEQ1doUlZEYm5oN1FPN2tCbnpGaUUzQ3UyUFJo?=
 =?utf-8?B?WFJJMGoralgvQzBkZlpsa1VIK05BOEhhdHNmYy9Tc3BZeTdmQm9XUTVXRktW?=
 =?utf-8?B?OU5vVHc3Wk11RkUwdmYvRE5mZXhaWE9GVTZBTXhuRzBPRTlrRGM5TGQrOEVT?=
 =?utf-8?B?c2JZV0FzYjhEMHNIcCt2TEw3WGh5eWJLQ2dJZWRqcSsvZ2hORzIrMDBYbWxF?=
 =?utf-8?B?ZEJnQ1VFQ3drWkpCd0YrS3ZGTyt2NUZzdkN2SmwrWmNYOUhIYnZ4UmpzNzMy?=
 =?utf-8?B?a0FWckNxV2VWY0JCYnAzWkJmY0pSOC9WWE40Sno3WTlhSlVEbkV6dWhDT0Jp?=
 =?utf-8?B?aEVsRmVtUnBwYlJucFJQOWg0cjUwOHhGRUsyckdLaHhFQ0R0azdHQUdQcWJz?=
 =?utf-8?B?MmpZdmtZd2ZuVDNhTUs1c1pPMmI4cUJqditYNzBNcC9NYWVwd3V6bEFRczF5?=
 =?utf-8?B?ajducUlNMFdrQ3RkbXJtQUVibUx5djkxT0NNVUZzOTg3Vlk2bTBiMk9sTGdC?=
 =?utf-8?B?T0J2Y0NpUkdUWHQ1MEcrK0cvL3l2ZGttTkttZklURW9jWXhPSTd4VnFySGxI?=
 =?utf-8?B?SjVVYjZSSjZyWHVpNmI0RmJ5MVA4aStGSkFsYnhpd01FTVZqRWdIY245REpx?=
 =?utf-8?B?ZmNLaExpNWlnNWhVREpOZWIrcHBmOTJLMzR4ZmlJQXpqSWplVUx1OGpMWUJP?=
 =?utf-8?B?VmZ0SmxpOXppRHJSa2c4RE1xYUNDWGx6SEphb2d3YVBWYWVJMkFpR1VrZTI0?=
 =?utf-8?B?dndRYlBLY3NpM1dBRWQyaHpNc2FmeFVmZjFQbFIxbG9sdTNyNncxZ3hVd2xj?=
 =?utf-8?B?RUlJRkpSZkhZTlZndE9DVHk1bnZyT3JSRmpNcGY3bXNXRFdVNmFsQjZ5YldK?=
 =?utf-8?B?Z1Z4c0kzYzZxNFAwb002MGUvcjhsVnhSTUNIV0MzZXY0STBLZmVNLzVzVEFr?=
 =?utf-8?B?ajdTZHlTT1d0NG90ZEFqOTNNQkdlR20vQWc0bkJMY2JQQ0c0VHJlbVpWbmt2?=
 =?utf-8?B?aE1sUjVTNENWekI0TFMrWXJBeHBPRVVybUNxb3JnWHlnOGNDTlpocis0MVdu?=
 =?utf-8?B?cSt6NG1GMis0OElVRndxQ3R1b2JES2R4YUpEdFk4S0Uva1UvbnF2SzkxRjFs?=
 =?utf-8?B?KzBmUm1RaG9YVEVPY2FCODBtek1QSWVCNy9XU1NQc1pyZlhWSCtkS2NKS0c0?=
 =?utf-8?B?RWxDSzE5ZThRMkVlWFM0QWdVRy9hZncxbmdwSG5oSTM2YkgrQWtXaW93THhC?=
 =?utf-8?B?RlgxaDFOYng0dmtSb2pZOHJmTFlRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PXzvtfMJVdQBvFYEHLTWeNtiijrOk4j8s8A6G9mQOMfWzrJBP02E5to23wSMeTGE+iPtHMaWEv6FuQ5n5CML4oawuptgwCzGjPOxDZFx5oB5kzwboasTsYfAA+uYODQImJI+iljLyBmz30ey50tOIiUQRn4RbkPgECix76CfJ1YoXwpygssH6hfv2Z6szDFcKR3XqUR5KXY6Q+Q4os6x76qczc7N5CVf9He0A0VEC5wWALOGZarEV8VMowJo23RmLqYfyRbjKgjHfkslQFaMzgF33ip+MhubxWpRoBCOE4NBEpQLq+ySjSeVvkvVBCUFz6dEGORBVcdP45/8aRB/pTqxKP2AniW5q6YjtCSv2R3NAdjQwUfy7n+XfpzgTs65zzM8KHjK5bY+HDg7h/cOQwQY6yJq3IMYN/iyB9WwMQZOdyxzin1V/+6bIbwptC11wZ5wvZo7pV9CyXpaYhzB0EEOo3EriivJJrSrSayCSKVwRPL3Pqs6H+Yj5bAfDtVB66T44Bj9CAa/H9rt9p47jktRZwQcPT/d/KRojlU1OwU4eAJNZOqqlVFPc0SSNUMj4mNGHNnIZbeHoUCa113KNzg+uZMQMu5lwqKgFv6c/cvf1dYqAauJZUDZcWRZZbiOfENm0Bap/XJQI2SqI7JcZ4i8Q6lHqGzzwBvxmtLSxL90c10epU9djmJQoa6H9j1S
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 08:50:32.8189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cea48eb-73af-421c-6cb5-08de5737ce4e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3915
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Reinstate missing SPL configs
 for DH STM32MP15xx DHSOM
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



On 1/8/26 03:16, Marek Vasut wrote:
> Re-enable missing configs for DH STM32MP15xx DHSOM, to allow those
> devices to successfully boot again.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  configs/stm32mp15_dhsom.config | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
> index d5ecbac29e0..24420372e3f 100644
> --- a/configs/stm32mp15_dhsom.config
> +++ b/configs/stm32mp15_dhsom.config
> @@ -38,7 +38,13 @@ CONFIG_WATCHDOG_AUTOSTART=y
>  CONFIG_SPI_FLASH_MACRONIX=y
>  CONFIG_SPI_FLASH_SPANSION=y
>  CONFIG_SPI_FLASH_STMICRO=y
> -CONFIG_SPL_LEGACY_IMAGE_FORMAT=y
> -CONFIG_SPL_TEXT_BASE=0x2FFC2500
>  CONFIG_SPL_BLOCK_CACHE=y
> +CONFIG_SPL_DM_REGULATOR=y
> +CONFIG_SPL_DM_REGULATOR_STPMIC1=y
> +CONFIG_SPL_DM_USB_GADGET=y
> +CONFIG_SPL_HAVE_INIT_STACK=y
> +CONFIG_SPL_LEGACY_IMAGE_FORMAT=y
>  CONFIG_SPL_MMC=y
> +CONFIG_SPL_SYS_MMCSD_RAW_MODE=y
> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
> +CONFIG_SPL_USB_GADGET=y


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
