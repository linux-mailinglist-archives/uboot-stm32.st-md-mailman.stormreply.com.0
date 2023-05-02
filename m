Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029B76F45B6
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 May 2023 16:02:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B4B8C6A5FD;
	Tue,  2 May 2023 14:02:21 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96B77C6A5EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 14:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6kUnaWHFGFBl8bU2JsWcMcC48E3zGMPtNPtEYgHrd9hx+5YCVv4g4CuRN7QXKStxkO6mtE4GH4FfSEBcG4j7MWLVk/QwaQRqskcR8iaGE1weAYLg6OVjgl0dTDe3jxGJH67Cni6H4lUOJy4+SA8i9YtKNtG4tjURmxgw+jbi8vPMoAf50R1UOUZRKQvv0efnGHfD7v02BREKeJLhvof0RFxaBxn2Y1EUhbEPTCphlH7RjL3sbiwk1p98Kdd2kCnncsIyhGvx03v9aZnI2CU598nvTIfRtJbVgqqqQR6jt/18deSEV1zurbLAbGNB8GJm2bdd261DJT6hV3qgxMBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcKT8c1BF6zOhylHweYuEOJgde+883q6+odwfSjFYxw=;
 b=PNPWd4qCBTqEjH0mDpE1i0DL1OyEDPVPet0zQY4DHUEJPPai19YWoaHMM16A+lyPonEO1doiozf/bu9m+l/QwnK04VWMw3pRVJM51oMG92jYvLihk0TZ/kyaq72twM801/TNQjIHaOAhKz8mcWiMNeXzj6olWdSVLPAiTLDeqN8D0l2u5FhvOl0GWyXuhd5Tvnm0FTOMZJQrYwT0Tk46tlEOOQHV831G6FOMSgG+0eCQirckziMPLDyNV2AfpDnLrgu35BdLHecL2Vl0FDmqpak4wpPY1QuCLrNqaZYU/QXSxybTEdykN3S0B5XaY7oZnet/g+sBmg1ZSwzwcx+Q7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcKT8c1BF6zOhylHweYuEOJgde+883q6+odwfSjFYxw=;
 b=dy7LwGwH77a7wI0N96srj9+PqUOehJvtAkXPlm2wsEkO9u1t2rxOGhmH2LRKbqBsmYub4g5/j2+azHE0WMTUPeERT9674KfWCxPyXm7WeBPirZaWWjJfere31FQ+5ow2a3EM4cxL/mRkQXK1/jTOG34hzdE8+vqN5RTgjjmMXzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 14:02:18 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::20b9:d472:1981:cf94]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::20b9:d472:1981:cf94%4]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 14:02:18 +0000
Message-ID: <6b4101b8-c047-b8aa-e54b-e8eee03fa2fc@amd.com>
Date: Tue, 2 May 2023 16:02:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Roese <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20230427203726.11835-1-ivprusov@sberdevices.ru>
 <20230427203726.11835-7-ivprusov@sberdevices.ru>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230427203726.11835-7-ivprusov@sberdevices.ru>
