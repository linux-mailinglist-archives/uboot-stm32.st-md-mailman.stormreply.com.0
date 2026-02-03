Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OItiGx/dgWnWLQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:33:51 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC3FD86B5
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:33:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC9ECC87EC6;
	Tue,  3 Feb 2026 11:33:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011019.outbound.protection.outlook.com
 [40.107.130.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2E0EC32EB0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2SPUs4hro8l8/rNiVqd7jaaPBT0KfvgJY1gFjA0WI1jkHT07cf1UsmG30213PLN4gRRExYaqN9bmtGp2Rd0PiuDGOSuN/x5a67w++Q1JbnpmF0zcmiC4kWSbVXZix4phNwVCO23jdQxjRVVvmBtbEmHcHTJe8EsYr9ga4JXemjovYDKrcuVJR+cOgBVzJ9eNSPagdmFnyRmJl1K99nmnkkmP4lvbypmwN+Mooc+egvj1WHqd9tHMee7dnd1cb3wV8wbjOVGVKG+WgpuVrzKlnDDy9cK2jHBZck0F1b43dkdBu7+FnkeUpzAd7To6yL0orU5XQq5+9d4fRovasQq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dxbr7uyv8Xqm+u1OsX4NFT/MEzMSpSPFOaM6+KTG3SM=;
 b=V9d8emNnG36Rkrze+XOmjjzuhh5hNy5JpSI/P+i2asgFXqFod2z8q5gcXTqKbeoOp23cpwcRYqp6nMlb87KpJMFbpTXHk7Zr94r1C91m2a7ZtskoE8nNlet7TWT2mPx8Z1qz5cl0KO5diQvolr5BZfaUqN1I3nGJ4u58KPM3IN/UoisSPE25YjjE/8zVu1GllUjU7nPmf3TT87RA+O4+nslF/sgaK3GJR4LCLsYXjmMu4B77yNUHn8nHakUBcmfINUFPG9nhwoZJoIFtks4hp3AtgD26oGK9At9St/gdlwrFWcxodqVrWKJeJoL3WWwzGQbND2uZgmC6LdUSaJmzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dxbr7uyv8Xqm+u1OsX4NFT/MEzMSpSPFOaM6+KTG3SM=;
 b=s8Ho8occyhRin4Qbp1RkHNYML29XH0dVtplZ5x02MVzl+5HnRT3VIjPlEq79q7ZDzd33u7ZtUklnh3YLbN+CSH5plM+PYJOelTmYi3T7F8fPOBaJq0p4QD/e4OaCo2i0dhBbhZ09bcTBA+rpJGQ/pTn4pPPTDfq1oEP8z8hSCwEzQVJFZkZyuxdZgB8d2FodClKcARw56fHD/kH60+hRJkyLq9PnMnzyORhYHJifIzIfHolcOdkl3hsAkPi7Ro/1vzf3PrL+iQjxIazJIEodta2WxwocVYx8JfcOBG3Rm+qUVA/69uq7ZzvyVORkogLfc/779otN1L2w735B0JTz5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB9125.eurprd04.prod.outlook.com (2603:10a6:20b:448::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 11:33:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:33:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 19:32:07 +0800
Message-Id: <20260203-cleanup-v1-3-732e986039cd@nxp.com>
References: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
To: u-boot@lists.denx.de, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Christoph Stoidner <c.stoidner@phytec.de>, kernel@puri.sm, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, uboot-snps-arc@synopsys.com, 
 u-boot-amlogic@groups.io, u-boot@dh-electronics.com, 
 upstream@lists.phytec.de, u-boot-qcom@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee54c42-07fd-4d4d-e812-08de631814c6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K05VaUJ4cG82Z3FLVDB6aXEyUERhNVBYNDUzT1JuL3BFWXJldVdrZlpDUGI4?=
 =?utf-8?B?UUZsaFdxTitIU1MwYWNsY05Cc2huU2w2QUxVeWVOdGFPV1FKeDBDZXlrendz?=
 =?utf-8?B?REsvSXBISGNlV2NtelpBMFhzc2hJUnRBdlBqOFhzaWRYQ0xjK2lYM3hnL1l5?=
 =?utf-8?B?cDBYUjJkMjdwSExYc1ZnbXd1LzZJSXNCTUFZcDFrYjFWZHZ3NGIzUVdCUVhw?=
 =?utf-8?B?U3pYRUgvckRreVhjeVNLSFVocGxxcEYyalJZQWthbm40QlNwREpFOSsvcGtu?=
 =?utf-8?B?cVhzQ2ExcjdJY01qYkVqd0poZ2h3SC9nb1N2dWpSMURLd21DZWFPUXFaY2JL?=
 =?utf-8?B?WlJrN2NkbHFuOW04WjNDK0pYeC9kZUwydmNtUmsrMk16eXozR1RxZTRIOFUw?=
 =?utf-8?B?T0ZUVXo0RDNJTGNsOE94aGkwTktIS2VmWk1nekFMNkk0THRVVWdVUmxuSGtI?=
 =?utf-8?B?clVDRytYODFJQmRDUWo1UmR2MUFYNGJBbmdscU5PZWNNSHlIeG8zNVFmQjQv?=
 =?utf-8?B?cVBBUURsNUJRaFNOOW5BMjhoTllCbzNJYXg3Q2xQLy84REg1QnBGRENuRGpm?=
 =?utf-8?B?WGJqOG5YZWNzTUhEOFpBL04vaGpKYlVvdXpYK3JYQkNUb0hIYmhIdGVQTjZu?=
 =?utf-8?B?dFhmMFhMcHQwc3BzMFcxMllBK2t4c01PSFRPbTlSQm5oZDRuK1MrVzg0RnJL?=
 =?utf-8?B?V0RHZ3dUWWpxeVR2a2ZmbU5pWVh1b1R3UVIzRkpHSSt2TlZxcS9CNDNCN3VQ?=
 =?utf-8?B?b2UvejdVT1ZIcUZUSUVyNjN6eEh6WGNLRTBPdnNpS0F5NmszSGIrSVlCbU4v?=
 =?utf-8?B?T1pSaWh3SURCV0pkeTg2T3VTQ1pTc0xPNTVWMkRlSGlITkFKT3V6bjdmUUIz?=
 =?utf-8?B?K0JoNjJETjQyRlJkRnpmK2dZOG16cks0d05LYVdkNnh4SWtrY2tHWUJWRnN5?=
 =?utf-8?B?bDlGQjloMmtmMU1wWWtIKzh3M0xBTmVjbDVDV3p1YXZodDNoYWs4UTRXaXdJ?=
 =?utf-8?B?MGtaTldRb1c5bk1uclJUalpNeXI4R2cyNFd1bUd4aGEvYnJFSnlaQ1IxWE9F?=
 =?utf-8?B?UUU4M2dvQm1hQW5lTXg3RnZoZjU4S2VTMlNHZHlHZDY3eWpzaWhRMmE4RnJF?=
 =?utf-8?B?UllkTjQrVWQ0OWliN2gxbWhOTFExcUlLUzRnWldtV2laMHhqWHpJNkZvM0J0?=
 =?utf-8?B?K1NnL21ya2hmcFprM3hTaTYwOE5ac0Zvd0pIOTRyMXNCL1BZU0Exak5YQnRG?=
 =?utf-8?B?bm9ORElSamxQTVBpVm5hVk9lTWlDNDlYVytCenpZQ28wZlFzUEp5WlhjWnpq?=
 =?utf-8?B?VEZtTEllRDFyNUs1NnY1VURFSk9reTdQNElTQlMxb0wxYytsdllJbko0UnRn?=
 =?utf-8?B?bUNNcjhpTng2WEVtbGRxMzRmc2M1SCsyeW1GeXh6aGpjbUlXOWQ3dDZoZDYw?=
 =?utf-8?B?U0hVNUhEeHozS3FGOWtIaFNMTncvN0k1NHJiWTlFWGl0VjRMUTdYUUxyWkp1?=
 =?utf-8?B?eGExdkpGdHVoZit0VmVVWnVtREw2ck1XMmRXNXpXejdKSE1BblFVangxQ25I?=
 =?utf-8?B?TmlKaEVqU2NvMkx1VTJlSFRZU0NBenJSWmhDaFNLOEhyM2hwWVFuOVowZW1P?=
 =?utf-8?B?WDVKSWUvZVN2RFFqSWR4dldjN25vQ2NyK2Y1aHNEWXFya1haS2JBc0gyWnBh?=
 =?utf-8?B?WU1KUGIwMkFFbm8zVVFFcTkvMU5UQkxtU0tuMTMvWXhUSzZIQnFBU1JGWkw3?=
 =?utf-8?B?SGVSc2dERWVOTjZVRmpxcnJUbEE4b3IvcVhYOWNiRjdXVzAyNVQ2ZGRiUGFJ?=
 =?utf-8?B?YTZzZnBPWGFXczVjVW1HY3lxSENSMThDNWRCd1RQTktYNVNYb0lCMjRGaC80?=
 =?utf-8?B?anI0b0hKRVZTb1JyWENYVVRTb05LRjhpTzBJUWhHYjc4ckh3R2RvQm8rWFJW?=
 =?utf-8?B?blV3TWJKVHprZWJqYzd6K0JkbVMxSmg5MTVYanV0QWtMT3liek9VTUt6Umkx?=
 =?utf-8?B?d1M0TUE0SVcrTHhub2VwZ0ZvbjFVcnk1ekp2WE9ERHRXTWZJMSt1RG41QjBB?=
 =?utf-8?B?dU16TXp6R2NCZTNReXZlWDQyNFNGd2JuZXhYRUt5S1ZQQklTSUtYc0JoYTlU?=
 =?utf-8?B?ZTJmdTVpNU1CSGQweTBpRXg2d0FVTmZMRFQ0TDZja1dWUGVCZU1WTXB1TjNE?=
 =?utf-8?Q?LGId6Bbl2Xbyni3Ub1HxF4ui8YfKohGyq+9EBKyOxhVg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGZhVy9QaC9qNkl3VER4YVowa3JpMllhQWJDZkNHdjZscXFjbGxqMmx0SzNW?=
 =?utf-8?B?UGJUSkdmRndqZVRwT2lWRGVjNmJxVWxPNUNST0RoVkY2K2Y4R29ZS2JSRHNS?=
 =?utf-8?B?OEJUaW1mUjc2dEVHYnNUUXpZWldEcDAvbmx0S25nV2ZONzcxUWIyaUtIRzVP?=
 =?utf-8?B?TkRBM3hGUGtTclZBbXhjUEc2VTF3T3RwWUFTRWh1YzA4a043d0xRd3ByQUU2?=
 =?utf-8?B?WnlsanJ2bE5XUjhqQ0VIZUlYQU9XWkIxSktHbnZCbkhBUVM3UkR0OVJwckVS?=
 =?utf-8?B?MmIvKzE4YlJBdjQySUtYM2JjUlpXdlg3RTB4bTBEd3UzZ2dUSUp3SFo5bFlw?=
 =?utf-8?B?cEdYR3ZoVmVRaEtsRUxHYjZ2NkE5UDVsLzdibnRSZW9LNlRJcTZIOHF6NjJp?=
 =?utf-8?B?SzV5bEQzeVgwV2YzUnUwUHhTby9DZmRMNEdHOWNvaTBQRnl3a29LRyt1ZkxO?=
 =?utf-8?B?VHJmdDZkd3pDWWpJend3NDBZTHJDUTR6OXdUMFlYeXBSNGw2aXhSODVWZmtP?=
 =?utf-8?B?ZytiZmpPZUNZUzFKVDhjMVMzNHJqTVFLOWtSSFhNcEhqZ2E2MGRBWnJwTFJS?=
 =?utf-8?B?QTdoUUl6K0ZUdWd3dkw0WmUrTmljZS9DM1BBa0hWK1NzVUJkVzJGazE2L0NS?=
 =?utf-8?B?VFFWdzJObWlNbUxvUW0vL3E0N1pFSUxCZ091NDZVajFqS0xUem5zaHJBUVFL?=
 =?utf-8?B?L0kzNksxZHBsbjRsODc5Y29DV25wNG16czlNT2U3d3A4YXNBTXc4emNFdERi?=
 =?utf-8?B?Y0UzTFNsaU83TkZ3MVUxczIwK3F6VnFVTFI2YVd5MWUwOHNIcjJyWk9PS2Za?=
 =?utf-8?B?Q1F4SWpaNE5GMXpYOUpJcnlzai90NWppYW4xNTl3Y3QwYkc0MWg3R05kWVB6?=
 =?utf-8?B?NEVZUHRJeHlZQ0FtNlFKbFg0UVYrNm05bHJvaW1qZGxnR3R0eW9aMGVXVXNU?=
 =?utf-8?B?TjM2bUpINWEwenpRckhxRnVjbGdISElSakpsZVFHT01hOVIxZ3JROFVaQ3JF?=
 =?utf-8?B?ZDY4azYxOFhoQmNQQWJxUC95cXN4Ukc4MW9mK2hVZ1lzWitWSUIwcTRLcDh0?=
 =?utf-8?B?RnlrSXRocWEwNkJrakZSdEdTY2R2dFBiN2dZanFMdGlDR1FOb2p6ZVJiWEIy?=
 =?utf-8?B?eTZ4aXBiZUpiY2dNYTBuWFk5amwzeEdNSkFOWjFVOHZYb1l5QnpPejNVZTBj?=
 =?utf-8?B?WGs3OXZVWFNUYjNTODh1bkFsQ09MTnNob0x6cmRJWFBMSEczUWdpQnFpdGNM?=
 =?utf-8?B?eHVNTFhLVEFnclZaSGtkc1RUenhkZTRGN3hwOWxHMSs4dXdEMzZSTWVJTVJ3?=
 =?utf-8?B?SHd5NXl5SjdFZk4yTURPU1dqSXowNFphSFVWOFZxRUFMTHNwYnJ1LzEzdGlq?=
 =?utf-8?B?Z3FvcWdFZG1aRzI0dEZ5SWQ2cGM2bXltZFdxc2FzYkJ4U0JyS1dVNlpJMUxk?=
 =?utf-8?B?UGVHYW9wV3JJNmtKM0xxRWJnY1ZraFF3VExWRmc1bGVnTGRwOEhrbUNOM1E3?=
 =?utf-8?B?dVpRYWtDcVNiWFZLWXJmLzRtUVZBRkhHS203WVhmSHVuQlBZc25aR21XZ1N1?=
 =?utf-8?B?WGlEeUNZSklMUVVoN1NyUHlLRlJVYUFqVGo2bDkrbzZBN0RNaURibWtCVjh0?=
 =?utf-8?B?azh0SC8xRVZxK1NRM2s1dU8xdXpJdnZzMlFkUkJNV1BMZ1l2VGtUa2krQS81?=
 =?utf-8?B?Wk5Ma0RaanZDK2ZTN25LYXNPaGpnNkMzTUdPWFdJbG1YWDJ6VHROaHZWeXly?=
 =?utf-8?B?U2l3TE1NcXpRREVlZGxEOXFOZ0wrc0lhbmhHa2FybkdFdDg3UGlSUDNWc3pu?=
 =?utf-8?B?RGlvVnVWK2IvT25lM1FOTDA0QzB2Y0N6bFFjdU1FZkdkTjhiNWpjTnJRMnBO?=
 =?utf-8?B?RGdpNW5GUjBiZjFTL094UU5WN2JpRStrVUdIQ09CejZ2THI4T2dGbjhXZWp0?=
 =?utf-8?B?WlhPcm1LMXd5NzNuOStsd3hFUjkwY3ZrTFdBTnZ0ZzBCems4Y3hnWlUwRURp?=
 =?utf-8?B?aE1FdGw4bmEwcjhsUndXT2NSMCtmRXc2cjhublBzYXRQb2hkZVc0VGxJT2RI?=
 =?utf-8?B?L2ZyMnVNQ3ByQWtlSWg1V1BSam9CTHZJeS9hekRvZEpnRWlBYU51K0ZTOU9O?=
 =?utf-8?B?bmQ1VGNnM3pWWDRvSWFxNUdNRFBZODA0Zm9ja1ExNkVVWWlidHNISFpRKzRh?=
 =?utf-8?B?aDBmWnpRWHM0NUhPRDUxc1VObTJWWnphTE91SHpXZ0tqcUxwU2FlWGxuU3BJ?=
 =?utf-8?B?ejkvUzFmZHJvWEdjTFhONVM0eUZuN1VUc0JLYU1YRkJadWJtbUd6U25hS1gx?=
 =?utf-8?B?dFJieDVWNXZaZFI4b0Y0UEthcGlnTUh4a016NUlMT3JyRityS1N5UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee54c42-07fd-4d4d-e812-08de631814c6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:33:41.5284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBNiMOxU8NdKmw5OOvwf03AVMWLOpDtlEVP34ivWkCdk4lYck5VVGcP1pUWsqP+OjRE/YD2V7euo55aTSqMegw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9125
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Angus Ainslie <angus@akkea.ca>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Finley Xiao <finley.xiao@rock-chips.com>, Zixun LI <admin@hifiphile.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Swamil Jain <s-jain1@ti.com>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Eoin Dickson <eoin.dickson@microchip.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hal Feng <hal.feng@starfivetech.com>, Marco Franchi <marcofrk@gmail.com>,
 Neha Malcom Francis <n-francis@ti.com>, Ramon Fried <rfried.dev@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 E Shattow <e@freeshell.de>, Sam Protsenko <semen.protsenko@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Teresa Remmet <t.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>,
 Francesco Valla <francesco@valla.it>, "Lukas F. Hartmann" <lukas@mntre.com>,
 Heiko Schocher <hs@nabladev.com>,
 Paul Geurts <paul.geurts@prodrive-technologies.com>,
 Tingting Meng <tingting.meng@altera.com>,
 =?utf-8?q?Timo_tp_Prei=C3=9Fl?= <t.preissl@proton.me>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Leonard Anderweit <l.anderweit@phytec.de>, Stefano Babic <sbabic@nabladev.com>,
 David Feng <fenghua@phytium.com.cn>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Jerome Forissier <jerome@forissier.org>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Primoz Fiser <primoz.fiser@norik.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joseph Chen <chenjh@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Sam Shih <sam.shih@mediatek.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Mathieu Othacehe <m.othacehe@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anton Moryakov <ant.v.moryakov@gmail.com>, Mahesh Rao <mahesh.rao@altera.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Alifer Moraes <alifer.wsdm@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Brian Sune <briansune@gmail.com>,
 Leo <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 David Zang <davidzangcs@gmail.com>, Ian Roberts <ian.roberts@timesys.com>,
 Simon Glass <sjg@chromium.org>, Osama Abdelkader <osama.abdelkader@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Mario Six <mario.six@gdsys.cc>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 Yannic Moog <y.moog@phytec.de>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Dhruva Gole <d-gole@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jonathan Humphreys <j-humphreys@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Rini <trini@konsulko.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Bernhard Messerklinger <bernhard.messerklinger@at.abb.com>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Wolfgang Wallner <wolfgang.wallner@at.abb.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Adam Ford <aford173@gmail.com>,
 Sai Varun Venkatapuram <saivarun.venkatapuram@amd.com>,
 Wadim Egorov <w.egorov@phytec.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Harrison Mutai <harrison.mutai@arm.com>,
 Aaron Williams <awilliams@marvell.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jeremy Compostella <jeremy.compostella@intel.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Rick Chen <rick@andestech.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 "Guillaume La Roque \(TI.com\)" <glaroque@baylibre.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Brian Ruley <brian.ruley@gehealthcare.com>, Peng Fan <peng.fan@nxp.com>,
 Marek Vasut <marex@denx.de>, Hai Pham <hai.pham.ud@renesas.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Randolph <randolph@andestech.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vishal Mahaveer <vishalm@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ilko Iliev <iliev@ronetix.at>, Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Patrick Wildt <patrick@blueri.se>,
 Adriano Cordova <adrianox@gmail.com>,
 Martyn Welch <martyn.welch@collabora.com>, Keerthy <j-keerthy@ti.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Anshul Dalal <anshuld@ti.com>
Subject: [Uboot-stm32] [PATCH RESEND 03/14] common: cli_hush: Include
	vsprintf.h
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmail.com,m:n-francis@ti.com
 ,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@forissier.org,m:SkyLake.Hua
 ng@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,m:michal.simek@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[195];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,blueri.se,postmarketos.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 0EC3FD86B5
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

sprintf is used in this file, so include header vsprintf.h.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 common/cli_hush.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/common/cli_hush.c b/common/cli_hush.c
index 7bd6943d3ed65bb24c709af0b195825a26d65f39..fb087960c9206b1e7fe4454bae53f6bc1cec1bdf 100644
--- a/common/cli_hush.c
+++ b/common/cli_hush.c
@@ -83,6 +83,7 @@
 #include <cli.h>
 #include <cli_hush.h>
 #include <command.h>        /* find_cmd */
+#include <vsprintf.h>
 #include <asm/global_data.h>
 #endif
 #ifndef __U_BOOT__

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
