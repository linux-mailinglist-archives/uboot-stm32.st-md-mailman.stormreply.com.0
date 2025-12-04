Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE127CA46DA
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:15:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82FF4C628D0;
	Thu,  4 Dec 2025 16:15:20 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 222C3C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3mIFVPir2IjJ4UrstcsJJV1BH85fJq+Hmgtxwxtcr9SSxcbtxzUh+CVl1MZln7tKUmEqzw5/98t5/2KiLdu5Ny/AZpBSeLPGiidNYbCESWWQrRyNnaHe1JO064awyW/8Xg71d7t6LPX24bvyTyrbB2nuE8jE+Oy0qccU1wqf0pbX692MGsM15II8h1gWmaRDaWbYlA3+LZWRe2Wc+q4nalpiLtzXXIwmjlF3k228z/O+146E/gaTIutCLAUg9VRT+i7iTE6iKVtxfB8UnhRE9/6vgxIjnKCBV4t1s8Jfa3MiaOeGiTSFHIsmqWfwafCVcbnbIMvONapaBOAy0ZKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFmlma34Br47xbRBS1DEw6H5sHb8qf3bJ0cemS8NBQo=;
 b=EAr0hM41uQr5yvd9OzpFVd6F2Zch3W9wpOv0Vn5g0mAUOqAJb10sF7ROPwGAJ9qDhNZqi8LuMRySUqtbRr7eAD+ljiDcvc7VqGG/fIY1Q4uST4GMdlyhVhRn/3laomPpz9JQufnjDgIUYIHQc3nSJAPOkBKYnPbOSB33T4wRNrccrV22UwxU8hLhPn9xqG35nXQT/SvTsw9LyK6qOv/8ZM1K6kwapIUWA+dS/2+4Ip6CaT3vsFG8KEgNZH/Zbuzn6Nmghb4i/jQJ5dKK/ctHWR5h5YCGZoZnoN/wT2Rkyclf/2j4BE3t6JDC2jk44shGai+56OTw65yGf5uP8kv/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFmlma34Br47xbRBS1DEw6H5sHb8qf3bJ0cemS8NBQo=;
 b=SRXEcj4WT63VBAy7bxPAskQJeoVFwf9Mnyd92pxg6K8UfqZGRBOQH6BuGeYZEpMYtGL5Ug4KVCD0ReYsKnRBBOZbB6cZkL4SjmjQv5cqy916csSDg5bPwlkLZCH9iBusMmdmTKs5N4ly4FzF5/u60Pv835wp/yvo2aVhY3e4w5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Thu, 4 Dec
 2025 16:15:16 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:15:16 +0000
