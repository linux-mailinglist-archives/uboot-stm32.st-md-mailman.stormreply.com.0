Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DB64DDF3
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Dec 2022 16:40:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C194C64109;
	Thu, 15 Dec 2022 15:40:53 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2045.outbound.protection.outlook.com [40.107.6.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DD6FC6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Dec 2022 15:40:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdTWxh0hSwfa28IgkamZZurQcZ3SDYRrcEmb+JNRau6s9zK4CUeKM2pEwdwfrSNftJeUFOmSP8fyJvhJpI4atZ3WMxg2Mtjdybh64tbag3l/cB9AG/Etv/wPqzMQ13uMvT2cEeCafDRDJlleLg4meq5o6qyuVaFBdqR0YkwxV35qRNlX7IUJ1cQMyVqE7Wb4jjkc6LN3JOGmgsyalzGpsVzZaropWdwBs4MNqvsoA1rWlX09vNJu2cCtLDaPOE/G7IzVD+qJxyTQjuln1zvYIj5MR3G3Wwj5hm8Un/tEtyJIoaay4TRi7ocDnS5KZMC8iWcU8ZVSxJeF4W74FfgDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agf2uYuVuYFkcflcfanG02uM+4Dj4DKwPvqpKo4S6i4=;
 b=abaxO2qntFY0MnLj+KpGN9BjjgRodrK2NM0LRvp80keo9PgpFMmEbhAIwPFAPftzpNXM6QOSR0V8dEdKvdMAXyesajvss2a+XcDH4+YNZrocTUcaZF+IwoqUBnJ2f9GY6ZnzxcCf86nSXjH9pqLpGmZlJPcMbeWYvERRiKV5fcSiw5t353OOHvrCRvMcIlC6ItjSfWdZRGDTO4B6z6lL9uRycUqqGYxJsWhvHMJoUw07sbjOXiB6XqqU7bh4rGDCh7n0PB5PFcOal39vVZ7B7q/JIg9H1ybMKpgkrUa0+zNV+dDUD4E2tsNXLikJOX90plgQsed+YHbNefLKW4ejOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agf2uYuVuYFkcflcfanG02uM+4Dj4DKwPvqpKo4S6i4=;
 b=fPYfUoaBFRyRAkggz4NWO03/zt2eGqnh4S0kQUf6eCp18idhcagHGEfRrNwVSGdeQbbv5P9AaI57sMcRvBrN58Wapsk9YCwDTbPeElSt+CpEe8FGwKa5nwDdtWc25fzKsPIIwHJJSfmiLM2e7p2UnM4XnMDMxXtEtbcOdwmneqbgBmt3L9u2csSD+seKbwN/JmK6lsJs4HM7s9FyFvXRLvwpVObbX1/+r8pv5APD7Iwa8yNrP1XV8glx1loQLQfcs82GHHhaV7VUXlK07bzsedxvGXYwD9qy12YFrwrF8fRZFEOW40rsPkCsDBeukd+wg0+hV9rOGyWB5v5qTsAPaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM7PR03MB6184.eurprd03.prod.outlook.com (2603:10a6:20b:141::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Thu, 15 Dec
 2022 15:40:49 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%6]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 15:40:49 +0000
Message-ID: <a08c4f80-677a-eba1-7180-7b7e2de6d8de@seco.com>
Date: Thu, 15 Dec 2022 10:40:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
X-ClientProxiedBy: BL1PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:208:256::6) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AM7PR03MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fbfb31-dc23-43bb-3b1a-08dadeb2bdc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFKVi+IWhV/7NhyecKg/FJKcx8tujC5NQNQZLvJO80DBQXBpnIzCMsSD1OumYgf5GiOvyGwE5fkJBPh4nEDyytdIBzd6DwWGkXhbt5P+s2ijRgM2fhaPdzTqUtGXJfSrxFlDtZR1X7u9f/OEDbpFYCjXQUbXJSanQecuBzvlzP1F5Uq83buoZvLx01JTqVK2NNFN+xDTN+Z709FbC+7LcVNPPBbToE6Q2FjAd/7hsVsqpyh8Ke64lEbwzunama4eiayp/mTpqaANmJocLYjnvcNNOra/77B3G37VaEueGUoGPWSgFD8So+2+VHUvaybQvEpHeti0iSf0hQ7eBNDF4TEelK2HWEQXgjdwZJdF+RWktWFvixBEavrBQSeMMfP+oINpvdnmfoK92A/Hv1W7NPnH7Svh9JrYoX5C4X850dfcwMPW5PgpZlCU4cXoTvVML8oFKuW2B/P1tkl8H1VGz93rpKe06Pc2gcn+DOQAzNi0ZA6JFDHhJQMdebQXHlEK/VaKmxqxwnpobM89UKXKsIjf741Ch8gKJZR9631XdD43hX9pML7aZZCZ6Y6CQNbJsckyOdJnHVVvIQ5HBBvswTQCNY2dCPbPD20hBxkhQOOLFUuj++Ah+LjXdEyICHJH/T0tmtVt6J3dJP/dpCosJ8jP4azzzODYGi0zcEWZkCnuhfzaij2hk+sq5Yi5IB//wLYoLW5IZQMyKo66o008Brwa/49ZZuwC/24FwnM0FMRVLFR1yeA2VVLbKy/Z/TOeiwfu9CumPL+QuPcwSeV6hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(346002)(376002)(136003)(396003)(451199015)(38100700002)(38350700002)(86362001)(31696002)(54906003)(316002)(66946007)(66476007)(66556008)(8676002)(4326008)(2906002)(44832011)(186003)(8936002)(7416002)(30864003)(5660300002)(83380400001)(52116002)(6666004)(478600001)(41300700001)(6486002)(2616005)(53546011)(6506007)(26005)(6512007)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVpXNGNIc2NKS0w4clh1NGt5dUNzeU5xL2dpbFJ0Q1lJQUdCcFVjU2d0ZHdW?=
 =?utf-8?B?dFpmQXNoN0NOdkVSY3kzdVRzVDlnN1pyZFZLRTc3dlh1b3RCK1NqRUZlRTMw?=
 =?utf-8?B?RTVzL2RONmhKdFpYTWxPZzh6MThVV2dtL3JkcWFRNzJqZkxjVjAwY0s4MHAv?=
 =?utf-8?B?WXFRRlFxR21NZEE1L05semNjVHdCK21Yc0hxTk5RV0JhS3Rsc1Noc2tiNmUy?=
 =?utf-8?B?SVRzOU92R1drdjBQYVoyRGpyMzZ6RStsbEtjUE0wZTFFRFZEdDlzNDFlS21L?=
 =?utf-8?B?d0FEeUVoZXd2Lytpc0l0WSt2UVI4czI3YzkyOFZ0UUNDdzVDR2VDcG0wQWZk?=
 =?utf-8?B?TkdlODl0OEJ3ZjdUbi9PVG43RTBtUjNjTkZQdHlJNlY3eDlvK3ZKK1JwTFVn?=
 =?utf-8?B?amRHdGVPWjJQYWphaEQzNDZoRUsweStNKzBPVzVWRUgzSHVEWXppOHJpUGlK?=
 =?utf-8?B?RG1IMG9sYWg5TEpPcFlLZ1Z2VGhtYWlnOTFiNjBMdXhZclZrbktDVW9OTWFa?=
 =?utf-8?B?K2wzUmM3ckxjNGxiVWIxbXJBOCs5cUZMc3Fzb21qeGdoUFZKN0g5UFlTQ1Bh?=
 =?utf-8?B?WlRYV1BZVXRqYWYvckJraU42cnpaTXZpWklJRHJkdi9xcVg4SHdndHRFdnMr?=
 =?utf-8?B?YmY0blRudEk0eks0dlY2Mm13VlNZb3dHSXRYaXdRbG1va1JTZUVYQ3BiZzNr?=
 =?utf-8?B?bXBtT2k3Wk84RkFDZm9tc3ZSa2tYT2NsT1hPeWpvNXQ0ZlQvSlVxVStCUnpi?=
 =?utf-8?B?QTZ5NHB1bUs2RFhETm1SdTdrTUl5ZHd5ZDN1L3FRdUNvRUVad1YrbExpUkE5?=
 =?utf-8?B?bWZJMURjNXZSMDFJaVBaZDg5NjRmYnZTRXBLQW5YTVI5QnI3aldvU2JFSFRR?=
 =?utf-8?B?NXorOWlQMkhTUzUraTVCb0RuVlJuM2RkSTEwakFnbTgzbU9PVGZSaDhXWWxq?=
 =?utf-8?B?L1FsZmM0U2IxUFE5MWxubk5iWUZsNkpaNVpYdTJOYWtXTHZWU244eHMvWm1R?=
 =?utf-8?B?TzJCaklKSGU3WnNKbDFlNmovaVlSWE5SZG5ReTJ4allXN0VwWGJJM0hoQnU0?=
 =?utf-8?B?NFMwRG5ORjRYMXlOM0NVT0FvV1p0bXJaUlFCajB0dGJKM3VEVjYyTkhQeXVO?=
 =?utf-8?B?WDE3VHVzS3hkbWpuTTNEY1E1aU1ZdWZBKzdzVVJxbUM5cDc2R0NNaTJ2MFhJ?=
 =?utf-8?B?OFp1VzFQWXgvQW8xQ2ZFOW02RTZ1R2IyNHdrcFMvYUlrNm9nWlJkN0g0bTIz?=
 =?utf-8?B?WkxoUWhYZjY5SDVQdkpiMmtUeUt6bGRNM2g5SGt2ZWMxNHJqY2YrWDZIOUI3?=
 =?utf-8?B?VEtGVmZScTd3L1JYUWVoNUtNTEhyRWRRV05MNjhHNW9BcjJuNWEzblRPMFRW?=
 =?utf-8?B?b3FqanJFNXBlM0VPL2h4SzFIdTRuc0haaWluRmJYaHJJUmtPM3krR3htKzFy?=
 =?utf-8?B?ak0zR1dUQU1RL2k1MEJuZ0VUSEFtN1VZNFFVTktxRmJPVlBSNkh0WGdSRTlw?=
 =?utf-8?B?b2MvSWpuMFk1eFBaZmJXejB0c2djMWQ1VmpBZXNaZEF1S2VKTmpRN21JWmZN?=
 =?utf-8?B?eldiQnBPVHdkWFlqdG5hMi9xMVVWM3laeDRxUSs1Q3c2Z1dFTU1wMmw2TkdX?=
 =?utf-8?B?TjBVZUpWZGlaUnFoSk15Wk1mbDQyVDR3clJyeTNYNmp5WE1HcFM3SmN5aVJC?=
 =?utf-8?B?NDR3Y2JJRVZFcXc1Wlo1UE1YMTNqcFdjK3FCU2hNU2tDbWJOYmpDbGJWdWJj?=
 =?utf-8?B?S2N5OUNEc0Y0cHB3Y2xtdUk3Y1NkVzlxZzFkMnRBYjQwUDAyK0VaYzg3bGtp?=
 =?utf-8?B?ZlVseGJPa1BGdXZzbXl4WEVQeHRUYUJhUTFqUFMxN08xelRERGpwVTMwY3R2?=
 =?utf-8?B?UmRZV3FtSHhBTHlyNHVCTUxmL2lMZWlOeHNsVnc3c3U4UWRVNjI2OEIxYTJG?=
 =?utf-8?B?bTh4Y3BBNEcrMDZ6b1NKSnNobktqZlhtdnNSQStRc0ZPcWc0emIxTzU1dFRP?=
 =?utf-8?B?bGlYS0RFZW56N0czSVBPbXV2TjB0RnFUd2IyempBWkZtcWdEeG5KaTYzN1FK?=
 =?utf-8?B?emExb0lZOWdwSlFtVkJnWkluVHlncHowdnk5SnlmeG92Rm42M05Qa295NEl0?=
 =?utf-8?B?QlRUa2VZV2ZRQzNBUjlhQmhkT1VmbisvckJtVk5BeG9IUDVyNVF0SVBVVDhO?=
 =?utf-8?B?SVE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fbfb31-dc23-43bb-3b1a-08dadeb2bdc8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:40:49.7207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTJ++TdyrM8fXrMWGjp9gl8fxn5IRsE+uiP+aF432iQPtuU7kS2tYaNp/kXDJF75WyemzSAPZe/Q4e84aMUy+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6184
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] fastboot: remove #ifdef CONFIG when it is
	possible
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

