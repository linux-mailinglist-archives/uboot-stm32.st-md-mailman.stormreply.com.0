Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK19ET6jnWlrQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:10:22 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355A18767A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:10:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4FC8C8F286;
	Tue, 24 Feb 2026 13:10:21 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011024.outbound.protection.outlook.com
 [40.107.130.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68329C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/Yr9xkDyBlkINuDx3QZMUz3dQhwyV+MtHLuA3ApTk36/AXeznuZAa1EjU1avY/Mp2nmKdWlUIS9RmlrL4y9ZSRuJDrMituFDYenMpl4okcUNPpyUdwav7fO8aVU0SBoTR0lTjwmI9WeVnbaeFGt6woSg6r7Kfp4kwhN5UlbqAuJcfFyHjOnY90oAbboRyKIKrMMHr7sX0SoolLJvNNPHiJgudXpexcek0mCbXu71IC9/cTMFmiJuOt2IYc91PcHYKgJO3kmUKEEjOm1WqTroVN/Lawndety5GXS1a91QkX0NOPdbw5cwo4DyLip06NNBs5qE/ggJMqqOQJSDq3cjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rYMOzO8c6IPGjOREuNy4WTgw+01nfHkB0kUJGfFwBg=;
 b=I1AI3YOi2pmF/ugY613WM3XlnH7Nf7QNnpflC1H6lXS2DbgLgEVVcfcnfZlLGJyuLd0o6YkbJa8zatroDP2QoEji6faiYLNwpTvdzTF7C+vmAX1QWSUHpyWj6tMXw0L52JQ/EUfucP6WgDfYzaLFOnDXhNLzZWrdVlvpKSpDXB/GiXVwLEXkVhYHljyrNNaQEkiEvxGtVGOnWBD9KPRZS6NIdSSr7kRaxFyV5D2ufj7vsa3CAOHV9tVAg/6VZ+TvL9EhT4DXuEzmLNb+6cDQKvbe8oQLm+G17e27vhNGNK8PF5Gw1u2zRHWUlwRryYcEcoxRpdERd1ctx1N8e9InbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rYMOzO8c6IPGjOREuNy4WTgw+01nfHkB0kUJGfFwBg=;
 b=Z8Jl76amDmEvr3l+nDhHJsbv2rbfbacVG7IFMmR1SsEf7/2TSsi3yHSZxGsPSHcmal5Ozu921lLsqldxbs1ESrDJPwutYTjlntXY9hE0xxbSacQkBYev4om3roEsiAeWt/ZZU7aFolSymikY3ovE92o++VE5HQRDyIM6dOLstCqL/91zN2gvVsAE3CJY/xtFgge+JwDj9ZZIkHqBZqd2mvp7q3ZBKH9rj8S3TwbyR2QKG7vxihTXF/rs5Ae6Ee45LsVi4s3Ac9GAEvxsdDS19wPEFpyUIDcL1fY29Drqc88buSDTDPlQhxch7otbY6OPg3x7ztxN83BAPGeYa3HSpA==
Received: from DUZPR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::15) by AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1cd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 24 Feb
 2026 13:10:18 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::c8) by DUZPR01CA0037.outlook.office365.com
 (2603:10a6:10:468::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:10:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:12:23 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:10:15 +0100
Message-ID: <6ea6a296-a3a5-427f-b88f-5ad54250389a@foss.st.com>
Date: Tue, 24 Feb 2026 14:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20260203-upstream_add_stm32mp21_support-v1-0-48ca3409cce1@foss.st.com>
 <20260203-upstream_add_stm32mp21_support-v1-3-48ca3409cce1@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260203-upstream_add_stm32mp21_support-v1-3-48ca3409cce1@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|AM9PR10MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a34f56-80f4-464a-75f9-08de73a60e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEE0MytoRlAwbDBNdVJtRWYvMXErWVpZbmJsbXU0dkJtdXlRRnVXV3VYOWgw?=
 =?utf-8?B?dU5JbHl6RnV1eXRXME9XNWtaTkNhZFRvZ3gyVUZQZWxLTWZZbW85cVhsOGZD?=
 =?utf-8?B?K05TTmpIU2RTRlpUWGN5MUt5QmtQaE5rS0h6MkE0eGR5Z0tpQjdLd0pDREl3?=
 =?utf-8?B?RnF5TkM3bEtkcHoyaVhXdWV1cjBoTXlHamdJc3o1YjdpZTJIWWJSeGJjZncx?=
 =?utf-8?B?Sk56RzBjOFNMWjVmR2hpWHNnbzZPZjk1dHA3ZU9wU0hQdytqYkdkUDhKVTNk?=
 =?utf-8?B?QmVVWFEram9oSEdxSGZid2xUT1U1VHhrVWlweU9UNFFLejRKOWlNVEdaUmhC?=
 =?utf-8?B?WDNLaXl6YTNQUHpjQ1Zyc00xZXpYNkdYNzJXZGJ6VGhYWjdVVzNOZ2ZlK29r?=
 =?utf-8?B?Tk90M0pycGhkTkNJYklHREhub1JCbE9iL2pzendBdVZaYnozWUZNVkVnUWNU?=
 =?utf-8?B?a1A0V1pZbjllYVR0WmNVakhwSFBNc1VQejU4eVYrajdXOGs4VDdFZDJ0Z3Z5?=
 =?utf-8?B?QWtKNXpVeFlmejlBZWNML0tmdWU0M1dKZ2FrQmR5dGQvZmlMeFZJcjI3eCs1?=
 =?utf-8?B?WlBNWUh4R0tFb0JnSXFNMUVmaGY3WDN3M0pvZC8xNEZ5VHVSdk9VREFLZlBF?=
 =?utf-8?B?Zjg2bzd3cHdrN0cvcGN3U1c5TDlsN2x2cU9BSy9oZ3E0SWEwcDBMR09mUWVE?=
 =?utf-8?B?aVlRTjNjWkFGWTYrMXRHalVIRGFjR2NscWM1WnpEM2R0Y1RiS280WkptU2hY?=
 =?utf-8?B?T0xpeHc4R3dlUXkvdGdzRnZBeXkxT1pjeS90SVFSUUc5OGlLbm0zakF5enhL?=
 =?utf-8?B?OFdISkI2RXN4S2VRSVp0RXZmT3QwV3V1cXJUdGh3WjN6Rk56dlA0bmQrWXM4?=
 =?utf-8?B?WDNtZTI5RWI1b1BhS0ZTMU12YmJjWC9STnFSb1hJV20rZEJ6dmZrUFB4SCta?=
 =?utf-8?B?bVQ1WEs0N01PcjBTOHNMdFFmN1h5Wm5OZWlPbHUvVHJXZUl3aGhDczdYaEta?=
 =?utf-8?B?Qi9YWjhkaktJd29oS01jN05TU0VPVURSUHZkbStSUkkxZ2pjSFFDTnBBTFFk?=
 =?utf-8?B?c0lIOERlbVgrMm5OTzVjZW1yR3VnTkw2WnpNaHFnMWpQYXRHcUU1UlU5Y09m?=
 =?utf-8?B?dThFaHVTaFVMT0MrV2JpRUltRzJTSEZWMHRWenMyVnVKNEdpMU9ScHY3bjdC?=
 =?utf-8?B?TWNGRXB0OXl5TVdEb2VrbU5oc0FYWnZiU2UzVFRucVVuU1RHeUNXWTVCdk1F?=
 =?utf-8?B?OTUwSndVeGYxUHM3dlBzVjJEM2sxOGpRYmhNZmM4QnpzYzQ0ZlM1cStYL0do?=
 =?utf-8?B?N2kzT3ErMStUeUM2emVRejhRRW1GZFY2Y2NyZ3oycGlBakwxdzBibXZnNTFu?=
 =?utf-8?B?SW9hdWZLbDRlemE5V3ZtSktZSVRET0QwTE1LeDl5K0hWZEhVNG9WcHhwVFVq?=
 =?utf-8?B?dHFVZHBoNmRsOWxmVTVUTUQvbUY2M1krUWlGd0FydmhhaWxjbjJITVZUcE5a?=
 =?utf-8?B?bmswbGM0NzRkU1NuNXRkNjA4YURGbzh6TXRBVk1pQzZPYkFWQW9Ycm5HK1Bm?=
 =?utf-8?B?TVU4bWduRVVnU0hqNW9nVEhyL2ZUQ2NaSTJ0NW42dWRlWGZBMDFOSmFyUzMy?=
 =?utf-8?B?NWxDRzVFREQ2ZzQwVDlvcmxZcFJBMWFsYmZaODk3dWNqVEVIWVd5SDg2N3J1?=
 =?utf-8?B?dFhtVmpGamtKREt0MndtVmJJQWw5aG0wTkYxQXFGcmE5QWxrMzN0bGxoT1Mx?=
 =?utf-8?B?bGJGd3k0LzE4dGNZUCs1RlNuM2RXYk9laUlnS3FWd1owWHZoZmUyUXUyeUVi?=
 =?utf-8?B?Vkd2TlJTS2lnK3ZiKzVaL2RIUDFQU0RtaGl1WmtYWmMyazJZQWo3ZDlBb2xN?=
 =?utf-8?B?cXNTNnFFR2dKV3ViUFBuTDUrWW5XVDh5Q1dFempLa3Q5Y1hVVlE5WlVQRTRj?=
 =?utf-8?B?dnVLZTVSeUg2Wlh1dUpwbE9HbklpMmw5aEQ3RGFxS2VPNk5EY1VUakp5K3pO?=
 =?utf-8?B?ZmlzRDdtZmZaU2Q1Ym9XVURjYzVsMTh6TTlnaThjT25yUkt3NUpTY2drN3N4?=
 =?utf-8?B?anNod1dDWlp0NnJ3UHRPeDJaNGhsSXJIdU14alBlemRrVWxZalN6bHR5SlZE?=
 =?utf-8?B?eTRyVnhQUU9TazRUYWE4ZFkwWWdKb3REWXQ5NCt0Y1p4ZkxVT1l2eTdHUnFq?=
 =?utf-8?B?RnRCbXU3VWNRQ0N0ZkVmTHZBeWc1aFJYZ2hqbm81Sk5FcFhhV3c4dURYdjNn?=
 =?utf-8?B?OENzdzE1cFVlSzkzaWEvMm1kWmd3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +0teCJx5BlOBxs/Yjhgv28p5y+Z6L8z6GOpui/dfJ+S6DsTOsFldshuP6DvHqhlw+/s7HoSV0vpm05xMQlEYWOJLl8mKYXnyKHKyQfy4GNZqHqH0v2wIh44u7WeoZS2N04gwDm5htMsjLCzOR9zIERXUyhtcenW6UWn5/MNe1BMmnrOp4g/6+teSi5hn5qHoVLvRcFp7nVBV21Y5MQc6/E+U4bnWQd9lVKFQXSJC0KtMrUNEDHKoBO/cLW7uMGYXdGp4LXlGylx2unh8bIZ+RLkO2LImoQUNo+XhlLUsuClwsqkZWZ+Yjq7lNRIGRt6ehHz/jDcNDT9mCISVMdzxgLIpuXPPM2U9Ci1UC/SST53L8F5MG001PY7jwxUwz1HLY2tnrXMUdSq03iAf9b/wLUr+NLPZHjdoVkQnPzS+lBn2kd0swAG7n4MeXwmF/6ka
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:10:17.0688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a34f56-80f4-464a-75f9-08de73a60e1d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>, Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/7] stm32mp: syscon: Add STM32MP21 support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:lukma@denx.de,m:gabriel.fernandez@foss.st.com,m:fabrice.gasnier@foss.st.com,m:nicolas.le.bayon@st.com,m:lionel.debieve@foss.st.com,m:gatien.chevallier@foss.st.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,foss.st.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.862];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0355A18767A
X-Rspamd-Action: no action

Hi,

On 2/3/26 17:49, Patrice Chotard wrote:
> Add "st,stm32mp21-syscfg" compatible.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/syscon.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
> index b00897e87ec..f2cfc9465a5 100644
> --- a/arch/arm/mach-stm32mp/syscon.c
> +++ b/arch/arm/mach-stm32mp/syscon.c
> @@ -10,6 +10,7 @@
>   
>   static const struct udevice_id stm32mp_syscon_ids[] = {
>   	{ .compatible = "st,stm32mp157-syscfg", .data = STM32MP_SYSCON_SYSCFG },
> +	{ .compatible = "st,stm32mp21-syscfg", .data = STM32MP_SYSCON_SYSCFG},
>   	{ .compatible = "st,stm32mp23-syscfg", .data = STM32MP_SYSCON_SYSCFG},
>   	{ .compatible = "st,stm32mp25-syscfg", .data = STM32MP_SYSCON_SYSCFG},
>   	{ }
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