X-ClientProxiedBy: VI1PR09CA0067.eurprd09.prod.outlook.com
 (2603:10a6:802:29::11) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 2123de59-536e-45a5-3cb9-08db4b15d708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWmQIZhKgeoPqyUVUL9QFdDEvn0gi9iqD6f8Qkrcdb7hDNv9S9o1Jiq69Apm+obLyi6/AjeJY4GWeYfjmyDUEOaBYUT4ls3CHt6v9AaPWC0/zLWtL2QcPDz99wAjO9L28Vv9UNAFDkF7b/qLoJg9LnIEdXJFTMqjLqRu6Qut3X8NdsT59jnBBDHhp3EvfuQLmDD7jKIWEZGjbUk4tqzf0VEgHol2YtJdivxIWUsCgvp+mJOSZVAgH8N0uRyYR+oAz/OOdjYvU66M4qh675ixb/SmKLJhpgFCucQONBjwpyD9Ipdhnl7maScUjVrzkvuwEKpe4zj75WcItIProhMgUJshO4C54mPCZGJ4+vLAc1NA83SUKKAA0W1FPX35UX2QPD9Go2Y9sKvOHHB2LobcEcSOYby3l3Wu4UNFapdApOxrh5Mm9mtgVkf2kzak2ZKcan0fKRMc72eOXnERb+s3UWZpWGVB86qBkK2d+OeR0Gb5/xF5cE6HiiJbgz0qUwhkliA2ZD6KG58vTR23eilZ/Lnw4dbzLM5L86mwQzg+WOCWb1phyqw3s68xg6ahWgpXB3UFnfciYnPGFfydiHvcczNbiMfegupdyUkBohkNNBe7tgEnmC0hfAFumgyqhgxBBsYVPZkzO+XFUrDanbXg5Sa6/jSfGZnbZff6vgPuCBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4758.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199021)(478600001)(110136005)(316002)(66476007)(4326008)(66556008)(66946007)(36756003)(26005)(6506007)(6512007)(2616005)(6666004)(6486002)(186003)(53546011)(2906002)(8676002)(8936002)(7416002)(5660300002)(44832011)(41300700001)(31686004)(86362001)(31696002)(921005)(38100700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnpRZzN3VXg2aG1xM2luSE5GWGlNZ1dQekFYc1F5TVVwR2ZWNVc1SENrSDNq?=
 =?utf-8?B?eXAybHRsUENmWWVrUWVDUmN2Sms0cDU2dFRhTUdmQ1lxbTZUY2hJemtRdTVo?=
 =?utf-8?B?UkptV3RuOENPU1ZMVGY3bWt5empsdERQbjU0QTF4cGN3MEh3RzZXdDFiTC9O?=
 =?utf-8?B?U0RNVmI5aDRLNlQ5dktJYjZDT3F3a2krZjgvOFFYRjMrWTV5MG55cGlOeFRO?=
 =?utf-8?B?N2FaY25ESXVSZ01IRnByaE5jM2VzM09ucG1kYVc0Vmh5czM2RzhCZVh6YTFO?=
 =?utf-8?B?YzNtOGsyOGorNC94UjMwdkZkTWhTMFVhYjgrTVp2aDM0WnhkVklRMUtpQllW?=
 =?utf-8?B?Z1VRYTg3c1Y4bWdtKzlPbjIxMkV2M2QvMGgrWVRzK1BreU5FR3hJNG5MTUpj?=
 =?utf-8?B?YjJJelV1WXZEVHI5bGxUZzlhODBVbjlYVzNnejVUME9kdHdDOTQ1RXJxWEVn?=
 =?utf-8?B?Z1FaV2ozWHJzSm9NYmRhZFdiUy9xMEFDWEN4SFd5V2hDeW9YQ3Nub0NrK05u?=
 =?utf-8?B?eUswVTdyYStpWnhCdi9WMzJpaEVHR1VFaE12eUszZnVtSjdhbDA3U1Y3b3U5?=
 =?utf-8?B?TU1JOGZRenhGUlZ1TUlUN0NxNGcxS2FiTjM4Z1Rldks0enRTQ1U5TWdwaW5M?=
 =?utf-8?B?YVp3S1l6WTc0NGFDYmMxbFZYd1RuZ1FtQ3Q2cDh6M3RTay85RUZPRW02NWkx?=
 =?utf-8?B?WGJENzRKNjZWYm1SWmZxZGZubVlxUFpZU2VMTmQ2WUpJVHZDc2E3SnBod3VU?=
 =?utf-8?B?SzRGMHYraFhwaFp3RzM5OXRvOStPbUlydnFHMU95S1l4OTk0bUtKWjI3M3JF?=
 =?utf-8?B?MlUvU2dnRmxOd3kzcGF4QWtpbURXcU1TOGY4c0JwSTlpbGVwM0dNVnJvTzBr?=
 =?utf-8?B?cTk4dEZoYWN2M0tVY2NKZDJnd1kxNG9RdVd5Sm1kQ3J4Mk9uaFJROVFoMTVM?=
 =?utf-8?B?d2FXQnFMZk41QXBnSzhoS1dxc0s5K0x2ZjZTSDQyaDRjT2cwSVBnM2F6d1ky?=
 =?utf-8?B?eFNOZEFPdzV1QTZ5S1B0STU2Q3dTd1A4N3QvWlNjd0FJWVVRSndIdW5SUmJ5?=
 =?utf-8?B?RTFKa0JvSmNaWXJELzY2aUJJOEw2cG9uUGpDK1dpQVlkeU0rZDI2MjJoM2RD?=
 =?utf-8?B?aC9BMDNTaDltbzA5SnFUbEIxOTR2RXRsckhhaXFQbUJLTHYzSzNqVzR4WmNU?=
 =?utf-8?B?MnphL2tqTmt2bU1BRjdEcjFaUjFQZ29SZXlJSXdiUzNzY3VCbHBDdXh1MGJu?=
 =?utf-8?B?K01Ua011R3VhYktDZkplOHM3RWluSWNmQndjZ1lDWllrRlRlcjIyejM4c0hN?=
 =?utf-8?B?SnF0Ri82U0hVZWdEY3VjYW9OVDhSUHVIeUdVS3RackJxMFUzeG5iQ2JYMjVE?=
 =?utf-8?B?em1lVUpqZUM5c1NOQ0I2NDEyWmNva1c3L0NNNUZTcnJXTFJuMWpBK0o2QWFs?=
 =?utf-8?B?YjdjYWZOcHZMRGtzMW0wdDJib0RGajJHVzQwSDBjcGpqeWYvUjMzcFZiUlBQ?=
 =?utf-8?B?VG9mM2E2YU43dU5qUHNsSjdxcFRxeUlEZXgvSk01ZG1ocnB0TkF2VXhUZ1R3?=
 =?utf-8?B?T2dTd3BpeklyS25Vd2VabUpSR0hKS0g0b3JydGhCeDJRcXVFMzJPZThRalZo?=
 =?utf-8?B?TnVDZTUwMi9XK1JGMk9jRWt6VW5zOWRNUEhLMmp4TnBoZGdGOUo1TURWMjZF?=
 =?utf-8?B?bDZ5bWI2WC9IaDlRakhpUXIxY3dvWktpRXkycWtTMGRHSHBabm1jczQ2UnJX?=
 =?utf-8?B?cTRKcklJWW5OdmVWZEFhSDQvNlB5alZhQkpFV0JHMmJxOWJFc0Rhb1pvSXFF?=
 =?utf-8?B?OWNQWUFLYzI0RWwvSnQ0U2FDZzdmRTBRK1ZZcDUwbGZmYzhqbFJscUNYM3ll?=
 =?utf-8?B?aDVHajA2anZZSTF2S0dUb21mWXBrZmYzdnUwVUM1d2RySWozbzlSby9SNVox?=
 =?utf-8?B?Q1VWY1BZS2xzTDZiaDlVZEc4eEtaaGtPWWhlQVZQd2RHcUNEaVVZOHJHOXAw?=
 =?utf-8?B?bUlOZmEySG50eDluOXJxUjZLTm9sUWV2bCtEV0hiS3htcENLelQxanIwRytM?=
 =?utf-8?B?Sld3d2c3bHBsamdnYTNha3F1MkptYXBJbnhQSmE2ck1kRi90Q0xpV1lSZUpW?=
 =?utf-8?Q?J8YAc7w89NqzRRIQPJzE0SXT3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2123de59-536e-45a5-3cb9-08db4b15d708
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 14:02:18.0138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz7vwMRUxsjhH38YmWHBHYO8wTT5dYTjFKrpPSXPSYPxGPnHlVHvci8tMT10lYmd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [RFC PATCH v1 6/7] clk: treewide: switch to clock
 dump from clk_ops
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



On 4/27/23 22:37, Igor Prusov wrote:
> Switch to using new dump operation in clock provider drivers instead of
> overriding soc_clk_dump.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> ---
>   arch/mips/mach-pic32/cpu.c             | 23 ---------------
>   drivers/clk/aspeed/clk_ast2600.c       | 13 ++++-----
>   drivers/clk/clk_k210.c                 | 11 +++-----
>   drivers/clk/clk_pic32.c                | 39 ++++++++++++++++++++++++++
>   drivers/clk/clk_versal.c               |  7 ++++-
>   drivers/clk/clk_zynq.c                 | 19 ++++---------
>   drivers/clk/clk_zynqmp.c               | 13 ++++-----
>   drivers/clk/imx/clk-imx8.c             | 11 +++-----
>   drivers/clk/mvebu/armada-37xx-periph.c |  5 +++-
>   drivers/clk/stm32/clk-stm32mp1.c       | 29 ++++++-------------
>   10 files changed, 83 insertions(+), 87 deletions(-)
> 
> diff --git a/arch/mips/mach-pic32/cpu.c b/arch/mips/mach-pic32/cpu.c
> index de449e3c6a..2875a1ec7c 100644
> --- a/arch/mips/mach-pic32/cpu.c
> +++ b/arch/mips/mach-pic32/cpu.c
> @@ -148,26 +148,3 @@ const char *get_core_name(void)
>   	return str;
>   }
>   #endif
> -#ifdef CONFIG_CMD_CLK
> -
> -int soc_clk_dump(void)
> -{
> -	int i;
> -
> -	printf("PLL Speed: %lu MHz\n",
> -	       CLK_MHZ(rate(PLLCLK)));
> -
> -	printf("CPU Speed: %lu MHz\n", CLK_MHZ(rate(PB7CLK)));
> -
> -	printf("MPLL Speed: %lu MHz\n", CLK_MHZ(rate(MPLL)));
> -
> -	for (i = PB1CLK; i <= PB7CLK; i++)
> -		printf("PB%d Clock Speed: %lu MHz\n", i - PB1CLK + 1,
> -		       CLK_MHZ(rate(i)));
> -
> -	for (i = REF1CLK; i <= REF5CLK; i++)
> -		printf("REFO%d Clock Speed: %lu MHz\n", i - REF1CLK + 1,
> -		       CLK_MHZ(rate(i)));
> -	return 0;
> -}
> -#endif
> diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
> index b3cc8392fa..08db21d394 100644
> --- a/drivers/clk/aspeed/clk_ast2600.c
> +++ b/drivers/clk/aspeed/clk_ast2600.c
> @@ -1109,6 +1109,7 @@ struct aspeed_clks {
>   	const char *name;
>   };
>   
> +#if IS_ENABLED(CONFIG_CMD_CLK)
>   static struct aspeed_clks aspeed_clk_names[] = {
>   	{ ASPEED_CLK_HPLL, "hpll" },
>   	{ ASPEED_CLK_MPLL, "mpll" },
> @@ -1123,18 +1124,12 @@ static struct aspeed_clks aspeed_clk_names[] = {
>   	{ ASPEED_CLK_HUARTX, "huxclk" },
>   };
>   
> -int soc_clk_dump(void)
> +int ast2600_clk_dump(struct udevice *dev)

static? apply for all below too.

M
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
