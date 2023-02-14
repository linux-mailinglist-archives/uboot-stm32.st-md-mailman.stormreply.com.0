Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 619F5695C9A
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Feb 2023 09:14:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09A7AC6A5E7;
	Tue, 14 Feb 2023 08:14:27 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2112.outbound.protection.outlook.com [40.107.241.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C796FC69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 08:14:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0lG2vNqxACNN5Lsn2sb0UpSP7sMWXSYHfkLpbo0rl/d6a2fE2sAtrFZU+vol7vcizgLA/bo6WbSa6udWnsavOMqF3H3AwQLxy5wvTqKZq38T/rSUYV1hn+dZBY/Hk4Ta/2BFEcwDEueWB1P86VfZnRhfehI6PqfLjG5umTwxLxrRWvEd6j3oLbLIUEJyvid40O+OVbMKPptUIUJzTZhHxnGNZK+IWscSBDiamTQQ5tZMUelXOcIR8HCmTbVQBxrhWQj2nRdDk68tNDATzUsA8APERc1jQoxn09jH7wx4BptgYK9smCRzb4wsZm2Dr4ApRbCsY3kikF4/5su5oC0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsIA4NvbHuL3Cln3R1kkw3BHHfwso4JjlNuI+li0B9k=;
 b=LDCOgHCg9+ANkSOBmiogscgBqbcxRe163iDBNyazrjJhsdrGjnihcjb3ZUoobKfjFlrxX3Cx5zgZfBSoy680mFMxjJCocrCtxSK1bvvm2Z6Ed/amwK21RK9Mou9QvVBxyquRQ3WcsPJF8uvXMAL9c3tsg6DeXAF3SIPuGEbgF7PZb1FYq2HFqmk7cQgWt3LZL7IdD5QBhD8lHcc4ftsSyw0ISqCi9YcoVTULctM0jKfczxaLaucWFvZM2yea0NtYk19AJfifqPVD5aSLdv29PCHenPK2zzFdch3oGXBgYWrfaWmS+P8FLZ3OslImYtkEwdY00K8SYtcTB6G6CVTtFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsIA4NvbHuL3Cln3R1kkw3BHHfwso4JjlNuI+li0B9k=;
 b=PvGDvAP6og+vy19t65rwVz+8DE/vCP7k+Xpr9C/agxzR87HxCFuRqabvTXe65vblQWlfi7Wx6HSFf8IGy/aNDsKcrXYF770xP0mG7YPoQ4NzCFgTwu1watUmyIT1RBEJI68B8VVgdAeISizBfPRqUbDyehGjjVw5H+vV2Ugjzrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB8PR10MB3627.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:139::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 08:14:24 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 08:14:24 +0000
Message-ID: <0dba65d9-6415-569f-b4fb-34b10b1c710d@kontron.de>
Date: Tue, 14 Feb 2023 09:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230213173005.913823-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230213173005.913823-1-patrice.chotard@foss.st.com>
X-ClientProxiedBy: AS4P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB8PR10MB3627:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a1d852-22a1-4803-5123-08db0e637b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c5K7SN0ZNRVzQmDwdn3Eg4+XIdHFN0VZTvOMIdMhpolfEdHe+S0F60LR8VtaeRnhoK+EkrUcBMy+Tg3z8wliQQsRDupbms7TKYGud0KOrkCE2ipAk4VlKAa3B/dxi5h13Ikvm7b27RkkGvA312Y5Ay4nlXYcvUDMSYniJ0PtE4aVMwGZX5b1Fvz3FS4qX3S/MsMUzW3PSbJiOY0BzFhUUBw3VyzCB5HxLOoAndjWUUd5+IJBjfZT4+de7GCcKky9vPh8bBlNb7wp24av1gkvrGPx7hY7g1D2rig7Rrp68hJiJC5qdKMTFDDOTR+VhGgfvgmw4w87w6FIEZXpsCEFkI9GTZIhd7MlX/ilyhejLBnAGScQWiBXozhTPMdwxyfE2TRqkSJ7c1ABLgUjRroq48tL9o1i4hEy3Qd4AZhfjA8K52tMFXQ2pp1sjVnGZSmOkYe+yjlb5Mhlul8HqvrHaMV1GYarM7fJ6RAHepvPnQ62EHzow/fywBEN/iB/2bqlXmN6wEJL/uigLvfPQgprqeecDiHqOy3vuDrl1GXoiStBZ/DCJr/2yuersruXlUYR6AfEtmzxVPZImbv2bGsdghcX1Ad1zLt0wtr9s6YNH0QyIMmAEgGXz7H9FZtTkAgKweFHAnjsAp32nemwv4IMGYSyEsvXY54BOABQux0yNuKrDOY75vGsp/uph7x93MI87VL16NbXYrCphMfgTKnHocwru9a5qfMk2vlscjw9RdA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199018)(66476007)(8676002)(31686004)(36756003)(8936002)(66556008)(41300700001)(4326008)(66946007)(316002)(44832011)(7416002)(5660300002)(186003)(6512007)(4744005)(6666004)(2906002)(6486002)(86362001)(31696002)(54906003)(478600001)(2616005)(6506007)(53546011)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzlQQ2ZDYktNU0d2Q0pibWtzUitHdm9jNDhHNkhVeEdJUnZtbHlVVnhaWmNS?=
 =?utf-8?B?TE9SYVR3S0ZmZm9UOUFmUko3Z2o1WVR2Y0NvaHNpS0hHKzFkQUp0bHB2M1pC?=
 =?utf-8?B?UHRhWW55T0h6T2c1ZGtUaGZjdkpGQWh1NkQ5K0ZKcllJeC9PVkZYNmcvUWRB?=
 =?utf-8?B?a2tGWGhrNlpIL2h3V0FjR0x4SmwvbmdVQXlSZE5zejI4NWRkaXg2YVlRRHhr?=
 =?utf-8?B?aldWYXlFNjdDeDAyaTJmeXZOSk9iTnZNNDVFaytFSzM0alp5QnhHTEc0M0h2?=
 =?utf-8?B?WmdxZVlGSlhFUEVRMy9xMWQxQlBVZ1dWNmtvZHJjK29tRkhrbnI4VjNWeWQy?=
 =?utf-8?B?Y21IampKc0U4b3VIdmhUT2lnYW95RFBUdTdPb05tT2tRNXI2MW9HanhYdS84?=
 =?utf-8?B?SlRPckhnbGZFaXVxN3hZbStLVlUrSUNpQkNWeU0rNkFKMjJuV0dKeXdpWEtW?=
 =?utf-8?B?N2VWZ3BHK1FGSjJleDF2SHhRTWQwQ1hJb3cvQ1BpdGVwRHZOYUhDb2dZSWMv?=
 =?utf-8?B?YVh5d0dzR2tsYzNNQWgvK25oTTZRaWR0UC9hOWNsRW5WVzJvNEs3VmRDTDF0?=
 =?utf-8?B?Qyt2cmx4TFYwalNONHhIRWRFMEF5aGxaeHRGb1VGOVNkcFNYcEMzSUd0RDE5?=
 =?utf-8?B?dzBta1JyNDkxRjJjaW1hTG1nbVhVWHBRaEs1YjJUeWpTbDF6QTY3WlM2S3Mv?=
 =?utf-8?B?aVAzZ2l0NVA3Q2tJblRDc1ZOWDFwZXE1US9sT29seUk0UU5zbGJnbHdDdEo5?=
 =?utf-8?B?T1ZmdG5TU1lDNC9UNXlBTnBlVzQ5Myt2SWV1WkcvSllpdkZpRkkzSERrbUZD?=
 =?utf-8?B?QzE3bDBZTXkxaThXSXF1NnZENzFjU3VialVpY00wNzJSRnNRcFlCL1dFeTk2?=
 =?utf-8?B?Qkx1ZTNDMGFJc3h2a3BEZHgzRDVhMVY5STByS21wMHd3aEZGQk5ZSm83N1VM?=
 =?utf-8?B?ZTYrSDc5Vmk3Zi9yNitnQmlMZUZ2WlhLdnFhN3pNSjJEY052WVRxazI2SUJT?=
 =?utf-8?B?NFNnMlNQYmNtTG1wUXAwcm40bXhyMzV2bXdudjF4MGJGNlpWZ25VYlMxTHQ1?=
 =?utf-8?B?ZE5OaUZMcjVOMGN1VnNldUVpcU1aWWRGdWc3NGhkeGZXbThMa21ISnJIcGJz?=
 =?utf-8?B?SkZDbit1UUR3REgvc1RsSFp6UmtmSU02blNheHZaejh0aTllaHJnK1FWYnhD?=
 =?utf-8?B?NkxMUlhmaTM5eUpUZ292KzR1dEVuOXQ0cGU0bm5UOHpuZm1OclJLa2tJOENr?=
 =?utf-8?B?NGQ0NGYrZEVLYjNjZDlSNHcxbHdXQnBVRkZUYXc3M3AzRUw0WVprWjZobDY3?=
 =?utf-8?B?bWRieGwzMVVUZ0ZQMk14WkF3QWQ2TVpBd21VK0NBcVowQ3VabG9tbGs4N2ow?=
 =?utf-8?B?U2xmZ2pCVmJYQXlmb2lQcXFLakxWcXFWUlZQZEM0Qlp3YjBHNnB5NzM1QmNF?=
 =?utf-8?B?V2x1MTVRSFAvd1NWZURwaXl3ZkZ3eFAyMmhoRHlnbElNMXdlQ1k3aFpvQnNa?=
 =?utf-8?B?cnRpU0dWbzdKajRWZ2VZSFpja3RRNWpuVEdaNmRTNmMwUGdLUVcxQWNTY0Y1?=
 =?utf-8?B?cVhMbHRnd3VFTDFESXhpdWVsL09XL1E2MlNER3ZMQ3RHMG1hbFVrKytsQmtx?=
 =?utf-8?B?QUc2ZTVoRUxSTFdTNEdWVTB4N1MxMGgxTjhoZ2ZBeUZrUmFzcGphaFFXRmRU?=
 =?utf-8?B?MUJPdVlGYnByM29YcGhZRVlYc0N1TTJDQ21QOWR6STI4T1MzaTNscXRSazhq?=
 =?utf-8?B?NERNYmFYQVdPSVNpYzBuTG51VEFzZko5UEpOeUlzSzE0enMzdUZJMUdXVURP?=
 =?utf-8?B?VDFrcUZoREVJcGlqOXliSi91UVhwUzNWbDA0dzZFVzNmR1oyMHRtYytFOEVC?=
 =?utf-8?B?d0ZMUzg2Q0JlemY3QVh4WHJ2dSsycE8yNGw0MjBXVmNyZTd1T3lXdDhYRDYx?=
 =?utf-8?B?azhvbHNheEpNVkxpa2dSM0JoMkNYVnRDZmlmTzh4a3dzaGs5QUswd3RiTjhH?=
 =?utf-8?B?eEs3Nkh2N0ovUVJZVjFkQkd5V3VxbGpDaXM5L2FTM2RESVdSWUkvWk15a1A1?=
 =?utf-8?B?cjh5TmtuODhPUjJkL0x5bWxqS25wcVZPZVROc3R4Tms5dCtiSExrK2FTNG10?=
 =?utf-8?B?Y2xHalp4RDVLUW9CMVdhd0VCNHdpV3lKUUZYakgwMk5pU0NucXBVMFEwY0J4?=
 =?utf-8?Q?1q/KgYBYuWX+1p8NhfAGY/zXFro34/93Z5JwJQZgeAos?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a1d852-22a1-4803-5123-08db0e637b7c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 08:14:24.0602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9j3rMDzBBB5ezigCTy5TtMQSMGoFhrNGkkvasYlSBKL2kiMSB0sw3lvs6e72Ctork23MQKrbxUu4M1lAYxhdFZKHl2EYRYx9/9ZSiaE+Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3627
Cc: Boris Brezillon <bbrezillon@kernel.org>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 Jagan Teki <jagan@openedev.com>, Peter Pan <peterpandong@micron.com>
Subject: Re: [Uboot-stm32] [PATCH] mtd: spinand: Fix display of unknown raw
	ID
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

On 13.02.23 18:30, Patrice Chotard wrote:
> In case ID is not found in manufacturer table, the raw ID is
> printed using %*phN format which is not supported by lib/vsprintf.c.
> The information displayed doesn't reflect the raw ID return by the
> unknown spi-nand.
> 
> Use %02x format instead, as done in spi-nor-core.c.
> 
> For example, before this patch:
>   ERROR: spi-nand: spi_nand flash@0: unknown raw ID f74ec040
> after
>   ERROR: spi-nand: spi_nand flash@0: unknown raw ID 00 c2 26 03
> 
> Fixes: 0a6d6bae0386 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
