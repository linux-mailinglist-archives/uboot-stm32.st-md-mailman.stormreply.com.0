Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7AACA4780
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:25:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86CBAC628D0;
	Thu,  4 Dec 2025 16:25:29 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013000.outbound.protection.outlook.com
 [52.101.83.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F810C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:25:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky7e7yHcYm/ZvQye/RFIJFR0zrDT2nDfs5gjDk4ttR+7ATXeJcVBirM1P0WjN5wNf7LhW3W+utxLBOqC7hdXD1Kz47J61HbGx3jYTN2lseDKwok6Ua6xPgYBEYLhp1y/5MP3RCXltd0sww4c1P0o7ChbBcRIqm7BfdWeTqchyDvu7854FWIjukuD4hvuke+hiCbcKrdLgmFEStil4kx9ZIWOtYvZU/0KqCC3AxsO/81QnyIPgovmuElFh6qAan7eXlJbTV8iqi3de3vIq2U7FnpWGa2Mke539nOGYSY+OZ4PhmvY1zuWA17x7hNxQyHNhWGid/FftYMPDR93lyRjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXE/BgIccHPuVRs8f3G4rzLAGPLrGIB9MhCpi26ZNJE=;
 b=JROMjma8qKj9zp5QfHHho7O2OzCkbFfvzDuKlfv0m2Jac+MBxfdOjhizC1HHi1Q1YopyZpHyxs/9kW83X6b5cOmKEN6tz/I7SKt2Pcb1fIglkIaEl2jsXcvGiFKJ/1F1GLDlB41OXvI+6mSbJrWgIQSNl7miT80iZg94rjLXU3vUZ4IQqBS6IryXnF9NtEDWgKPXf5FEiaq2ssNVzmL4kVew8JJ2KikTaZ6DEnO/tCYhXQm+AYI4L3wSYdQL3ZKHplHq5qmXAXZtWC4JNLKbSt4k1fP/g7H1auhBsA5Q2ix7NrAcL0jDizNgBA58IPNibRslGmCe5nWP06TuTnI2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXE/BgIccHPuVRs8f3G4rzLAGPLrGIB9MhCpi26ZNJE=;
 b=its2nQ8C4Pn8BnN9lfj/GWN/VA/vACcQdtfqA3yJ9h7/O/TLQHGM/gCYpdzsKaO9043To1f3Drhi/RuLecpCNrfNeH2dM/7ZE7LfUNGxBQtTxFixy+2Qt4Lm/utzk6WgXAahUS1o5kuwrHyY2+a9hPOpb6VcYNi9QJS4VWeDqqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8718.eurprd04.prod.outlook.com (2603:10a6:102:21d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:25:25 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:25:25 +0000
Message-ID: <07a85afa-dccf-48e2-86ac-5fa91477806e@cherry.de>
Date: Thu, 4 Dec 2025 17:25:14 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-18-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-18-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: fa85b18a-102c-4e91-aa83-08de3351bac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dCtBOEEzLzJldUJBWmJXYlVQaWNvTkc0UDFtUzhxUFBJOTJEd2tuOVpnS3VN?=
 =?utf-8?B?eHp3MWRTVjlvOGx4ZU5tZUJMVXlGcElIU3NLNjVNaS8zYno1VXNiZ0NWY2R2?=
 =?utf-8?B?UU1OWVV6RDhLcEhpL1FRcm1vYkhFcTRHTTdMVzlHWGVKSXAvVDkzU0J6Wnox?=
 =?utf-8?B?Q3MrUmxNMGtMRXRHVm12dDZKZ3ZOV243Q1V3TGRqSTkxdzZyR2grQmtNQzNE?=
 =?utf-8?B?TTVicmpXMjhOaVl4U2pjQll6RU8wQ2Z6bVVDYnFGemhwTkpBOUhYSmgxS1Vo?=
 =?utf-8?B?SHNoN3hWNzRadzZGbFYrVVRMbU1xQkx4b3NUMGZyaU1yWWtxNm15VU1JYytn?=
 =?utf-8?B?aUlydVRMaTBHdnhmL3hHbU9xMEgwUlZXTVBaenBnMjh4VXVTVk9TMzZ4SnRj?=
 =?utf-8?B?bmZrOFVxQ25GRFAwY2NRS290aEdjSWw0OHBqNUdJdmJ0d2ZwSFhJcFBpdCsr?=
 =?utf-8?B?dXY2R0E1V0NXZmp3M0lhejNkVXVEV2VqMDZ1WVpGYzJ4ZlMweDBpcnI2MDBU?=
 =?utf-8?B?MXhiQUE2cGlnWUE0d0F4Vm9UR1VpakcvRzlpVkUxOWo4SjJGMXFCQjdXbVRP?=
 =?utf-8?B?cG53VHVMNnlJc2kyQkNLUW0xS3dLSnlIdUw2OHhHcTk0SWZSNUkwQWlJcHIy?=
 =?utf-8?B?NTlQclN4ek50UVR0c2dxd0twS0FMSGdJUzlMZzlTR1FsVGc0TGNvM0JLNEpP?=
 =?utf-8?B?OVlKdGdwQmV5R1dDQnZWWmFHbU1TdjFiSE5NalZWaWlaSWVPRFRXUGxQWkVB?=
 =?utf-8?B?T1VEZVlnOFRoSGx3WXU4SS9zYS9KQVNEeXBCTTV6RVhjKytIRUQ3MDFySkxp?=
 =?utf-8?B?ZWszeVJrTUowcTNBUHhBNEs1YzF4bUpUNU44T0U4cWVwNjlrZnBzRGdTV3lx?=
 =?utf-8?B?Z2VIZWdXUWFHZXdISzllTGY0MDF2MEQ4V1pQUi9nR3paakFpVUY4bTRQMVN2?=
 =?utf-8?B?Z0ZIKzRncEVnVzQxcm9rN1YvZGdRRzlmb2FaeVhiTHluQ3pkYXlDRmRleUp5?=
 =?utf-8?B?bFVHWVhNL2x3RElIRVowSE1vc0trVXlYTmwzaDhtaVVBWXF0N2c1aHBUSXNL?=
 =?utf-8?B?UzBKMEw5VUZXajVoc01NeVNKMGl3dzE2STk2TEZENkUvb1ZsRWVTeHB0RWFq?=
 =?utf-8?B?OEFxbzRGOEl1UXZkVkdJQVFGMmhaMVZCSGxZdCtyREIxODQ0ellZeGRzOU1M?=
 =?utf-8?B?ZUNNRzg2VkMyK2xCai9vaUVHeEJsSWFFd2N1RE93T2cvdDdMNXlVSzNMTTRW?=
 =?utf-8?B?ZW5WSFpESWhzR2dMTzhzLzR4MjdIT1JoQWxqSzd6cEVqT2xIaXZ2RlRwYUM4?=
 =?utf-8?B?ZENvSEJIVWNYTWNIMWlhWXh0dlZmV0krVmlWQnkxVlc4KzVnOXNKeUdkbU5S?=
 =?utf-8?B?SXJBc3kzeXZtTGNxZ0ZjZEdSV1VPbWlGY2NJZ0tqcFlGNnRrOGROU1loZE10?=
 =?utf-8?B?RkdPUUZkYnFIR2Q3NGxHWGVtUVlMNTRLczJrMCtjVmRueFR5bjhzK0gyN1JF?=
 =?utf-8?B?Qjd0NVN0YXpqNlpKUUcrTzluSUx6czZJeFIxd1MybWNBdVdBNFUveUFaYlRB?=
 =?utf-8?B?VkdkM2JodExRY3VXWFJnSys3Y3A3Mm1kenIxWXY5Z2gvTTI4YlJUYkQyTTBV?=
 =?utf-8?B?SXdESFN1Tm9CbEk3ZHl3TlNMSFZTY0lpRWRoYXp5MjFoYU1vN2J2dk9FS2dl?=
 =?utf-8?B?UmlIbzBTV0pEK2NDK29LOC9kblRzamhqQU5jdmpKMzd0QkUvc3F1UC9sY21y?=
 =?utf-8?B?akNXcnVnOGJmcXZkN1RDUjRwdjZYV2RWbzJMRC9wM1RVV29OTkZHN3N0c2o4?=
 =?utf-8?B?N2Rjc2c3ZWpIZW5Zd00wYXZSWVU1T3MrRGE0alJwWS8yc3hpTDJoMG9qa2Zq?=
 =?utf-8?B?TWtpTGtpT3prTFFENDNrdWFhd0wxRU05WXl5SEI5NjRZbUx1TjZTRW9iOG5w?=
 =?utf-8?Q?FKZD8VCofsPUAOsR7RHsqinf6YSZDUwX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjVsWmEzYTYySExsY0dnd0Fmakk0SXk5ViszMUFEQ05nWndrYzJwbXhOZGUx?=
 =?utf-8?B?RkVzRGFJRmNseWF6TDRFaTU5NVB2K0JIM1V3N1dWamJlSS9MNEJuV3FyR0Z0?=
 =?utf-8?B?TSsxNmNSK2VXeE9zUTljbE1ZZHo1SGdPaXQrWmY5TXFDcGFDSXlCOGNJWWFj?=
 =?utf-8?B?S09SSG11MnhNb2xsWmgxc3ZmdGNYSC9jWlZ3L0ZVYU04M254SjMwVlpNc3Yz?=
 =?utf-8?B?MnVuZ043ZHhEZXpWT1pqVmF3VS9ML01UcE9Hd0dJTzI1Mmdxdk9xK0d5cmVM?=
 =?utf-8?B?bWs0YjlYZXRSS1BZSVZqemZDMnoyWHNGNjZiMlkzem1McUhmMnJsN21VZG0v?=
 =?utf-8?B?NWd3RlRtMHIvS2gxTkg3RkF2WTNONkN1YzYxZHZGelhaOGlURGZtQldNTXl3?=
 =?utf-8?B?L1N5c2phWWdzcTlkRnlvMW9OM0RJMzlVeGNMOXlZUEtGbnpZQTBVWWlnNEFz?=
 =?utf-8?B?NTRoUDRFSkk5NURtNlRqRjR1TXBLb0lpWWVRd1h5TWUyOXIxUmU5cEtESk1u?=
 =?utf-8?B?YjlaYWF1Ti9tTVBvUTZrbEMvcmJBQlkxbUl0QnpDajhCdGkrN3pIbU50UUV0?=
 =?utf-8?B?YUZvN0F2NXU3UHlxa2NicG9BWGRIQU0rVHBXNjNMZk5QWjd0em1NUGFGTXor?=
 =?utf-8?B?cEV2NW8xbndZUm4xa1pjK0dlclplOVA3WlJqUTFmL014T3UwN3ZyRjJBMkFm?=
 =?utf-8?B?eGpDanNpbXJsSk9TNnhjTU9lMS9ZL0tEbXdwKy94eFpsVEdBQmkvRUpHYVRa?=
 =?utf-8?B?RlcrcUJNTzdFK0JwYnR3WU9kVnh2OFFxODlmMWo1bXE0SHJ1SWxGVVNIOFhU?=
 =?utf-8?B?aFJXK3MyTjg3dnUweXRSS1dsejlITW9Vc1JZV0YzUDNCVk14YTJXQ2EydzRu?=
 =?utf-8?B?cm42SHZQMThlclJEbXA5MjdFamlVRG9pRDF3dWNXOVI1VkFQZy9sNHo1L1hW?=
 =?utf-8?B?S1I4TFJpMmJucGRIV3A3b1dqekN2YnlkSHcvTGdVUVlPUkgrNEZ2NzhWRnVP?=
 =?utf-8?B?MHpxWDdpT3ZsYmRzaHVka0RkN1FFdUkxcTVQa3ZLM1hPVGNtc2h1UkYvbWR5?=
 =?utf-8?B?QklQNmdTTDlDaUpicmJMbzdqOHErV0doTG8vMnN0M3NHdHFZUzVOMHRTdlJt?=
 =?utf-8?B?RTB5OUJmbUhxeU1TWFJPa28yeGhNWENQZEZxN3ovdEs0elZRL3B0bXllZ2Rm?=
 =?utf-8?B?Y21nTkRIUEtiQnplLzhUWWRBVUJxeG16eTFGZndycjFmc2p4NWUvbm5iMkVH?=
 =?utf-8?B?SnZ5cGhFTCtrVjhPN2h1OFEzN2VySnVuRUJOeHVwaWcvcWNSVTE0QzJVUkp4?=
 =?utf-8?B?Y1N1SGowd0hDTGhDNzIvUGd4MUYyQ01kcnZ0ZTVOcVVKUEZBbERkNHYxekpo?=
 =?utf-8?B?TGs3UUZ3bmJ6MjBvSEYydjZ6aUMwUzByQ3o1RnE0UmkySHFEMjRQdmdFa2hL?=
 =?utf-8?B?eGRIWjBwd2tlYTBncGowYVE3cDc5U0RpMnBZK2grRDQ0Sk9aa2dPQlpPT2Vt?=
 =?utf-8?B?a0xMaTRSbms2c0tTeC80NzZyeVlCQTJMdnNFdnFlSUhlZTE0OW1HRUNNRUJi?=
 =?utf-8?B?MTRBR0lwS25MVHFOWVZraE9uZm9xUGl4Z2xBcnpKa2NOcDZTK094cVBZNkh3?=
 =?utf-8?B?NnJnQ3orbG5sWnIzcjFzL2NHNlR6cVZSSUZQSTMwWitQRG5ka2lCcjFRa2lZ?=
 =?utf-8?B?cXJ2Zko1ajhtOHo5aEk2dTJsSjUrbTQvODVGbGI1WFAvRys4dHNFNFh1YlZR?=
 =?utf-8?B?eld1dm82MWozKzI5cktGdmFyODU5SlcrWUx3NFFXWHRZN0lrZVFGNUNMeHkv?=
 =?utf-8?B?V2pDN25yOHVidWd6QlBxZnUrdVdUQ25pdEdXUFhQRzNhTXhnbFpMQkV5ek9m?=
 =?utf-8?B?QXFsV3RCMW82bnpHc2RSczZaOFBZUVp0RjBKZ1lGTnFtNUw4bkFJVEJwaGNG?=
 =?utf-8?B?WnNNSkZnbmdUY3hhaHZLbThxUWJsUHc1M2dMV3dCMTl4V3lYQm0wV0hJTjdl?=
 =?utf-8?B?bjF2U2VnTUFYOC9jdjd0ZERQLy9Xc1FTTHJDNUhtZDNtQXVHODU4TVpwQ05K?=
 =?utf-8?B?S2VKYWxsY0tuMDcyMmxBemF4eEE3UzFGM04veUVlNURwRWU1U1ZLQWliLzQw?=
 =?utf-8?B?Q1kvVXcxcnZpWjNLYWNrN081MXVJNkxrOEF2cVliVnRscDRSSk9HemlSdGdr?=
 =?utf-8?Q?7sDUT2ByODpstdGc7lwEuNk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fa85b18a-102c-4e91-aa83-08de3351bac5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:25:25.3828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9KQNb58EIn7mj9mZwEKZBQvcGAN+6fBUP07rnYuF4Him+t2RJFmtPulcaBdH90LWsUZZ4AA4rrLEraZbw8V912ZbGG71iKiDfajbo3w3fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8718
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 17/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp135f-dk-u-boot
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

Hi Patrice,

On 11/14/25 5:23 PM, Patrice Chotard wrote:
> Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
> from stm32mp135f-dk-u-boot.dtsi.
> 
> Remove also led-red node which is now part of kernel DT.
> See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
> 

You may want to wait for the DT to be sync'ed with Linux's for this 
patch so that the red LED can still be used with the led command?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