On 12/15/22 04:15, Patrick Delaunay wrote:
> Much of the fastboot code predates the introduction of Kconfig and
> has quite a few #ifdefs in it which is unnecessary now that we can use
> IS_ENABLED() et al.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  cmd/fastboot.c                  |  35 +++++------
>  drivers/fastboot/fb_command.c   | 104 ++++++++++++--------------------
>  drivers/fastboot/fb_common.c    |  11 ++--
>  drivers/fastboot/fb_getvar.c    |  49 ++++++---------
>  drivers/usb/gadget/f_fastboot.c |   7 +--
>  include/fastboot.h              |  13 ----
>  net/fastboot.c                  |   8 +--
>  7 files changed, 82 insertions(+), 145 deletions(-)
> 
> diff --git a/cmd/fastboot.c b/cmd/fastboot.c
> index b498e4b22bb3..b94dbd548843 100644
> --- a/cmd/fastboot.c
> +++ b/cmd/fastboot.c
> @@ -19,8 +19,14 @@
>  static int do_fastboot_udp(int argc, char *const argv[],
>  			   uintptr_t buf_addr, size_t buf_size)
>  {
> -#if CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)
> -	int err = net_loop(FASTBOOT);
> +	int err;
> +
> +	if (!CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)) {
> +		pr_err("Fastboot UDP not enabled\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
> +	err = net_loop(FASTBOOT);
>  
>  	if (err < 0) {
>  		printf("fastboot udp error: %d\n", err);
> @@ -28,21 +34,21 @@ static int do_fastboot_udp(int argc, char *const argv[],
>  	}
>  
>  	return CMD_RET_SUCCESS;
> -#else
> -	pr_err("Fastboot UDP not enabled\n");
> -	return CMD_RET_FAILURE;
> -#endif
>  }
>  
>  static int do_fastboot_usb(int argc, char *const argv[],
>  			   uintptr_t buf_addr, size_t buf_size)
>  {
> -#if CONFIG_IS_ENABLED(USB_FUNCTION_FASTBOOT)
>  	int controller_index;
>  	char *usb_controller;
>  	char *endp;
>  	int ret;
>  
> +	if (!CONFIG_IS_ENABLED(USB_FUNCTION_FASTBOOT)) {
> +		pr_err("Fastboot USB not enabled\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
>  	if (argc < 2)
>  		return CMD_RET_USAGE;
>  
> @@ -88,10 +94,6 @@ exit:
>  	g_dnl_clear_detach();
>  
>  	return ret;
> -#else
> -	pr_err("Fastboot USB not enabled\n");
> -	return CMD_RET_FAILURE;
> -#endif
>  }
>  
>  static int do_fastboot(struct cmd_tbl *cmdtp, int flag, int argc,
> @@ -148,17 +150,12 @@ NXTARG:
>  	return do_fastboot_usb(argc, argv, buf_addr, buf_size);
>  }
>  
> -#ifdef CONFIG_SYS_LONGHELP
> -static char fastboot_help_text[] =
> +U_BOOT_CMD(
> +	fastboot, CONFIG_SYS_MAXARGS, 1, do_fastboot,
> +	"run as a fastboot usb or udp device",
>  	"[-l addr] [-s size] usb <controller> | udp\n"
>  	"\taddr - address of buffer used during data transfers ("
>  	__stringify(CONFIG_FASTBOOT_BUF_ADDR) ")\n"
>  	"\tsize - size of buffer used during data transfers ("
>  	__stringify(CONFIG_FASTBOOT_BUF_SIZE) ")"
> -	;
> -#endif
> -
> -U_BOOT_CMD(
> -	fastboot, CONFIG_SYS_MAXARGS, 1, do_fastboot,
> -	"run as a fastboot usb or udp device", fastboot_help_text
>  );
> diff --git a/drivers/fastboot/fb_command.c b/drivers/fastboot/fb_command.c
> index bdfdf262c8a3..f0fd605854da 100644
> --- a/drivers/fastboot/fb_command.c
> +++ b/drivers/fastboot/fb_command.c
> @@ -31,27 +31,16 @@ static u32 fastboot_bytes_expected;
>  static void okay(char *, char *);
>  static void getvar(char *, char *);
>  static void download(char *, char *);
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>  static void flash(char *, char *);
>  static void erase(char *, char *);
> -#endif
>  static void reboot_bootloader(char *, char *);
>  static void reboot_fastbootd(char *, char *);
>  static void reboot_recovery(char *, char *);
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
>  static void oem_format(char *, char *);
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
>  static void oem_partconf(char *, char *);
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
>  static void oem_bootbus(char *, char *);
> -#endif
> -
> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>  static void run_ucmd(char *, char *);
>  static void run_acmd(char *, char *);
> -#endif
>  
>  static const struct {
>  	const char *command;
> @@ -65,16 +54,14 @@ static const struct {
>  		.command = "download",
>  		.dispatch = download
>  	},
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>  	[FASTBOOT_COMMAND_FLASH] =  {
>  		.command = "flash",
> -		.dispatch = flash
> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_FLASH, (flash), (NULL))
>  	},
>  	[FASTBOOT_COMMAND_ERASE] =  {
>  		.command = "erase",
> -		.dispatch = erase
> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_FLASH, (erase), (NULL))
>  	},
> -#endif
>  	[FASTBOOT_COMMAND_BOOT] =  {
>  		.command = "boot",
>  		.dispatch = okay
> @@ -103,34 +90,26 @@ static const struct {
>  		.command = "set_active",
>  		.dispatch = okay
>  	},
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
>  	[FASTBOOT_COMMAND_OEM_FORMAT] = {
>  		.command = "oem format",
> -		.dispatch = oem_format,
> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT, (oem_format), (NULL))
>  	},
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
>  	[FASTBOOT_COMMAND_OEM_PARTCONF] = {
>  		.command = "oem partconf",
> -		.dispatch = oem_partconf,
> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF, (oem_partconf), (NULL))
>  	},
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
>  	[FASTBOOT_COMMAND_OEM_BOOTBUS] = {
>  		.command = "oem bootbus",
> -		.dispatch = oem_bootbus,
> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS, (oem_bootbus), (NULL))
>  	},
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>  	[FASTBOOT_COMMAND_UCMD] = {
>  		.command = "UCmd",
> -		.dispatch = run_ucmd,
> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT, (run_ucmd), (NULL))
>  	},
>  	[FASTBOOT_COMMAND_ACMD] = {
>  		.command = "ACmd",
> -		.dispatch = run_acmd,
> +		.dispatch = CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT, (run_acmd), (NULL))
>  	},
> -#endif

