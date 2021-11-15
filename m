Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EDA450913
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 16:58:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1198C5E2CC;
	Mon, 15 Nov 2021 15:58:10 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E30C8C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1636991233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJYbC0t5JO4QE+dIOBhLIcm/8C/xCXShQlg8p9brssU=;
 b=haMGme2A6NcYIXJ1VjIWYpXsfCaMg1qxDhVRCkyiyPfnExKrQUl7kda5xmJnG9t6VXv2og
 VXgYL8XPoMjIOtuv21AdL+pakn8cQRcDhbiIHhk1UoEb9rqmQMnfuGzcPXhgzaRpm8IMw3
 13x7QTFmZDCSPBNjf2dKtx20saIPO6Q=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-vGCRytBePV6ghd8KtxqaOw-1; Mon, 15 Nov 2021 16:47:12 +0100
X-MC-Unique: vGCRytBePV6ghd8KtxqaOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZUNp1+WljKPMggbJm5+CSXAmF/8lvqoH3pCw5fJ+VN3rFUtgJfa9iRb/v6EQQhY+zLKfZGWBIFg5p0ZCatkmD5vode5ezadHBpwA4DeTdVkNaZin2dzE38W0WoeScV0Bf55mVYsfsQIrjak85k4P9nBjjJkTT1497kgFXvCdwXpsOj2ngmklFgKBlDmz58TPuHjp0MQHDDS5/Ug2kLoUk3yOLRdnSk3/MAv/rKJlp2uN3HW5yIj5XyyT6790QLrQl8V/TmP25RZNeBPy0RRQlAOcw8MMQaCEUA5A5yW7tGZvdI7aMjWdhmWgkkL71T71eKUvo3dOP00Dijm8f9AFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJYbC0t5JO4QE+dIOBhLIcm/8C/xCXShQlg8p9brssU=;
 b=Pa0gmDVIwHlPxqcctMmDRJ3j6mrslomQVIx8tu16ex57hiMBZny/WtvvgTRixNboFVFTaI8h87b2EuWhTuGvdY7kDtejM3PAra3ntis+VomGp/QL6M6VHxGZ4ROD8QObKQKjDM+ru2tHH5urf+86fNmlcs2j/R8y9NiiimRBejbyuNo9Dl6NJcmKWbH6T2IxOcY4kbglFnojj14i32Bbqw9NiXbV3LdWOCHrahknqAHKAEZSB1X2kJcx0mmZczupyeBKMufU3t+aaSxCwgQEfStvsTyq01pFKldFqyDV9sXHkIXj1qsWUPFp14YvwzqN0Q3CIUcKM809jepvRsBrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM6PR04MB6552.eurprd04.prod.outlook.com (2603:10a6:20b:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 15:47:09 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::b81e:116f:90fa:1b9c]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::b81e:116f:90fa:1b9c%3]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 15:47:09 +0000
Message-ID: <14c6c0eb-fd1d-c8f0-7a4e-871a107e2d67@suse.com>
Date: Mon, 15 Nov 2021 16:46:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
 <20211115163155.1.I484cf4a475d46527cfefd4ff549a22ac23920cdc@changeid>