Message-ID: <4df33055-0e63-4d26-9c40-15798e40ff6d@cherry.de>
Date: Thu, 4 Dec 2025 17:14:42 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-14-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-14-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::23) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 2470d5fc-14a3-4e4f-26b9-08de33504ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHFXeWpSZzFoaFh0b0R5OElGaXhBSFB2WnYzN000aktKaUFLK0czV1Q3Q0Fk?=
 =?utf-8?B?dUVzcUVWVGdvUmRMdW9JbERKSDAycE5lcXhuQ0RoL2paMzJGRENxcWpHZUh6?=
 =?utf-8?B?TjJmcXdZYXdDMGE2QkQ5d1ZmUVBCSlFKL1VYbmZEdU9uT1JBemo1T3VxcHA4?=
 =?utf-8?B?UC9rSlUxVU5VR0VoQWlFY2QvUXBES3J0dDYyNkFUY2FVczNuS0lRdGp0QlZ0?=
 =?utf-8?B?ZmptMjd4T3RQdEE3dFBxbUxUVmZtdGo3M1ZXWmJGV2NQREU2T1hobWNaZWFE?=
 =?utf-8?B?SU9JUWgxVzcrSWVKVmNrTGxrRytoMFpZbkNteDFzajdlelUwVlYwblFhQm1q?=
 =?utf-8?B?MjZmTFRtSUZKQ01GQkFya1M2RUYyTnpFeWZJNDJNWWczQjFaNmt0WUdDY2l0?=
 =?utf-8?B?WDd4TUFaTWtLZVJhMm9tRlFmVGpwUU95dG1oWjUxZThla1BqSmF3TFpHWUxj?=
 =?utf-8?B?VU9ySWJoWVY2VXVvc1hLcHBMNi9QakFRSUJqRDM5MTlpaFNNMGEvdmJEVk5P?=
 =?utf-8?B?ZjdlQ3VsdFNXK1p5L0RTbHMxS2thNEcvUWxpM090MnlsOTJ0a2Y2ck01cFFj?=
 =?utf-8?B?Z2lZbmdxTlVVa0Q3VStoWDdsWUExRjVTbUhoYlR3Tm81OXhRRXU3Qk9jVzR2?=
 =?utf-8?B?eWJPK1d0RUZNN2FWR3p0Zm1vcVVkaDNPVWNla3ZJWm13WUFIMlRpMVBZRFIr?=
 =?utf-8?B?MGxvS1gzWWp3UkxlYU5IQVh3U1JEU2pJbzRLUzNHZGNreW5YVkU5NlVwV3BL?=
 =?utf-8?B?Tkt4c3V5eGwwVlZ4WWdiZDZIdjFDUExmcTU3dUhGck5ITzcvMEZVZjhxVVR4?=
 =?utf-8?B?TDZHa3J0TG91a0R6bHN3L3FJVjFTUVRDcll0RjRnN1g5ZWtiY0dqZW55SXZk?=
 =?utf-8?B?cGUzYWJWU3lFbjd5OC9aL0k3MllSeHZYcVN1VHE4YVZLenNBaHVRT0xOZk04?=
 =?utf-8?B?dUN4TEtHcVhhNlMzWmpNS3VBN1kzbnFGZXpVc0huTEh3VjExNUhHdlNDTG9O?=
 =?utf-8?B?RE5RT2lsbkd0eWhRd2lMQXl5TVpIbjFqbXFPZkZvdlhTOWgyVFdMTnNwWFhL?=
 =?utf-8?B?dXhsRllmMzJYZnFQNi9JRkJjclhQWFBORmN2bzNBRHBYdGI2ampYRGlHbmg3?=
 =?utf-8?B?YldHanJWd0dyYzlxN2ZLdXlDZlFXeVhrdEtWYmNXQU1UajFBbGVkeFRjMTVV?=
 =?utf-8?B?MTBrZC9tc0N4cm8xL1FIVlQxRDgxeW8vQ3MvSmhUeXdIRys2RHcySDJ6ZDhw?=
 =?utf-8?B?MHdqa0NINUxDR2llbEd2MzZnd2oxNmVYZUFTRkhZdnhWT0ZaWDk2L3dPbzJX?=
 =?utf-8?B?dG9EdHE4cGRRTTBhZTF0UXFXWU0zWWZpcDdiNnlDdkNkUE9LakpTQXFyVUcx?=
 =?utf-8?B?bWRyY011dXVIOHp5QTZiWGNFeVFpRTFHcE8zRnpWSE94VGZCL1hWbjhEc3ZH?=
 =?utf-8?B?MU9tTGJKVWZRcUExczByQm15QWlySUdOMU9yd2VrOVdiRXkzRWg1alpSMHR1?=
 =?utf-8?B?MmlsdSt3aXR5VmxxbGF0d1JPZVpLZktWT0dIODFyRjh4aEwrcU82ZDA5RWJm?=
 =?utf-8?B?bmJHSFhlRDJqQ2NLWG00VzBzdlA1ZVppdXc3cURTZ0tuRGs0aExyM3g5N1V6?=
 =?utf-8?B?U0tTSTBlenBYbmhKVWNHTHNxMytvemRvOGRDaXhwQ1paOW9MVVF6aFVqM2wy?=
 =?utf-8?B?czBScjRpWGhaWDVSdFhFNy9WZ0tjcnh1dXlYa0x4TE1Ca0xDK2pUckp5VFNH?=
 =?utf-8?B?dzYwTTZncXMvN3dxaDdxUGYrYWNTZW5ndWY4eWkxODcyWnZPR2NBRTFJYVBL?=
 =?utf-8?B?SWJwVkZIOEdPMlZORHlCRUxKbDUvaXhMZTdOV0hDelFvUHRERFZHNEpwQTI4?=
 =?utf-8?B?NHFLVENOZ3ZvNjFwd21RNE0vOVkyclRzeEtVTSt4NUVkY1d3aDAvdVdCdjJ5?=
 =?utf-8?Q?CEeiy59syXggGYQPLdxyJi41toBlLh/q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djFmS3dIamVFaUJJd0cyTCs5cDJXMEh5aEsrc0tLVC96Y3BCZW1SSk5SOFQx?=
 =?utf-8?B?bzBpOEJxd3Rndlc2b3FnOFoxZ1FFaXdwSXdiZDFoNStYclVyYTNDaE1BRzNX?=
 =?utf-8?B?blBmbmNCNVFHTjNaUjQyd2EyUnREUDBVb1RKdWRrb2ZqbVhMZHRxNlBtNFp5?=
 =?utf-8?B?U2hQWm5mVVFkcm1UZWZveWhZNVluWlpTdkFTRWpvZWdUWDRtYm53bWlNL1Nq?=
 =?utf-8?B?LzFzb2NYYyszZDhNcE5mU1BoNi9XL3FSVktPU0VncDlPSjlZSmt2SENxb2ZU?=
 =?utf-8?B?VHVycVE2RS9qTlB5WmpKWjVKeEk2K3BmQmV4ZHZpSFY5QllvWi9CR2hSTDgy?=
 =?utf-8?B?UDJzZUIxSk5lOFdiMXJ3RENTL1R0VEQ3aHZVVGVJdi9TYTg1WTBDNlFweENZ?=
 =?utf-8?B?ZGVLTXBuNk1FMjlraDg2UVF5cW9TczhySWtCdTJtTkI5Qldxa1JOc3ppcitE?=
 =?utf-8?B?aitXS2dSSHJ4Tk95QWFmWDJIdGRZcXo0WkVzeUNtMmhUNFozZFk1cVNjcjB3?=
 =?utf-8?B?Smx0VEpwdXNxVEtxNFBQcnJMSjB6K0gvWUNKbmM4TWNWTm1lQWs3bUx6TGVR?=
 =?utf-8?B?UmZyMkpLd01ndHpLUmgzM01XMm1QT05IdDZUcDlQV3hRM1BxdTRWK1M4TG1U?=
 =?utf-8?B?L0VWbnlhbzVNcnRjR1lZZjcrckQ4NURxdHNvQjRqOTM5TFF4eXZUbGsydE1C?=
 =?utf-8?B?MVRneUZCKzRySXRCRHlSZERnWUZXaU11RjFkdFQzZ0hJWFU2dEF1WGhzUWhR?=
 =?utf-8?B?a0pnU2JrOW54ODh4V3pGSlpTeEpGbHkzcVdFME1mK3BuZzM3VVNNd3BLRnRV?=
 =?utf-8?B?K0lZblQ5aEN4S3hRS09GQkZvMmxZTWhLenpCMFlOVE5YU2poUkFaVzhvMGs0?=
 =?utf-8?B?NzJXcis0UTNWUGN5TzJPYnFSV3o2WG02ZEZ0L2FyWnlhT2tsOWlsbGV6Wnlm?=
 =?utf-8?B?OGpBVUs3andFRmUvZmdjSHV0MlZPRXFZUEpXRDE2WUFHaFpTcWV5L3JMZlNP?=
 =?utf-8?B?UW5sVnZFWERnRTNQWXEyd0FSVXl6MFdINFhIWFNOdlVhWEE3S1c2Nk0vT2g1?=
 =?utf-8?B?aVI0UDBnNGhwVmRpZjJKc05INzVBQytMQkJ0dlVCMGtHcGdWbGlneEg3R1Yz?=
 =?utf-8?B?SkhuMWZQSjBBMmYxM2E0amlSUG41Ukl6NmluZUxlWmFxQ1B5bkU5czcxMlc1?=
 =?utf-8?B?SjZuNlp4Qmg2YUdWUFcyT2RwSG40RUorU3NXTDZWSy9XR1ZSMSt1OGx4dzJO?=
 =?utf-8?B?dno4dzlkYkh5RmZnSk9Ra3JncGJaUGNrV3hibDNSb2YzclFYVDdlTklxVHpy?=
 =?utf-8?B?WmlVQUVYNXRUa2J4UVc5V3dtUjNsWkFHY1k3YUw0cExiYllFMDhrTVJJdXJr?=
 =?utf-8?B?dnhXNU50c1pTUURIYzNuSWtmQ21qYWt3blVlWjQvWkZVYzV0eEwrakVMNVpH?=
 =?utf-8?B?V0RSUlczLzF4RjNMUW5XcjcvZFBTYUEyTnc3TU14UnM0U014V28yeWNzcktQ?=
 =?utf-8?B?V05pYzVnZ25kMXZiZmhOWnpDNWtiTDRQMExTRTdCSTJ3ZGhjalRJNDVMdHY3?=
 =?utf-8?B?TWtzbUxuWUdTcjlKZCt2NE5pSllNM25WSHRSUzVQVlMxUGN6Y0x3d3NJeWdG?=
 =?utf-8?B?bTFyeGJpOEI5RWtNTU4rRyt0VU9VN00yMDFvQlYydWZlU2w2WXJiMitjR2o1?=
 =?utf-8?B?YmM3UWlLQzR2K2t3ZmZKU0pSZzlHa2ZVNHNTS3BPdG04SmxMMzRxdGl2WnRV?=
 =?utf-8?B?KzMzcHo3YTJaT2FJaDFEUUxocUkrYURxL1hPd3pzMHJ4aldlTkd2bis2R05x?=
 =?utf-8?B?UG8wUThSVUlKTmZreVgwRmFJdUZsaG1DRmZHV2sxRWMvYXhNZzZPQjFWdmY4?=
 =?utf-8?B?MzE0MEpUSU9VTXFpS2pQVzA5cGIzczFJTFV0eHZqb1pyTkhRT09iUmlweVFj?=
 =?utf-8?B?MENXU05CM3VKZndQeXVoL0pqRysrd1dkVWJCZVRWTHBsb2NZY3MyU0xTUnFi?=
 =?utf-8?B?b2Y4QUVzUC9jMFBsYWw3eTJGdktoOXJqbTdMWTZ3dFhjTEs4R2psWDFJRmhj?=
 =?utf-8?B?dU9kbFkzYVo1NHdXQXdQeUp0ZFR2TXdaWEp6U0J3c3pVQUdjYzZJSjZ4OFdF?=
 =?utf-8?B?enhXdU83dWY2QVZHQXFlYlBYODRyaHJxMW40MkR5TFl3cXg3eG91V0Z5VlJF?=
 =?utf-8?Q?9mMWFt2MCExyLqJW/j2DrR4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2470d5fc-14a3-4e4f-26b9-08de33504ffb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:15:16.6911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rj+qKnh0X2xXWQvSOyNhnS3OUO1RbfCMlRQkHOp7R5zf1weCH7KbvA73kYI9nGGQZN7kdLeJ+hkHNs8ZLfZnZUExipJRIpoZH2T52BE23ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8444
Cc: Tom Rini <trini@konsulko.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 13/23] configs: stm32mp15: Enable LED_BOOT
 for stm32mp15_basic_defconfig
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
> Enable LED_BOOT to use led_boot_on/off() API in board file.
> 

Same as feedback on two previous patches and it also obviously depend on 
the /options/u-boot/boot-led property being set, but that is sent to the 
Linux ML already so hopefully it'll make it to U-Boot 2026.04 :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