Does this affect binary size?

>  };
>  
>  /**
> @@ -156,7 +135,9 @@ int fastboot_handle_command(char *cmd_string, char *response)
>  							response);
>  				return i;
>  			} else {
> -				break;
> +				pr_err("command %s not supported.\n", cmd_string);
> +				fastboot_fail("Unsupported command", response);
> +				return -1;
>  			}
>  		}
>  	}
> @@ -299,7 +280,6 @@ void fastboot_data_complete(char *response)
>  	fastboot_bytes_received = 0;
>  }
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>  /**
>   * flash() - write the downloaded image to the indicated partition.
>   *
> @@ -309,16 +289,15 @@ void fastboot_data_complete(char *response)
>   * Writes the previously downloaded image to the partition indicated by
>   * cmd_parameter. Writes to response.
>   */
> -static void flash(char *cmd_parameter, char *response)
> +static void __maybe_unused flash(char *cmd_parameter, char *response)
>  {
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC)
> -	fastboot_mmc_flash_write(cmd_parameter, fastboot_buf_addr, image_size,
> -				 response);
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH_NAND)
> -	fastboot_nand_flash_write(cmd_parameter, fastboot_buf_addr, image_size,
> -				  response);
> -#endif
> +	if (CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC))
> +		fastboot_mmc_flash_write(cmd_parameter, fastboot_buf_addr,
> +					 image_size, response);
> +
> +	if (CONFIG_IS_ENABLED(FASTBOOT_FLASH_NAND))
> +		fastboot_nand_flash_write(cmd_parameter, fastboot_buf_addr,
> +					  image_size, response);
>  }
>  
>  /**
> @@ -330,25 +309,22 @@ static void flash(char *cmd_parameter, char *response)
>   * Erases the partition indicated by cmd_parameter (clear to 0x00s). Writes
>   * to response.
>   */
> -static void erase(char *cmd_parameter, char *response)
> +static void __maybe_unused erase(char *cmd_parameter, char *response)
>  {
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC)
> -	fastboot_mmc_erase(cmd_parameter, response);
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH_NAND)
> -	fastboot_nand_erase(cmd_parameter, response);
> -#endif
> +	if (CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC))
> +		fastboot_mmc_erase(cmd_parameter, response);
> +
> +	if (CONFIG_IS_ENABLED(FASTBOOT_FLASH_NAND))
> +		fastboot_nand_erase(cmd_parameter, response);
>  }
> -#endif
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>  /**
>   * run_ucmd() - Execute the UCmd command
>   *
>   * @cmd_parameter: Pointer to command parameter
>   * @response: Pointer to fastboot response buffer
>   */
> -static void run_ucmd(char *cmd_parameter, char *response)
> +static void __maybe_unused run_ucmd(char *cmd_parameter, char *response)
>  {
>  	if (!cmd_parameter) {
>  		pr_err("missing slot suffix\n");
> @@ -375,7 +351,7 @@ void fastboot_acmd_complete(void)
>   * @cmd_parameter: Pointer to command parameter
>   * @response: Pointer to fastboot response buffer
>   */
> -static void run_acmd(char *cmd_parameter, char *response)
> +static void __maybe_unused run_acmd(char *cmd_parameter, char *response)
>  {
>  	if (!cmd_parameter) {
>  		pr_err("missing slot suffix\n");
> @@ -392,7 +368,6 @@ static void run_acmd(char *cmd_parameter, char *response)
>  	strcpy(g_a_cmd_buff, cmd_parameter);
>  	fastboot_okay(NULL, response);
>  }
> -#endif
>  
>  /**
>   * reboot_bootloader() - Sets reboot bootloader flag.
> @@ -436,40 +411,40 @@ static void reboot_recovery(char *cmd_parameter, char *response)
>  		fastboot_okay(NULL, response);
>  }
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
>  /**
>   * oem_format() - Execute the OEM format command
>   *
>   * @cmd_parameter: Pointer to command parameter
>   * @response: Pointer to fastboot response buffer
>   */
> -static void oem_format(char *cmd_parameter, char *response)
> +static void __maybe_unused oem_format(char *cmd_parameter, char *response)
>  {
>  	char cmdbuf[32];
> +	const int mmc_dev = config_opt_enabled(CONFIG_FASTBOOT_FLASH_MMC,
> +					       CONFIG_FASTBOOT_FLASH_MMC_DEV, -1);
>  
>  	if (!env_get("partitions")) {
>  		fastboot_fail("partitions not set", response);
>  	} else {
> -		sprintf(cmdbuf, "gpt write mmc %x $partitions",
> -			CONFIG_FASTBOOT_FLASH_MMC_DEV);
> +		sprintf(cmdbuf, "gpt write mmc %x $partitions", mmc_dev);
>  		if (run_command(cmdbuf, 0))
>  			fastboot_fail("", response);
>  		else
>  			fastboot_okay(NULL, response);
>  	}
>  }
> -#endif
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
>  /**
>   * oem_partconf() - Execute the OEM partconf command
>   *
>   * @cmd_parameter: Pointer to command parameter
>   * @response: Pointer to fastboot response buffer
>   */
> -static void oem_partconf(char *cmd_parameter, char *response)
> +static void __maybe_unused oem_partconf(char *cmd_parameter, char *response)
>  {
>  	char cmdbuf[32];
> +	const int mmc_dev = config_opt_enabled(CONFIG_FASTBOOT_FLASH_MMC,
> +					       CONFIG_FASTBOOT_FLASH_MMC_DEV, -1);
>  
>  	if (!cmd_parameter) {
>  		fastboot_fail("Expected command parameter", response);
> @@ -477,26 +452,25 @@ static void oem_partconf(char *cmd_parameter, char *response)
>  	}
>  
>  	/* execute 'mmc partconfg' command with cmd_parameter arguments*/
> -	snprintf(cmdbuf, sizeof(cmdbuf), "mmc partconf %x %s 0",
> -		 CONFIG_FASTBOOT_FLASH_MMC_DEV, cmd_parameter);
> +	snprintf(cmdbuf, sizeof(cmdbuf), "mmc partconf %x %s 0", mmc_dev, cmd_parameter);
>  	printf("Execute: %s\n", cmdbuf);
>  	if (run_command(cmdbuf, 0))
>  		fastboot_fail("Cannot set oem partconf", response);
>  	else
>  		fastboot_okay(NULL, response);
>  }
> -#endif
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
>  /**
>   * oem_bootbus() - Execute the OEM bootbus command
>   *
>   * @cmd_parameter: Pointer to command parameter
>   * @response: Pointer to fastboot response buffer
>   */
> -static void oem_bootbus(char *cmd_parameter, char *response)
> +static void __maybe_unused oem_bootbus(char *cmd_parameter, char *response)
>  {
>  	char cmdbuf[32];
> +	const int mmc_dev = config_opt_enabled(CONFIG_FASTBOOT_FLASH_MMC,
> +					       CONFIG_FASTBOOT_FLASH_MMC_DEV, -1);
>  
>  	if (!cmd_parameter) {
>  		fastboot_fail("Expected command parameter", response);
> @@ -504,12 +478,10 @@ static void oem_bootbus(char *cmd_parameter, char *response)
>  	}
>  
>  	/* execute 'mmc bootbus' command with cmd_parameter arguments*/
> -	snprintf(cmdbuf, sizeof(cmdbuf), "mmc bootbus %x %s",
> -		 CONFIG_FASTBOOT_FLASH_MMC_DEV, cmd_parameter);
> +	snprintf(cmdbuf, sizeof(cmdbuf), "mmc bootbus %x %s", mmc_dev, cmd_parameter);
>  	printf("Execute: %s\n", cmdbuf);
>  	if (run_command(cmdbuf, 0))
>  		fastboot_fail("Cannot set oem bootbus", response);
>  	else
>  		fastboot_okay(NULL, response);
>  }
> -#endif
> diff --git a/drivers/fastboot/fb_common.c b/drivers/fastboot/fb_common.c
> index ef399d0c4abb..7563650d07db 100644
> --- a/drivers/fastboot/fb_common.c
> +++ b/drivers/fastboot/fb_common.c
> @@ -91,20 +91,21 @@ void fastboot_okay(const char *reason, char *response)
>   */
>  int __weak fastboot_set_reboot_flag(enum fastboot_reboot_reason reason)
>  {
> -#ifdef CONFIG_FASTBOOT_FLASH_MMC_DEV
>  	static const char * const boot_cmds[] = {
>  		[FASTBOOT_REBOOT_REASON_BOOTLOADER] = "bootonce-bootloader",
>  		[FASTBOOT_REBOOT_REASON_FASTBOOTD] = "boot-fastboot",
>  		[FASTBOOT_REBOOT_REASON_RECOVERY] = "boot-recovery"
>  	};
> +	const int mmc_dev = config_opt_enabled(CONFIG_FASTBOOT_FLASH_MMC,
> +					       CONFIG_FASTBOOT_FLASH_MMC_DEV, -1);
> +
> +	if (!CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC))
> +		return -EINVAL;
>  
>  	if (reason >= FASTBOOT_REBOOT_REASONS_COUNT)
>  		return -EINVAL;
>  
> -	return bcb_write_reboot_reason(CONFIG_FASTBOOT_FLASH_MMC_DEV, "misc", boot_cmds[reason]);
> -#else
> -    return -EINVAL;
> -#endif
> +	return bcb_write_reboot_reason(mmc_dev, "misc", boot_cmds[reason]);
>  }
>  
>  /**
> diff --git a/drivers/fastboot/fb_getvar.c b/drivers/fastboot/fb_getvar.c
> index 018989dd1667..2fbd285db384 100644
> --- a/drivers/fastboot/fb_getvar.c
> +++ b/drivers/fastboot/fb_getvar.c
> @@ -21,15 +21,9 @@ static void getvar_version_baseband(char *var_parameter, char *response);
>  static void getvar_product(char *var_parameter, char *response);
>  static void getvar_platform(char *var_parameter, char *response);
>  static void getvar_current_slot(char *var_parameter, char *response);
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>  static void getvar_has_slot(char *var_parameter, char *response);
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC)
>  static void getvar_partition_type(char *part_name, char *response);
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>  static void getvar_partition_size(char *part_name, char *response);
> -#endif
>  static void getvar_is_userspace(char *var_parameter, char *response);
>  
>  static const struct {
> @@ -84,7 +78,6 @@ static const struct {
>  	}
>  };
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>  /**
>   * Get partition number and size for any storage type.
>   *
> @@ -102,28 +95,26 @@ static int getvar_get_part_info(const char *part_name, char *response,
>  				size_t *size)
>  {
>  	int r;
> -# if CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC)
>  	struct blk_desc *dev_desc;
> -	struct disk_partition part_info;
> -
> -	r = fastboot_mmc_get_part_info(part_name, &dev_desc, &part_info,
> -				       response);
> -	if (r >= 0 && size)
> -		*size = part_info.size * part_info.blksz;
> -# elif CONFIG_IS_ENABLED(FASTBOOT_FLASH_NAND)
> +	struct disk_partition disk_part;
>  	struct part_info *part_info;
>  
> -	r = fastboot_nand_get_part_info(part_name, &part_info, response);
> -	if (r >= 0 && size)
> -		*size = part_info->size;
> -# else
> -	fastboot_fail("this storage is not supported in bootloader", response);
> -	r = -ENODEV;
> -# endif
> +	if (CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC)) {
> +		r = fastboot_mmc_get_part_info(part_name, &dev_desc, &disk_part,
> +					       response);
> +		if (r >= 0 && size)
> +			*size = disk_part.size * disk_part.blksz;
> +	} else if (CONFIG_IS_ENABLED(FASTBOOT_FLASH_NAND)) {
> +		r = fastboot_nand_get_part_info(part_name, &part_info, response);
> +		if (r >= 0 && size)
> +			*size = part_info->size;
> +	} else {
> +		fastboot_fail("this storage is not supported in bootloader", response);
> +		r = -ENODEV;
> +	}
>  
>  	return r;
>  }
> -#endif
>  
>  static void getvar_version(char *var_parameter, char *response)
>  {
> @@ -181,8 +172,7 @@ static void getvar_current_slot(char *var_parameter, char *response)
>  	fastboot_okay("a", response);
>  }
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
> -static void getvar_has_slot(char *part_name, char *response)
> +static void __maybe_unused getvar_has_slot(char *part_name, char *response)
>  {
>  	char part_name_wslot[PART_NAME_LEN];
>  	size_t len;
> @@ -213,10 +203,8 @@ static void getvar_has_slot(char *part_name, char *response)
>  fail:
>  	fastboot_fail("invalid partition name", response);
>  }
> -#endif
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH_MMC)
> -static void getvar_partition_type(char *part_name, char *response)
> +static void __maybe_unused getvar_partition_type(char *part_name, char *response)
>  {
>  	int r;
>  	struct blk_desc *dev_desc;
> @@ -232,10 +220,8 @@ static void getvar_partition_type(char *part_name, char *response)
>  			fastboot_okay(fs_get_type_name(), response);
>  	}
>  }
> -#endif
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
> -static void getvar_partition_size(char *part_name, char *response)
> +static void __maybe_unused getvar_partition_size(char *part_name, char *response)
>  {
>  	int r;
>  	size_t size;
> @@ -244,7 +230,6 @@ static void getvar_partition_size(char *part_name, char *response)
>  	if (r >= 0)
>  		fastboot_response("OKAY", response, "0x%016zx", size);
>  }
> -#endif
>  
>  static void getvar_is_userspace(char *var_parameter, char *response)
>  {
> diff --git a/drivers/usb/gadget/f_fastboot.c b/drivers/usb/gadget/f_fastboot.c
> index 07b1681c8a9a..c6e7f4240758 100644
> --- a/drivers/usb/gadget/f_fastboot.c
> +++ b/drivers/usb/gadget/f_fastboot.c
> @@ -495,7 +495,6 @@ static void do_bootm_on_complete(struct usb_ep *ep, struct usb_request *req)
>  	do_exit_on_complete(ep, req);
>  }
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>  static void do_acmd_complete(struct usb_ep *ep, struct usb_request *req)
>  {
>  	/* When usb dequeue complete will be called
> @@ -505,7 +504,6 @@ static void do_acmd_complete(struct usb_ep *ep, struct usb_request *req)
>  	if (req->status == 0)
>  		fastboot_acmd_complete();
>  }
> -#endif
>  
>  static void rx_handler_command(struct usb_ep *ep, struct usb_request *req)
>  {
> @@ -546,11 +544,10 @@ static void rx_handler_command(struct usb_ep *ep, struct usb_request *req)
>  			fastboot_func->in_req->complete = compl_do_reset;
>  			g_dnl_trigger_detach();
>  			break;
> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>  		case FASTBOOT_COMMAND_ACMD:
> -			fastboot_func->in_req->complete = do_acmd_complete;
> +			if (CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT))
> +				fastboot_func->in_req->complete = do_acmd_complete;
>  			break;
> -#endif
>  		}
>  	}
>  
> diff --git a/include/fastboot.h b/include/fastboot.h
> index 57daaf129821..d062a3469ef9 100644
> --- a/include/fastboot.h
> +++ b/include/fastboot.h
> @@ -24,10 +24,8 @@
>  enum {
>  	FASTBOOT_COMMAND_GETVAR = 0,
>  	FASTBOOT_COMMAND_DOWNLOAD,
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>  	FASTBOOT_COMMAND_FLASH,
>  	FASTBOOT_COMMAND_ERASE,
> -#endif
>  	FASTBOOT_COMMAND_BOOT,
>  	FASTBOOT_COMMAND_CONTINUE,
>  	FASTBOOT_COMMAND_REBOOT,
> @@ -35,20 +33,11 @@ enum {
>  	FASTBOOT_COMMAND_REBOOT_FASTBOOTD,
>  	FASTBOOT_COMMAND_REBOOT_RECOVERY,
>  	FASTBOOT_COMMAND_SET_ACTIVE,
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
>  	FASTBOOT_COMMAND_OEM_FORMAT,
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
>  	FASTBOOT_COMMAND_OEM_PARTCONF,
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
>  	FASTBOOT_COMMAND_OEM_BOOTBUS,
> -#endif
> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>  	FASTBOOT_COMMAND_ACMD,
>  	FASTBOOT_COMMAND_UCMD,
> -#endif
> -
>  	FASTBOOT_COMMAND_COUNT
>  };
>  
> @@ -173,7 +162,5 @@ void fastboot_data_download(const void *fastboot_data,
>   */
>  void fastboot_data_complete(char *response);
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_UUU_SUPPORT)
>  void fastboot_acmd_complete(void);
> -#endif
>  #endif /* _FASTBOOT_H_ */
> diff --git a/net/fastboot.c b/net/fastboot.c
> index 139233b86c61..96bdf5486fa6 100644
> --- a/net/fastboot.c
> +++ b/net/fastboot.c
> @@ -42,7 +42,6 @@ static int fastboot_our_port;
>  
>  static void boot_downloaded_image(void);
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
>  /**
>   * fastboot_udp_send_info() - Send an INFO packet during long commands.
>   *
> @@ -104,7 +103,6 @@ static void fastboot_timed_send_info(const char *msg)
>  		fastboot_udp_send_info(msg);
>  	}
>  }
> -#endif
>  
>  /**
>   * fastboot_send() - Sends a packet in response to received fastboot packet
> @@ -309,9 +307,9 @@ void fastboot_start_server(void)
>  
>  	fastboot_our_port = CONFIG_UDP_FUNCTION_FASTBOOT_PORT;
>  
> -#if CONFIG_IS_ENABLED(FASTBOOT_FLASH)
> -	fastboot_set_progress_callback(fastboot_timed_send_info);
> -#endif
> +	if (CONFIG_IS_ENABLED(FASTBOOT_FLASH))
> +		fastboot_set_progress_callback(fastboot_timed_send_info);
> +
>  	net_set_udp_handler(fastboot_handler);
>  
>  	/* zero out server ether in case the server ip has changed */

Reviewed-by: Sean Anderson <sean.anderson@seco.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