From: Matthias Brugger <mbrugger@suse.com>
In-Reply-To: <20211115163155.1.I484cf4a475d46527cfefd4ff549a22ac23920cdc@changeid>
X-ClientProxiedBy: AS9PR05CA0059.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::22) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
Received: from [192.168.0.18] (188.86.219.160) by
 AS9PR05CA0059.eurprd05.prod.outlook.com (2603:10a6:20b:489::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18 via Frontend
 Transport; Mon, 15 Nov 2021 15:47:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e41d3a65-280b-48c9-00e4-08d9a84f2ebd
X-MS-TrafficTypeDiagnostic: AM6PR04MB6552:
X-Microsoft-Antispam-PRVS: <AM6PR04MB65529C0880D8F29D797A1898BA989@AM6PR04MB6552.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86ShQBSMH+wg6K0heXGLH9L0WTQkRfK198fs68l89zjXvxa+t0Dv6+CoiQU1QlvStuJin99i3hocCp8WXxp3j5noYPeoNYcd0R6qh7k9Y/RiQoojzOygnXXiCjRKg8J54FKJNgfXb8nYp3lU1zZEekygsTkak+I68SBsHR/wxv+21roSm1CJLpNhrm5NmYwZxWTYZK7O2on5yi2YZg7GvfXEERCLb5Ynrvk+Nx8PdneYFTIEB0MiUp4K35z4JKMzgnHZTUscXV60Tu9/yxO0i3qWzOxhORuo5KkchCx0jbGvBmbeYSutNMzCpBqSJk1isbSKP306hAtr30/9AU1E7MXR2XJ6A4w06nYIgaUl3bBpWMseaQjI4nha7UIVR7/C9bvBv7+ZjFTBEJvx6+tcrt09eh7y3FrAarro4B2uSl4Zvv0tzoUQ/0UcvzPReCpLusuy9sV4LFUXUuCF8n/7GHGpoSzV8iZEBbkGLw0ac+Rolu2KrnShJOXdbMs3/SiK1zHyE29NY7HJtjSISkxCbV9Elih8zjJ5ZCS2cBXgie/zMDKVt8nFooThfW/U+jCz6PSMOVcCQaEcqMMq14zgUpNpm+2IK5swICYJIB/HsidWzU4IuRCncVK5ZiCGikuYEW3+7sjWWNpJ7H7FFkJwQSZWigyh164hIPECjd/3BLX8XvUBqew+cYRzGxX8VV0Yjsv2BPei8I9000yUEzEgAnqSpSH9Yj203IKCMFGBWMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(26005)(2906002)(86362001)(316002)(16576012)(186003)(8936002)(8676002)(2616005)(508600001)(4326008)(54906003)(83380400001)(6666004)(956004)(31686004)(7416002)(6486002)(66946007)(55236004)(66556008)(66476007)(5660300002)(38100700002)(53546011)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHRUK0JaN1NzTWRMYTZnWUE1MjZjeXlLOVdUV00wcU5uMVBkeG0xV1ZNUUN0?=
 =?utf-8?B?dnRYdExZcWJqVlFXS2NmTlN3NG95ZzRoTk0wWkZrckNvczJMNWdGZ1lVVVNm?=
 =?utf-8?B?cUUxUGt5WmZLeHBNMFJ2YVQ5R2xYM1dnQmQrdXpWSlk2UDloM2YrK0VHV2FK?=
 =?utf-8?B?c0x5ZkVNRWx6UTFkTmxTcmE5ZFJkb0VuWnZOaHpZYWFyQWpjb3hxVFduN3U3?=
 =?utf-8?B?cHg0UzNXVHBPeUszUTRJcUxqN3VKN2FRWW8zbThLYlE2eEpUakJlT3JaQWRY?=
 =?utf-8?B?VHJpOWNueE9wcHlJTlN1dFJmRFVaU2FodmNKZ044bGlGT0N3akh5Y0NXNHpP?=
 =?utf-8?B?ckdqK3hUUnBGNFVSTGxaaGl2cTExRkFZRkxFclhUMytoVzBrVFJNMVRjeTVU?=
 =?utf-8?B?YnkzY2JaUGZidm1lb2tvY2p5clZESHc3TjRNaWtjczNRZDlJWVVtcG9lZTJk?=
 =?utf-8?B?KzF1eW1DS3h1c0VZMk5Pc3ZZd2JaWDVoSC9JRHlwL05VYXIwK29oOFFnZ2pu?=
 =?utf-8?B?RElHMmlKUFp0VmFWUXZ0OS9KcjFNSWZOMVFYdUJsc3Q5ZVZGTnpyM0VKK2xk?=
 =?utf-8?B?SnljdDQxdFVjUG14Z210elAzd2pyMWhyZU5VK1lZdTF3QXhlR2tEbFZEdUhX?=
 =?utf-8?B?RWVYYkMrWUtUQnF6d25PMVFUbDJjdWM5eENYcmRBQXMwbVZhci9mUGZLMUNZ?=
 =?utf-8?B?aHJRTFRHT2NlMXNBNElxcEdReWdTR21PWVNXSGQwd0Fnc3hNTjZJWUc3TDBG?=
 =?utf-8?B?emh3ckFSaytQb3JYWXV5bGxVYkc0K01aZTZiRGJjNnRQYlFjdjBReVpRanBR?=
 =?utf-8?B?RndlWS82QXo1di9JYmVWMnNvNE96dXpPL1hNaWxpbGRPbUJwa2lOdUcvSnVw?=
 =?utf-8?B?QUVOQ0lBaUxEVGNXRmNsMytzZndTZDl5WVZYbWt0MGw4dWpQT1RCRXY3SXFY?=
 =?utf-8?B?NFEza1VJdFlIeHg3aEF3NHZmTlJUcGVLUm1VY1pabi9WZXdSbjNOK1Qwdi9K?=
 =?utf-8?B?QmNnakp6ajBTVG5FUEZ5Syt6OWZRamNoMnZwQS9FRWI3bi82RUMzTTFFRWpa?=
 =?utf-8?B?REtaUUJGSFJFY1RpRjE0eHY5VTR0dkplVTVnajNqL1hlTWZqMzM1UWUrejBJ?=
 =?utf-8?B?ZWluZ1diSTNCSld5Nm42S3Njbk95em1ES0N5OFpxVWdpV3FsRmN0MEtWcjJy?=
 =?utf-8?B?TmlPcVBOT0loTlc5MTQxTXRvemtBNTdIc0xrbm1QdkljUnRTSnRwMHhDaC9W?=
 =?utf-8?B?Z2hKYk80VjJxMjRtY3o0Ly9VeHAzTlA0cmtHNEZJR1lTK1BJK0JlckJGb0Ra?=
 =?utf-8?B?V3pZbTBiM1FnR0JzdUNHTmM5ZkM3VFdqdSttOXlJYVROK1FEWFpYWWx6S0ww?=
 =?utf-8?B?UnhVNXVsT05WdGQzMDJTNmxtSXZ0Ry9mY1h1cEoyM2ZXWUFjYVVMUUdjYzZO?=
 =?utf-8?B?NHpPbXNhMTlTeEtPenVyMTBaOUNsOGs1ZlU1SGp1R2ZBQ2tkYnFmU3VuR3NO?=
 =?utf-8?B?VENtZE81ZEhIY0RCTkU1OWVUWFRramFoZ1JZYUkxTEgzOGZOK0pUOExCc3VV?=
 =?utf-8?B?WCtsbkl4YVpTemc3dU15YTRHY1IvOFFUTHVUUS90eVFjRDhPa1RIN1FEajJ6?=
 =?utf-8?B?bzNMdEpJZFZKMVZLb2lDS1RKRVkwQ1Q0Zm5YcEZ0OGhkcWpTWFlka2RzNWw1?=
 =?utf-8?B?bEE1SGhXVTRQK0lkZXJ0bW92RE5pLzY1ZHlpU3NYRFd1WVNncmtQaVgvUzZR?=
 =?utf-8?B?M253eVZNTjM2N2IxVmFlWkxhWGc5RkFGTGpWUE8zWTBvMXlKQUdxRHRQQkho?=
 =?utf-8?B?WjJLb3dlNkFTRzRIWGtDUHEremVHUTl2bnFkTkxpMUJhNjBIS3pJUXk4b3l3?=
 =?utf-8?B?QXJ1T0tYVmJLVFduaElVek1raC9WVlJOQWczb01QQ20xOFZJb0VYdVh3eUpu?=
 =?utf-8?B?SzcyRUNDZ0txTnNLeGVWRStnYXFBMlA4QjJ4Znc2WWtQbDI1YkNFYncrNEpz?=
 =?utf-8?B?NStobFBqVTU4VzIvR2UxQ0VsV2poUjVJc3AwdUgvem8vM1JaaWdRVzhEN1lZ?=
 =?utf-8?B?a28rT2s4dXdIam5vem9lenVUVmM5NTZ4WjkrVTFTOHplRFVVME9JWjFNclRk?=
 =?utf-8?B?UXJqYlZJV2pNNzR3WXZienlMUlgwVmhWTUQ5eE9DWjNKRUl1dGt3cHBVdWpo?=
 =?utf-8?Q?hYvFmIkzG/+SvCH6taECX7U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41d3a65-280b-48c9-00e4-08d9a84f2ebd
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 15:47:09.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoOLOwUCIcUWxpfxdO7ltGXNyzXVY3/RlvsHPXZdr1HXSd7wQ4iD1722kyzrA/c0w6kLF4D96XBrJHexkU2g/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6552
X-Mailman-Approved-At: Mon, 15 Nov 2021 15:58:09 +0000
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Stefan Roese <sr@denx.de>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Asherah Connor <ashe@kivikakk.ee>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>,
 Ovidiu Panait <ovidiu.panait@windriver.com>, Thomas Huth <thuth@redhat.com>,
 Anatolij Gustschin <agust@denx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/7] Convert CONFIG_LCD_DT_SIMPLEFB to
	Kconfig
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



