Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5CA298A74
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Oct 2020 11:36:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8E63C36B0B;
	Mon, 26 Oct 2020 10:36:10 +0000 (UTC)
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76EEFC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 08:36:08 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09Q8ZP9L009918; Mon, 26 Oct 2020 08:35:50 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 34cdn4bhkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 08:35:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKOZzpXWmXqe2nSUvtE4N0U5oEgDSva22b32NQqo8o0V7Vef5xLYpAMDMHFKVNTGlFiFuYyNernoijszErER1d/IOA/rS+nlF3EoR9rMyM84Mq97BnswvAIjfr5LO9414tFtrwDoxnryG7uch2XLiosBrHCqaWV4aIpqGgoP6oNwOhVRssHjrzeCMJBQPIsJDVZLATDNP0zbcZdoAfnOKjVG8WGMLXZExr7igx6PnIjQxs0hJkoYS0A3Vh0QurTbOlDE6G20uw9JO5cvNADz6SJ33ypYJvSUdqYAtmXyZajJvBCKRDOzJ64Ormcp97/VSmO1x94q3zGVIokHuvntjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TL0miJMSYv/tPaIWFRQIRKtoUJa5jGeBYMQwctrQkU=;
 b=dCUBIA3uHJJmn3C0fU+hyEpEBg3dVZMOqkMUbtxFsb3KgFjeu55WWubvgyVcFo6FDs7AGBJ4fQvaZYGwhOnFRvULSnFX1dXyRNX86OPUatkeeTY5CV+MNzeHkhmhTDXJYbpzZ5xmmGhFCe/vui/DSdPWwC6ewJ63c27/eFp5jHMghnBlTU2W6TCc/P8kzv1xy2pirQvsTN0YiGSDx+6GB07E94nDHVzvLOHbCht7G4TC0+mF5gZM88umaAbXfGOLwH/MkzfOUnBpB/6hDAdvQrbtFOgq/xuXV1mQB1R/lgDKIMt3KAwhytJIbksCEUBIyJzp9fQONd4jiIVWdrn2qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TL0miJMSYv/tPaIWFRQIRKtoUJa5jGeBYMQwctrQkU=;
 b=BcT3bCgacFGukFMDZkJrlv+DpIHXtr+3kA4qF6KshkBSHJ3qB2gtl1ltGvn4zCsaiT+u6/B7+qyyvKggBA8//zCijihEgZpADi8zFAUJVz194OVrJAGp0XewmiP+ecCydQ8rqsqBdT12zBdUV9JagYDFnAE3Qfaew6odQLRdD1FciQKhNoS3wonfQEIIddszstvS1sL+5PRy7q5Xwd+7Tp2thoSaP6OrXo+9w0SG6N3lOVanOTpGyotRlQ9iCftpBfM9E2ko+4/7CUiB4WSfLaaU8ufBs2RmkjcUFEMEgLoeZ/GGt1f6VhijL8D/SfvSDr9VqXu9B3zg9dO+AXaLfw==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5553.eurprd03.prod.outlook.com (2603:10a6:208:171::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 08:35:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Mon, 26 Oct 2020
 08:35:46 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] hush: Remove default CONFIG_SYS_PROMPT_HUSH_PS2
 setting from board files
