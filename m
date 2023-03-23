Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E116C678B
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Mar 2023 13:03:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8080C6A5F6;
	Thu, 23 Mar 2023 12:03:39 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF668C69053
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 12:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdtjUNQKcubq1KvVgCwX1NEi0AFxqT06ArW82eRc1h5qzvCEJSqTGlfAxJ/gUwoJfqLKLRJQ6mE6OfS6NrcOOpcKqJ8dCmAAgxLA1xYeaudOuMfUJ4bFcVQuTkX68liOrWpJH1S1sd/UDxi1h1bL4leR4OumvegmXvbFkIdAcziwO6BzysHuZpQAKozsjIHk6QW8p2kxUJ3gkn9WjOXQOSdoXVbHZ4fVEnjwF9tlxvdPCaJ5pIBvIYYdYN0bRjEthY4rzEVl68LzpY5iG0jZ6/L8RLCGCZIgjlO/c4UHrttrcjul+VFI8sLYwczxbj/fkrvSnE2q7TX/9Z3In+nmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxchJUtCufhIWTfxe8q7kMOENtzIlHdIjX18rQhAhS8=;
 b=cqJqmpYx4a5dgcEN7p55PuyPhz3qCTShW/sysaEsDZjm3/RD7tNQ/h3UfbAp6j78gU7A7jLpH1yVJyT2m3px3K2oPAAwtBuN5BsLbYwjtQPNiWxNRy96OdbOmN5EJzuxhEwPveyrSkn7oi/LOkwVeeExz8NHkVKdX1K7OvPLIUpJ2vaJ9Z+Asi9J8yflcZmlQzPL//tusfnTdeSnx03KX9URDUueQp17X8+BiP0dE5ZTnnHBnMIfUAdWutKyXfJhmuhiTZexGl1l95GenF8PTxFjLiIAqtSbFjn1dTellXS56sqMPpDPRhIyg0vM0oopCS9x/UaAgzgNxT3Drrl0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxchJUtCufhIWTfxe8q7kMOENtzIlHdIjX18rQhAhS8=;
 b=LfyEfPCARqHbxX5ycGz0nIjss3UN5g3vU5pPVbKbv4HRRqVCNuDBgiejnzdwkS71sSK7VH2uT6JXLQLs4XBaL8PRZ6oGCLhLwlCztBEGHGljy0Fw7e1uj9wlQltU1rPRjCEcjk9HAwK08ppqqIv0+LxL41IRgYG2x/Xkh6JVwas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by DM4PR12MB6350.namprd12.prod.outlook.com (2603:10b6:8:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 12:03:33 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 12:03:33 +0000
Message-ID: <947962df-91ac-7c90-4ad2-2c1822e3c406@amd.com>
Date: Thu, 23 Mar 2023 13:03:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230322191223.v2.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230322191223.v2.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
X-ClientProxiedBy: VI1P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::15) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|DM4PR12MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 563e259e-4bba-4a6e-9da1-08db2b969f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AUjP6eO61ery5Txtkha9SAVSSaFNW1q+SLhD9w3ImjF/ifFsr+Ym7twrGPWXixNRGJy+oIGH0L5QXWJt8FXHzHqO4+hSYbkTCpg9lAer7RQZGyK/JNRbdgW1j8VlACTrodmVy+QBP5rP8IVeuljRAuMuNr3Ic8v8rwdDkJTp5IILBUqh4UeI7JAMorPrB53xgsPO9U5/bRInl9nXmZP3V1HnUwqa1b+y1Pe4H5SIUUv3aWCd4VudHPFuXcKTff/gIvKO7VFoWg+gptk/K0CCujvJI+VhFUmaRyfru+Iao+BKm3CyqtYtnsolnjlfsK9fUgDCiOpie+4Wve4u7Ayn2ptK52mA84R9EY/RuF4SDDOQ4JKOlveu+xD+FG4n8IrxBuLf3MnpDCahddnIfit91UPUF5OFLjjNPgLh9lWErzo3xBhxHNAaMfXwfsdG8AIBKQarzIiKcEZ5r9XPd7/IzuCCiettcG5N81tiZ5rvG6MlIVeQ8cJAN+iHyUTf0sIn6TF8NY/8sf5xlQHZw/hd7R283aGzCn7hMXeuhNzAxp/ZfYjInPD1lhJdQ+vinuPI9gXXFRKdtd6zBAIRABDZeYSLcx5QcMBmViwQhJcI+Df0gPuH35f/1WlsYP943IrJPMq2VKtb/igi1l6VaySrQ5PbOwPG4n8NmsTXljBKSYQhg0xB+bRLj5RjtQR8ZvUSafYvwnuaWBTHLkfEm0LSM8UnYiFfwsihwi3YP4P2XH3jYPm9j/LeqEG1Rvh5bjB2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4758.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199018)(53546011)(6506007)(6512007)(26005)(6666004)(36756003)(83380400001)(31696002)(86362001)(38100700002)(186003)(2616005)(478600001)(8936002)(54906003)(66476007)(66556008)(66946007)(44832011)(5660300002)(7416002)(8676002)(316002)(31686004)(41300700001)(4326008)(6486002)(2906002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTZKZE82cnhOZnJDaDNKSUIwUkx1akpUcm1VY01Hc0FEeEdxTnFvb1VyT2x1?=
 =?utf-8?B?WFYyekVJdXRzOGdsKzZnUlIyanNuY2dVR1FIUnk3QkR1amdlaStpdEpPa05V?=
 =?utf-8?B?OEEvQW9md2dIQW9BaWJCa0NIRnRVcmdYbGd0QTFiVTA2VWpOYkVKbWxQcklO?=
 =?utf-8?B?dVM3My9lSk45R3ZBMExFaWp6MU11TS9odzRIUEs5cmR0RC9zZ2g0UXl0WkRB?=
 =?utf-8?B?Vmp4OE94NWhFZGJaK010dXhqbGZYUVJNRnZNbUVOTmxMckNkNDRKaEVTOE1K?=
 =?utf-8?B?akdPdlNFNTJwTThJL2JCejlrK0ZiNEd0djBaNnJMTGNTRzY2S1BnVnFaZVRQ?=
 =?utf-8?B?Q3c2S2NSQ0t3bytPUGlqcGRvQkxNa3Q2RmJBNEVLZFZac2Q3UDdjTkc1S01F?=
 =?utf-8?B?Q1Fpbzl3d2VsazNIcnlHaUNEK2xySkl6Rkk0a21oTVY0VElaei9iK0svZDVN?=
 =?utf-8?B?MFYvQS9zUUllMTRvN0dZWmpJb3JrcFNrNno4UC9Ub0JncFozL2Q1ZGVOdUJL?=
 =?utf-8?B?dWhBUU9Ib252NHlBTitYdmlmc3RaVEx5eCt1MHpzcFNXSjVsak92NWRRT2px?=
 =?utf-8?B?RDJmTkJSbHdPakhVK1dsNk1nZnM5cEtWVEtodVM0MHFSYjN5TFhJRUdLSk9D?=
 =?utf-8?B?SWJ0cnlVZU91VThmVjhrS0VVdVpTcUdCQ2NIVWlEOTVMbjFjR1IwUU1QZEtR?=
 =?utf-8?B?SDZrR0VEQi9YRXprMGNnUTFTbEVLWVQ4ZEh5dUJpR05LYUlxRFlRTmxQZXFx?=
 =?utf-8?B?aE1tTVFtYkF6bUxrV3g4amJaSU44ajNjZ1RMeGlGMkQydTY1YnE0MVdldVJZ?=
 =?utf-8?B?R0lORmwzaG5OWW1RNTRjdlZhTGFScVlDb0gzWVNrR3hkWUNNL2p0bUVqY215?=
 =?utf-8?B?Y0JMSG15ZmhpY2lIUkFiL0MzeVNIaFpEOGg3RXg4aU1XbVNrZzFOejNWSkZ2?=
 =?utf-8?B?aUdzZ3cvajRtQjdBUEt4N0pZb2RyaFQ1cE03SzhjL05QbkpFTFRCNXkxdEpL?=
 =?utf-8?B?Tk93SFljd0gxdUszZ2h6ZUtmT29HRllNeitlRGNNMDlsSDd4a0xFeWUrQ2JE?=
 =?utf-8?B?SFVXL2R6c0EyTDRoaytyMU9BVWlaTkk4VUkxRlFQS25GOGVsSEVHTEkySmI3?=
 =?utf-8?B?VzI2SHZmVGxzMTBXSExIRnZER2JXOHp2QUZEQ2dVSzVkUUFlZml0NFBScUF2?=
 =?utf-8?B?SnZOaUI5VDJGRlJQVXFQTWlLSUhoS2R1N28rdmhUeXN4a0dqLzZiaVBnTDky?=
 =?utf-8?B?eGNwUllSZFdZeWx1TmZZK1grYVB6Y3VLVGQrYWw1SlBvUnc1U09KZkRRRE9F?=
 =?utf-8?B?R2l5OHlPQVNJaStyQWpaak5IcldYazlwaE9LK0VmbDJocXlkS3Q3aThnUDQ4?=
 =?utf-8?B?eExpU3JnNnZHOW1oNGt5RVVTOG5kQzlkeDdic0MrQW5WZjVnb3NJMlRTVFNx?=
 =?utf-8?B?ZUJwWU1hOFNHLythWEZoTHd6Mlk4QmJuZ1ZLQmtnSGdTUUlYL2RsV2VXQVk2?=
 =?utf-8?B?eUZCQUR2SHNzYVJ6TzJ2eUNGQTk3VmVlR21CV3E2dDZkSjFzUTY1QXZKc29V?=
 =?utf-8?B?eDRMVUxOZGVjdVJldGR6QU04eXJ4QTFyTmZpNTF3d1JWNStRazJPam93V1da?=
 =?utf-8?B?WGVKZXVIWm13U1F3cUNhWHdJS2NXcGsvcWhwQWY2eU9jZWdsMTRwcnhuWW5w?=
 =?utf-8?B?d2YvS251WEdUNVRSTmd5K2M0RlRwT0VVdVc1VWw5SEIxNFlTNzhtSTRaV0lI?=
 =?utf-8?B?ZzJMMzFxYVhiT3hkVWlIdWp1Tzl3eVlMSFozM3NqRktQdC9zekMyVVg5L1JE?=
 =?utf-8?B?ODQ3WUxweWhqK1poalRmSVVpNGNRdzErbDlHUjhCbWpNY3pBTmtNYXBFWVV5?=
 =?utf-8?B?UE42dzI1TGRJaWJXQlEzMHZHeTViMnZKUEJaaGpvNDF2VHJoTmxRZkVnTXph?=
 =?utf-8?B?TDBYWXNSeWs0Tmg3UXpRTVh4TGlsN0xDT2s0YWxVaisrUkthU3lUcSs5SDRG?=
 =?utf-8?B?TzBGWlNrMlBBektlREt1MW5xRmpjbVFtYUZHQ0dCVmU0bUlpeGRockxNRTZv?=
 =?utf-8?B?SmswQ1k3TXVXYzNLcVh3WmYxdGN4SGNielQ4Y1hsckVzMlROdU9sNitIY01M?=
 =?utf-8?Q?7yBJZfa4qx4+0x2EaKfq87F6q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563e259e-4bba-4a6e-9da1-08db2b969f9f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 12:03:32.9308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Fhbh+4mGsIN6xg4S+8VLVCN0JgDFLn0b8lqhKSZ9TCBimqH03J8GWFZJy/LgnxE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6350
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Kautuk Consul <kconsul@ventanamicro.com>, Mark Millard <marklmi@yahoo.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sjoerd Simons <sjoerd@collabora.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] lmb: Fix LMB_MEMORY_REGIONS flag
	usage
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