On 15/11/2021 16:32, Patrick Delaunay wrote:
> This converts the following to Kconfig:
>     CONFIG_LCD_DT_SIMPLEFB
> 
> This patch also renames this config to CONFIG_FDT_SIMPLEFB as the code in
> common/lcd_simplefb.c support CONFIG_LCD and CONFIG_VIDEO.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> 
>   common/Kconfig                 | 9 +++++++++
>   common/Makefile                | 2 +-
>   configs/rpi_0_w_defconfig      | 1 +
>   configs/rpi_2_defconfig        | 1 +
>   configs/rpi_3_32b_defconfig    | 1 +
>   configs/rpi_3_b_plus_defconfig | 1 +
>   configs/rpi_3_defconfig        | 1 +
>   configs/rpi_4_32b_defconfig    | 1 +
>   configs/rpi_4_defconfig        | 1 +
>   configs/rpi_arm64_defconfig    | 1 +
>   configs/rpi_defconfig          | 1 +
>   include/configs/rpi.h          | 1 -
>   scripts/config_whitelist.txt   | 1 -
>   13 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/common/Kconfig b/common/Kconfig
> index fdcf4536d0..c97814c6ad 100644
> --- a/common/Kconfig
> +++ b/common/Kconfig
> @@ -766,3 +766,12 @@ config SPL_IMAGE_SIGN_INFO
>   	  Enable image_sign_info helper functions in SPL.
>   
>   endif
> +
> +config FDT_SIMPLEFB
> +	bool "FDT tools for simplefb support"
> +	depends on OF_LIBFDT
> +	help
> +	  Enable the fdt tools to manage the simple fb nodes in device tree.
> +	  These functions can be used by board to indicate to the OS
> +	  the presence of the simple frame buffer with associated reserved
> +	  memory
> diff --git a/common/Makefile b/common/Makefile
> index c500bcd7d8..fed7e482e6 100644
> --- a/common/Makefile
> +++ b/common/Makefile
> @@ -40,7 +40,7 @@ ifndef CONFIG_DM_VIDEO
>   obj-$(CONFIG_LCD) += lcd.o lcd_console.o
>   endif
>   obj-$(CONFIG_LCD_ROTATION) += lcd_console_rotation.o
> -obj-$(CONFIG_LCD_DT_SIMPLEFB) += lcd_simplefb.o
> +obj-$(CONFIG_FDT_SIMPLEFB) += lcd_simplefb.o
>   obj-$(CONFIG_MENU) += menu.o
>   obj-$(CONFIG_UPDATE_COMMON) += update.o
>   obj-$(CONFIG_USB_KEYBOARD) += usb_kbd.o
> diff --git a/configs/rpi_0_w_defconfig b/configs/rpi_0_w_defconfig
> index 6d76d12910..195541c6e7 100644
> --- a/configs/rpi_0_w_defconfig
> +++ b/configs/rpi_0_w_defconfig
> @@ -13,6 +13,7 @@ CONFIG_USE_PREBOOT=y
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_GPIO=y
>   CONFIG_CMD_MMC=y
> diff --git a/configs/rpi_2_defconfig b/configs/rpi_2_defconfig
> index 1931607132..eb63fbdd8d 100644
> --- a/configs/rpi_2_defconfig
> +++ b/configs/rpi_2_defconfig
> @@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_GPIO=y
>   CONFIG_CMD_MMC=y
> diff --git a/configs/rpi_3_32b_defconfig b/configs/rpi_3_32b_defconfig
> index 060fd36da5..46102899f0 100644
> --- a/configs/rpi_3_32b_defconfig
> +++ b/configs/rpi_3_32b_defconfig
> @@ -15,6 +15,7 @@ CONFIG_USE_PREBOOT=y
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_GPIO=y
>   CONFIG_CMD_MMC=y
> diff --git a/configs/rpi_3_b_plus_defconfig b/configs/rpi_3_b_plus_defconfig
> index 0a69f97342..91b63b6272 100644
> --- a/configs/rpi_3_b_plus_defconfig
> +++ b/configs/rpi_3_b_plus_defconfig
> @@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_GPIO=y
>   CONFIG_CMD_MMC=y
> diff --git a/configs/rpi_3_defconfig b/configs/rpi_3_defconfig
> index 8016fe1d55..528b12ea5b 100644
> --- a/configs/rpi_3_defconfig
> +++ b/configs/rpi_3_defconfig
> @@ -14,6 +14,7 @@ CONFIG_USE_PREBOOT=y
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_GPIO=y
>   CONFIG_CMD_MMC=y
> diff --git a/configs/rpi_4_32b_defconfig b/configs/rpi_4_32b_defconfig
> index 990589de64..88f7504a60 100644
> --- a/configs/rpi_4_32b_defconfig
> +++ b/configs/rpi_4_32b_defconfig
> @@ -12,6 +12,7 @@ CONFIG_PREBOOT="pci enum; usb start;"
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_DFU=y
>   CONFIG_CMD_GPIO=y
> diff --git a/configs/rpi_4_defconfig b/configs/rpi_4_defconfig
> index 0720505c6a..59a7103154 100644
> --- a/configs/rpi_4_defconfig
> +++ b/configs/rpi_4_defconfig
> @@ -12,6 +12,7 @@ CONFIG_PREBOOT="pci enum; usb start;"
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_DFU=y
>   CONFIG_CMD_GPIO=y
> diff --git a/configs/rpi_arm64_defconfig b/configs/rpi_arm64_defconfig
> index 06ae3e93b2..67dbf094ef 100644
> --- a/configs/rpi_arm64_defconfig
> +++ b/configs/rpi_arm64_defconfig
> @@ -12,6 +12,7 @@ CONFIG_PREBOOT="pci enum; usb start;"
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_GPIO=y
>   CONFIG_CMD_MMC=y
> diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
> index 8acf04d0e4..0baef3b6ab 100644
> --- a/configs/rpi_defconfig
> +++ b/configs/rpi_defconfig
> @@ -13,6 +13,7 @@ CONFIG_USE_PREBOOT=y
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
>   CONFIG_MISC_INIT_R=y
> +CONFIG_FDT_SIMPLEFB=y
>   CONFIG_SYS_PROMPT="U-Boot> "
>   CONFIG_CMD_GPIO=y
>   CONFIG_CMD_MMC=y
> diff --git a/include/configs/rpi.h b/include/configs/rpi.h
> index 55768a46da..bc907acd5f 100644
> --- a/include/configs/rpi.h
> +++ b/include/configs/rpi.h
> @@ -44,7 +44,6 @@
>   /* GPIO */
>   #define CONFIG_BCM2835_GPIO
>   /* LCD */
> -#define CONFIG_LCD_DT_SIMPLEFB
>   #define CONFIG_VIDEO_BCM2835
>   
>   /* DFU over USB/UDC */
> diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> index b9c1c61e13..1e1ef76175 100644
> --- a/scripts/config_whitelist.txt
> +++ b/scripts/config_whitelist.txt
> @@ -699,7 +699,6 @@ CONFIG_LBA48
>   CONFIG_LBDAF
>   CONFIG_LCD_ALIGNMENT
>   CONFIG_LCD_BMP_RLE8
> -CONFIG_LCD_DT_SIMPLEFB
>   CONFIG_LCD_INFO
>   CONFIG_LCD_INFO_BELOW_LOGO
>   CONFIG_LCD_IN_PSRAM
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