Thread-Index: AQHWq3J3lYzugYBav0KSVb7gFPzX66mpjxoA
Date: Mon, 26 Oct 2020 08:35:46 +0000
Message-ID: <8f9bdac1-df06-d1fa-f896-5dd208c0d16d@epam.com>
References: <20201026083142.6395-1-patrick.delaunay@st.com>
In-Reply-To: <20201026083142.6395-1-patrick.delaunay@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fd884e0-1256-4811-12ba-08d8798a22b4
x-ms-traffictypediagnostic: AM0PR03MB5553:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB555392BAE5A35D36FACD8C09E7190@AM0PR03MB5553.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:138;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rOqwkXgz6P5WTLD1YG21MV6A3USKfg6RT99jC7mEi4IERVJ85SDoumcMSosemzrbdI2BBa5eqg90gRa7CnohNKBEf8MXxPh8jgiNX9wykvFrwXDvDYfU48WNRoBthlfgNnwAglqGGI9LHnmTrxHBPAMShgxsn3/T9RzHCN5HBghJ1HatsggwVaXoCDwyiCqd9TlRJMeu5VG+w/TUQxq6TUzxfZpnXkS68AzOJUkeYJKTrxrdLil0tUm94KiE7EWb6pttYUBTdJ8lmAwb/7s2dYmKdx6Q3J/qGsk9GkRmHxQBHCSVcufTmm3KsXWMfrWTCCLR1kCZ69KpXvsTCxMibjpDHsrdQVqy6sKvsvEuDHtCZ4YqUIfVk4iIPWzyDr7/eoq7wdOmODghWHBjw8sgHQgu93OIbLCL6rSuHno2Z5otU1DBrrUpQ4ovdkpvJVBFU2Jif79UnkJIccl/uTwmWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(316002)(66446008)(6486002)(76116006)(66946007)(53546011)(31686004)(54906003)(36756003)(86362001)(966005)(478600001)(2616005)(31696002)(83080400002)(8676002)(26005)(8936002)(6512007)(186003)(7416002)(4326008)(71200400001)(64756008)(66556008)(91956017)(6506007)(66476007)(110136005)(2906002)(83380400001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: tTJktBEjZjENnoJVPFJlpl4v1sA0xYgeX5wI48BbK8Wfg4l5WaAQXjjqM8Hl0fopqDW/iNinXLQknKk+90HL71QeOCfLOISfZgCTBa7WYrXjTIz4+YpGTJkjfJlUf1DhI0CmcO3xyiAASIVHvTv0s8+n4EvLyKO2nnFkmhCD1FqX6WNG2HS+beo8uiGmxFjfQYpObECmAY4gspXeQ/NXmyqD1Ovlik3GsqwMFwL+ltIl80AKZQPCPjvYGjVpQeNX0XqIh72FK7xZrPw+x4daRL8co5Kx5fi/1wbGfQknJcx9CiJT/aVAPkBhNxwBSu54aLM40Js9ispqZuccFXVCfjXVc2lv87DHGjCk8phuP+xasrjM5YY84MXVv8vOOkj/hNxi1EPl+0D6qXuCKZosSPrzkVfkU79du7/iFcqRo8rmusthF2gudaIbMyNjxgZYgf//YIlMp8jwxOyz8Q/WG77tpTAtF2im69GEF/yU4PRwZphiXIzA4RGTv4uwwFHd+6Rk12luz7WOerQiTQo4oza8HS4irQvs7CLH0aAhIj2CgjPFf37ssm8c2KzA4ufzimTkHgBCAmpo6488+tD6nuE7Hcdn6tn2069QsXr3uoZ9leBqZaxvLP5EcYW1gp0PmXNJPqlfWc/Rn7BmTnB0cg==
Content-ID: <A7BF6954FCE3A94B9F07F173614E61A0@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd884e0-1256-4811-12ba-08d8798a22b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 08:35:46.6335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0ACbvzZiRyKLiNEVpH9bwcTYPnFJ/w36QiVxlBfztneDUJdWmXGqUZL/h52qXp464mo0lAEm2LIJ0FzcfXBTtXJ4nI7tEXkJ99V4WfVDDsTa7QVs2hFVU4SuGUbRVUB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5553
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_04:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260061
X-Mailman-Approved-At: Mon, 26 Oct 2020 10:36:09 +0000
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Adam Ford <aford173@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, Stefan Bosch <stefan_b@posteo.net>,
 Marco Franchi <marcofrk@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabio Estevam <festevam@gmail.com>, Alifer Moraes <alifer.wsdm@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] hush: Remove default
 CONFIG_SYS_PROMPT_HUSH_PS2 setting from board files
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

Hi,

On 10/26/20 10:31 AM, Patrick Delaunay wrote:
> There is no reason to define default option for this macro which is
> already done in common/cli_hush.c.
>
>    87 #ifndef CONFIG_SYS_PROMPT_HUSH_PS2
>    88 #define CONFIG_SYS_PROMPT_HUSH_PS2      "> "
>    89 #endif
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

For the Xen bits:

Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Thank you,

Oleksandr