On 3/22/23 19:12, Patrick Delaunay wrote:
> Remove test on CONFIG_LMB_MEMORY_REGIONS introduced by commit
> 7c1860fce4e3 ("lmb: Fix lmb property's defination under struct lmb").
> 
> This code in lmb_init() is strange, because if CONFIG_LMB_USE_MAX_REGIONS
> and CONFIG_LMB_MEMORY_REGIONS are not defined, the implicit #else is empty
> and the required initialization is not done:
> lmb->memory.max = ?
> lmb->reserved.max = ?
> 
> But this setting is not possible:
> - CONFIG_LMB_USE_MAX_REGIONS not defined
> - CONFIG_LMB_MEMORY_REGIONS not defined
> because CONFIG_LMB_MEMORY_REGIONS and CONFIG_LMB_RESERVED_REGIONS are
> defined as soon as the CONFIG_LMB_USE_MAX_REGIONS is not defined.
> 
> This patch removes this impossible case #elif and I add some
> explanation in lmb.h to explain why in the struct lmb {} the lmb
> property is defined if CONFIG_LMB_MEMORY_REGIONS is NOT defined.
> 
> This patch also removes CONFIG_LMB_XXX dependency on CONFIG_LMB as these
> defines are used in API file lmb.h and not only in library file.
> 
> Fixes: 5e2548c1d6e03 ("lmb: Fix LMB_MEMORY_REGIONS flag usage")
> Reported-by: Mark Millard <marklmi@yahoo.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - Remove CONFIG_LMB_XXX dependency on CONFIG_LMB as these defines are
>    used in lmb.h file, include by default to export the LMB API
>    and not only in LMB libary code. This modification is required to
>    avoid issue in API definition when CONFIG_LMB is not set.
> - Fix some typo in commit message and in comment
> 
>   include/lmb.h | 20 +++++++++++++++++++-
>   lib/Kconfig   |  7 +++----
>   lib/lmb.c     |  2 +-
>   3 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/include/lmb.h b/include/lmb.h
> index 7298c2ccc403..07bf22144eac 100644
> --- a/include/lmb.h
> +++ b/include/lmb.h
> @@ -35,6 +35,24 @@ struct lmb_property {
>   	enum lmb_flags flags;
>   };
>   
> +/*
> + * For regions size management, see LMB configuration in KConfig
> + * all the #if test are done with CONFIG_LMB_USE_MAX_REGIONS (boolean)
> + *
> + * case 1. CONFIG_LMB_USE_MAX_REGIONS is defined (legacy mode)
> + *         => CONFIG_LMB_MAX_REGIONS is used to configure the region size,
> + *         directly in the array lmb_region.region[], with the same
> + *         configuration for memory and reserved regions.
> + *
> + * case 2. CONFIG_LMB_USE_MAX_REGIONS is not defined, the size of each
> + *         region is configurated *independently* with
> + *         => CONFIG_LMB_MEMORY_REGIONS: struct lmb.memory_regions
> + *         => CONFIG_LMB_RESERVED_REGIONS: struct lmb.reserved_regions
> + *         lmb_region.region is only a pointer to the correct buffer,
> + *         initialized in lmb_init(). This configuration is useful to manage
> + *         more reserved memory regions with CONFIG_LMB_RESERVED_REGIONS.
> + */
> +
>   /**
>    * struct lmb_region - Description of a set of region.
>    *
> @@ -68,7 +86,7 @@ struct lmb_region {
>   struct lmb {
>   	struct lmb_region memory;
>   	struct lmb_region reserved;
> -#ifdef CONFIG_LMB_MEMORY_REGIONS
> +#if !IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
>   	struct lmb_property memory_regions[CONFIG_LMB_MEMORY_REGIONS];
>   	struct lmb_property reserved_regions[CONFIG_LMB_RESERVED_REGIONS];
>   #endif
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 83e5edd73b0e..da6c7cd5f628 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -1027,7 +1027,6 @@ config LMB
>   
>   config LMB_USE_MAX_REGIONS
>   	bool "Use a common number of memory and reserved regions in lmb lib"
> -	depends on LMB
>   	default y
>   	help
>   	  Define the number of supported memory regions in the library logical
> @@ -1037,7 +1036,7 @@ config LMB_USE_MAX_REGIONS
>   
>   config LMB_MAX_REGIONS
>   	int "Number of memory and reserved regions in lmb lib"
> -	depends on LMB && LMB_USE_MAX_REGIONS
> +	depends on LMB_USE_MAX_REGIONS
>   	default 16
>   	help
>   	  Define the number of supported regions, memory and reserved, in the
> @@ -1045,7 +1044,7 @@ config LMB_MAX_REGIONS
>   
>   config LMB_MEMORY_REGIONS
>   	int "Number of memory regions in lmb lib"
> -	depends on LMB && !LMB_USE_MAX_REGIONS
> +	depends on !LMB_USE_MAX_REGIONS
>   	default 8
>   	help
>   	  Define the number of supported memory regions in the library logical
> @@ -1054,7 +1053,7 @@ config LMB_MEMORY_REGIONS
>   
>   config LMB_RESERVED_REGIONS
>   	int "Number of reserved regions in lmb lib"
> -	depends on LMB && !LMB_USE_MAX_REGIONS
> +	depends on !LMB_USE_MAX_REGIONS
>   	default 8
>   	help
>   	  Define the number of supported reserved regions in the library logical
> diff --git a/lib/lmb.c b/lib/lmb.c
> index 2444b2a62121..8fbe453dfa9d 100644
> --- a/lib/lmb.c
> +++ b/lib/lmb.c
> @@ -110,7 +110,7 @@ void lmb_init(struct lmb *lmb)
>   #if IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
>   	lmb->memory.max = CONFIG_LMB_MAX_REGIONS;
>   	lmb->reserved.max = CONFIG_LMB_MAX_REGIONS;
> -#elif defined(CONFIG_LMB_MEMORY_REGIONS)
> +#else
>   	lmb->memory.max = CONFIG_LMB_MEMORY_REGIONS;
>   	lmb->reserved.max = CONFIG_LMB_RESERVED_REGIONS;
>   	lmb->memory.region = lmb->memory_regions;

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