> ---
>
> see previous patches:
>
> https://urldefense.com/v3/__http://patchwork.ozlabs.org/project/uboot/patch/11b23b65581253f10905bcefc923aacb3c2ce85a.1529647987.git.michal.simek@xilinx.com/__;!!GF_29dbcQIUBPA!kuAr0IR41fGK-arwjDJjvrgCPSun2J2QhGuqL3jeWOp_bGAsPKrocOHClsfQvvlGete5ostLcw$ [patchwork[.]ozlabs[.]org]
> https://urldefense.com/v3/__https://lists.denx.de/pipermail/u-boot/2012-June/126510.html__;!!GF_29dbcQIUBPA!kuAr0IR41fGK-arwjDJjvrgCPSun2J2QhGuqL3jeWOp_bGAsPKrocOHClsfQvvlGetdcg8yzLQ$ [lists[.]denx[.]de]
>
>
>   include/configs/apalis-imx8.h     | 1 -
>   include/configs/colibri-imx8x.h   | 1 -
>   include/configs/imx8mm_beacon.h   | 1 -
>   include/configs/imx8mm_evk.h      | 1 -
>   include/configs/imx8mn_evk.h      | 1 -
>   include/configs/imx8mp_evk.h      | 1 -
>   include/configs/imx8mq_evk.h      | 1 -
>   include/configs/imx8mq_phanbell.h | 1 -
>   include/configs/s5p4418_nanopi2.h | 4 ----
>   include/configs/verdin-imx8mm.h   | 1 -
>   include/configs/xenguest_arm64.h  | 1 -
>   11 files changed, 14 deletions(-)
>
> diff --git a/include/configs/apalis-imx8.h b/include/configs/apalis-imx8.h
> index db4e9011c0..b474b2f522 100644
> --- a/include/configs/apalis-imx8.h
> +++ b/include/configs/apalis-imx8.h
> @@ -98,7 +98,6 @@
>   #define PHYS_SDRAM_2_SIZE		SZ_2G		/* 2 GB */
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		SZ_2K
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> diff --git a/include/configs/colibri-imx8x.h b/include/configs/colibri-imx8x.h
> index 29a37ed44f..fc2c191594 100644
> --- a/include/configs/colibri-imx8x.h
> +++ b/include/configs/colibri-imx8x.h
> @@ -132,7 +132,6 @@
>   #define PHYS_SDRAM_2_SIZE		0x00000000	/* 0 GB */
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		SZ_2K
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> diff --git a/include/configs/imx8mm_beacon.h b/include/configs/imx8mm_beacon.h
> index 3c9541187f..9a93dba1c5 100644
> --- a/include/configs/imx8mm_beacon.h
> +++ b/include/configs/imx8mm_beacon.h
> @@ -119,7 +119,6 @@
>   #define CONFIG_MXC_UART_BASE		UART2_BASE_ADDR
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		2048
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> diff --git a/include/configs/imx8mm_evk.h b/include/configs/imx8mm_evk.h
> index 83521ad401..92eb85553e 100644
> --- a/include/configs/imx8mm_evk.h
> +++ b/include/configs/imx8mm_evk.h
> @@ -120,7 +120,6 @@
>   #define CONFIG_MXC_UART_BASE		UART2_BASE_ADDR
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		2048
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> diff --git a/include/configs/imx8mn_evk.h b/include/configs/imx8mn_evk.h
> index a6333085fe..cda8fc2ef7 100644
> --- a/include/configs/imx8mn_evk.h
> +++ b/include/configs/imx8mn_evk.h
> @@ -124,7 +124,6 @@
>   #define CONFIG_MXC_UART_BASE		UART2_BASE_ADDR
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		2048
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> diff --git a/include/configs/imx8mp_evk.h b/include/configs/imx8mp_evk.h
> index 8253c6aa2f..92091dfd6b 100644
> --- a/include/configs/imx8mp_evk.h
> +++ b/include/configs/imx8mp_evk.h
> @@ -135,7 +135,6 @@
>   #define CONFIG_MXC_UART_BASE		UART2_BASE_ADDR
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		2048
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE CONFIG_SYS_CBSIZE
> diff --git a/include/configs/imx8mq_evk.h b/include/configs/imx8mq_evk.h
> index 3f9a3bc100..96bfff749c 100644
> --- a/include/configs/imx8mq_evk.h
> +++ b/include/configs/imx8mq_evk.h
> @@ -175,7 +175,6 @@
>   /* Monitor Command Prompt */
>   #undef CONFIG_SYS_PROMPT
>   #define CONFIG_SYS_PROMPT		"u-boot=> "
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		1024
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> diff --git a/include/configs/imx8mq_phanbell.h b/include/configs/imx8mq_phanbell.h
> index e8b65a4ba5..66c2c3a8d8 100644
> --- a/include/configs/imx8mq_phanbell.h
> +++ b/include/configs/imx8mq_phanbell.h
> @@ -169,7 +169,6 @@
>   #define CONFIG_MXC_UART_BASE		UART1_BASE_ADDR
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		1024
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> diff --git a/include/configs/s5p4418_nanopi2.h b/include/configs/s5p4418_nanopi2.h
> index 6dd1f3bc04..1e2180b970 100644
> --- a/include/configs/s5p4418_nanopi2.h
> +++ b/include/configs/s5p4418_nanopi2.h
> @@ -102,10 +102,6 @@
>   /* Boot Argument Buffer Size */
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
>   
> -#ifdef CONFIG_HUSH_PARSER
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
> -#endif
> -
>   /*-----------------------------------------------------------------------
>    * Etc Command definition
>    */
> diff --git a/include/configs/verdin-imx8mm.h b/include/configs/verdin-imx8mm.h
> index fd8405433d..4751bf5a5a 100644
> --- a/include/configs/verdin-imx8mm.h
> +++ b/include/configs/verdin-imx8mm.h
> @@ -98,7 +98,6 @@
>   #define CONFIG_MXC_UART_BASE		UART1_BASE_ADDR
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
>   #define CONFIG_SYS_CBSIZE		SZ_2K
>   #define CONFIG_SYS_MAXARGS		64
>   #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
> diff --git a/include/configs/xenguest_arm64.h b/include/configs/xenguest_arm64.h
> index c44381e966..d76ce13d14 100644
> --- a/include/configs/xenguest_arm64.h
> +++ b/include/configs/xenguest_arm64.h
> @@ -27,7 +27,6 @@
>   #define CONFIG_SYS_MALLOC_LEN         (32 * 1024 * 1024)
>   
>   /* Monitor Command Prompt */
> -#define CONFIG_SYS_PROMPT_HUSH_PS2    "> "
>   #define CONFIG_SYS_CBSIZE             1024
>   #define CONFIG_SYS_MAXARGS            64
>   #define CONFIG_SYS_BARGSIZE           CONFIG_SYS_CBSIZE
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
