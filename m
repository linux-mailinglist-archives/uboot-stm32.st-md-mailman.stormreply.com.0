Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C5DCA48E5
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:40:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D19B5C628D0;
	Thu,  4 Dec 2025 16:40:29 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AC1FC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1HtqUDMDTT9h7ByktfjQLMbzueRQg2DSg036VElCAHwX/Aibh5F+LpSEaIHNVNyrgq9+UmAoWcoBpJb1jwLgwMVy2jsjajrf1u/mzO9XjNp1SJVNv8XQjnrj0Bt174BdhM3M14NSmV2/X99qXBVwLZLgkcrRVPRXaQOlxtwqxm5WJO+5ELApdY1qex/DisExf2vewC9cwJJ9xwkDmsra8yF3PszGaHx/FJAT0adCQ1vVjzXoLuUqzT8JW3A1V7p2YpwpFjx0PYrpgwlRYjh/n0gKd4CiuDZLuNrR2tiVM58jo6M7Gh66AVhsYtXHdTgqz2dapugtUFjw8u/kfW8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jpxr6Ggae7r3Ecfq5czokxAKnIPKVh6SkL83suB+jtY=;
 b=T1NhkzPwe7lCw4fvpSQdJD+FUT8OoxKVSeuBDNgAroortFEXL1Abc3CHcf6Ez0TNp9Oc9bVO+74uWrteJkeYnqB7D/PUre6qCDZ7z94zOrber8O/pCjJg9mLVURlLzBdu158XhBtp42SQbQBgRE8UNydggF3MeLgLkWNF9MqaNY44rqDiOwslyYzGj2BNQNM6XIHdmd/+ZFMui8vB9WJwmxT6yrr8UM7QPy4TXuHauxvkHXLBoewNxcxyHiWQ+KDSpfh5JvkZEO+tKZeeftHNCGKMjPDISvNTXrtSMDQec4lH+TN32DgP2I+pf3+8Iags24QBAIIdvJuDSQVUADORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jpxr6Ggae7r3Ecfq5czokxAKnIPKVh6SkL83suB+jtY=;
 b=XLSWO9eZQJRhxVD2NzabPobkk2AzLbi2t6LyuMGNTa20wcZ4d6Fvo/eZ4LEIktxBp2fQY8zL73YnBuDgVbf7AxSnD/66CNRupOPENvT9FiIFFcK1VqyIt9QdSzL9DLKPDrCR36tZCPEbV4E4Rrlhl4FcjutRlQ3kJl5hj5kyEVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA2PR04MB10159.eurprd04.prod.outlook.com (2603:10a6:102:406::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:40:27 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:40:27 +0000
Message-ID: <e381223f-1b78-4d5a-8676-75ec8239d4ea@cherry.de>
Date: Thu, 4 Dec 2025 17:40:21 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-23-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-23-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA2PR04MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: c0118597-2db5-4389-0a13-08de3353d1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1RvZU5xVXJHa3JtYWNEd1hXbVVGUm9iZGJmWExzelF1NmxXb3ppV21XNk1D?=
 =?utf-8?B?VGNoTlkyUW5Ha3FuOFFGc29jMXYxRlFtZnVSdUo0WTRiM1JwMyszT2V2REE5?=
 =?utf-8?B?eVVvd1ZNdFgzcW1PZ2FPbDVBbGc1SFUxdFNsdnJRL0FGeThodElOaGovbjY5?=
 =?utf-8?B?K0g3WFRxbjlBUE5sU3VsZVVHU2RYd09MSHA2T2JKSG9kQ2FWTGJjbnRVREpo?=
 =?utf-8?B?THJSSkdRZGd0TUJBZmduQWFDLzFvQ0ZNMXRvVXhRem5NenorTFFpWFpOQkhR?=
 =?utf-8?B?eEk0Z3pkYmJzcWNZUzZMRXpRMFN0YUhzRmNNNWVmQmRpSlVDK1NYS0c5VUU3?=
 =?utf-8?B?dk1qY1FOWG5lZmVKelo4THd5Uno4OUg4QjZWUlhMQ3lJbFJGS1N1V2xPd3VI?=
 =?utf-8?B?WE1SNk1wWEpvcU1VWDk0dS9wZDRFNld3aGlaYXF0Q0I5NDl2RmZvSTNpdXA4?=
 =?utf-8?B?UWVFY01mejY5S3F3THlOS2lVU0lUUjk4dWJPYjBYeFNsbDQwK2V2ZmJQd1RQ?=
 =?utf-8?B?TTh1RTludEN3NjNHd2NHSHpMd3hyR3BaVjNDeEdqV2Vab29KdTJPSG0wZDNo?=
 =?utf-8?B?QWJNQXUvT3Bxai9Pbkc0REF3bmRkS2hxK1pFRW9RY2Y3Vmt2MitUU2Fsbmtk?=
 =?utf-8?B?M3VkdDNwS1ZxQzVoN0lkRXEvS1pFckwzcW5JdW0wZ3JoRUkxaHhLWWI1RHMx?=
 =?utf-8?B?WTNwNFZFQW9BTDdkMzNIOG0za0kvYUJiMXJseTRoUzhtNUVKTDBaeWJMaFdJ?=
 =?utf-8?B?RE45eER0YytoSTVaL3poTWFJV2VqOEd5eU5yZ21VRXRtU1gzZmQyeWxZang3?=
 =?utf-8?B?SE9vczN3TVYzTWFTeHhHNGx1YU1XQWF6dVFqVnpMc2xjbi9sWWlONFVXdFJs?=
 =?utf-8?B?MUs2UEd1cnMwbzAvV1FPQmJMK1pZM0lSbnhDV0ViOER1dXB1cDNKQTk2K1NB?=
 =?utf-8?B?RFh1UTBUNG04VmpZMEQ5QUY2RlR2OVB0Sy9EVFFVSndiWTgycmNuVFMwZlp6?=
 =?utf-8?B?dVJqUlJrZmJqdmxzdlg0dnpLZnR1V3lxN016N0JNSnBuQ2ZWLzhGdVFuRUZz?=
 =?utf-8?B?YjE2RW5taGFLQi9CQ2JlWHk0NmNEdE5SZDJ6bGg2bko5eXlob2N6Ty9Mc3ky?=
 =?utf-8?B?VlFXaVRHRm5qT1lWM2VJZTJIU1VtTy94Y1JOSTdKRytDaWI3aHhHQXJLenor?=
 =?utf-8?B?eWdRaVp2TXhQR3hxL0dmM3MvNC85THp0NWlaRHJtQ2pOTU10alNsb1ppSUNw?=
 =?utf-8?B?NkkyWmlsdlZoQ0VqZllLa0VLNmVka0JCODBjWTNTQWswQm9oYVdoc2lSVG1y?=
 =?utf-8?B?VDIxRk9sckVlNTQveDI5YWh6TUtDcVY5b0JNTHRtdU5pU25ub09Vd3dsNVp3?=
 =?utf-8?B?S0pqYUMvQkU2RWVWajFEc2JESmNXUlFscENrV2hJck1xekdaZmdZMVczNk43?=
 =?utf-8?B?ZG1kaFVER1N5N3JQMVVtMmdTRVpBZ0Z5OHVhQmhWNWEraHBtSVlXZ1JzcDZN?=
 =?utf-8?B?d3BadHB0bWk0RWgwUERTNXRRcjExWXhwaWJxUU9UTWVQYndGOTJ5VFo1b01W?=
 =?utf-8?B?SzJzMDlCN1hZWmM2KytESGg4dWNjYkRldXM3ZjE0bGpIWStjMVZTcjBHc3BB?=
 =?utf-8?B?NFJwVks2TEw3QUFIVXJMekd6SVRxa25iQ2FGaUduZXR1OEtNY2Q5cnQvb3JR?=
 =?utf-8?B?Mm5GQWhTeWVrUUZCWXh0UnlZUXVUcnFnWnZkVFY1dDVwSy84djR5TzZudkJy?=
 =?utf-8?B?YUg2b1NvK05iVTk1b2s0djY4YVhsczIwYW56NTgrSU03VkRPaUlHakJRQndT?=
 =?utf-8?B?WW1WemxySXd5NmV1dlo5Vk05akxiM2xNTVNmQ3g2WlVhU09RY1paWlhYbVNY?=
 =?utf-8?B?eStBd2JubHRvVXJXaEJUQXIxeGFYYlJBeEdKRGtnQ2RPTndTc04vdEVJZ3VH?=
 =?utf-8?Q?aEXv2a+ixfjlpQhdRWRGJ+iyjvI4u55x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1pEeEYvRzN3QmtTd09CM1JDMjFyWTNXcVk0TStsL2R3by91dlRJU1RzYkNZ?=
 =?utf-8?B?cVo0ZWNPalcwN0tvaHdsb1VYbUV1ZWJGdk4wenZvUEhnWHZCc1JoQ2FwbG8y?=
 =?utf-8?B?TzN1a1hidytvYzg5clNZeUMvYnFoRzJmN2didnN0LzZjQWh2YVdQZTk5Y0Mw?=
 =?utf-8?B?T1d3a1JJand2ckhaSmRnM0luTDJQclRxeXN4ckkxVGZCejZGUEw2VkVSZ0g5?=
 =?utf-8?B?NDdqWmFmRk92YnluUDJzeWttcGd6eDVzWC9zQnBuajlsZTJkV1ArVlJyVERC?=
 =?utf-8?B?M1cvS2x5U1R0SFVodmpwRlErL2QzQTFvUkNvNG1RWFZlWm10MlZ3Nlh4cVRh?=
 =?utf-8?B?ZFVrYUg4eW45NHFOdE1UaGZDVXpUNHRGV2Q1U1JCWHVRNzRwZXgweE1hY1c4?=
 =?utf-8?B?UmF4Z09yMDhZK1EwYlhnNDIxQ08rMFNFMFM4UTF5OFlicnZORVFBZzlUUG41?=
 =?utf-8?B?SUdXTnRlWkQ2bFlZWUtBeE5uWnJLOGRtamdRelpXUXJaTmVzQUoyQ0RoZEZD?=
 =?utf-8?B?Mzh1UjdoTWFTRGlPb0QwY015TzY2aFRMaXl2OWJmMTZCUURlamRkZWhWM1M2?=
 =?utf-8?B?Nmtta0hMdFpQcXFhaFBKS0dMTk5xZ1dyZXpPU1dtMHdDZ0xpUjVpVHhrMk9s?=
 =?utf-8?B?d2srQVd0dENXMGF3blM1Y3F5dmZ5K1J2QXlwNVY4TlJlYmFkS3IxSHdXTVRP?=
 =?utf-8?B?R1E3U09Ib04yc051KzgyOTRSMzBrc0lncU1rRFh0T3F4d1VsWXRRZnVNZHEw?=
 =?utf-8?B?N1BqV0g1bDZBWko5SWpRQXM2VGZqSENoMytqd3ZIdzB3cEpnMUFwamJNdWpj?=
 =?utf-8?B?QTF1Y3l1SEs3dzFUYTZEd2hQTERYSlRqQzdEZzFuc2hqZGFlZ0ZDKzRVazBw?=
 =?utf-8?B?Mjkvd3VQU1diTzdkSitLajd3LzhETzlNZEgzM21rTlFIRC8yMUFOeDRZbzFR?=
 =?utf-8?B?WHd3VyswUE5VSVBEdm8wQnZlOGx4UnhCNjNGR3Y0QjdxZ0tPeElJeGZXT2dD?=
 =?utf-8?B?c0dKMW14SDhuVjRkUnhJa2ZYOHRUZGY5Yit6em1NbjVYakdIUHlBTVZ3Mlha?=
 =?utf-8?B?dUdIOUZHKzQvRjh0ZitLMHZqRzNtNGp6aEVMRnp0bGoraExZQzRtVDN1VTB0?=
 =?utf-8?B?RGM1QXVuTkI5TlNqQzJUL1BrZEdrNTd2cXJNbDVlUUhjZTNxbUZFdTMwWU91?=
 =?utf-8?B?SGMwbVJhbHhMcUhCR0gzTnRsbS9DQWtuREZEbW1qSSs2Zm9JUCt3c3Vmb1l5?=
 =?utf-8?B?ZTlxQ1IrU0d2T1BiR2V1Ui9jdHR0ekhtTTVQUUMwZ1BVZ1ljdmdiZzBudGN5?=
 =?utf-8?B?OEVDbi90bWQvV2t6dDRKZDJzWXg0NHRCUEdORGpDSkEwMm1FVWl4S2RZU0RY?=
 =?utf-8?B?bXNlVVkxQzZjS0xCK0FSUVJSM2R0ZVhtbmFPT0M5MkJlRVF3UHlHcTdjakxi?=
 =?utf-8?B?VXYrNUFxSUNwN1ZwbWRrNkl0SlBaaUdJSERKdjZNR2NlWXE3ck5QSzZmd095?=
 =?utf-8?B?V3NDeVcrZHhsejFSYXFDRSs1THRNbnlOeDE0cko4Z29jNThIMmg3aG1mUFU1?=
 =?utf-8?B?OExmUjRuMk5rRnRlakJnZ2JxM2ppTUtYUW5ra2g0RDRJWHVOLzlzRG5QLzhy?=
 =?utf-8?B?U2U4bHU1SFZCRjdPVW5KTjNEbUx2MnhqWlQ3ZHowVytGZHl5ZGJzcVFOL3NU?=
 =?utf-8?B?WGhLTEgzN3RlN2FPOXJ6YjZlYW5jWHJDelVrdmVGTTk2Snh5SFdLbzhBbndp?=
 =?utf-8?B?b0V3cmpCYXJyZHNNQlB2UkJIdzVNUU5nT3htazQ2OW0yY3FPMlpOV3RFR0ov?=
 =?utf-8?B?ZTJGNHViNzc1SmRwYXF1WkRqSmdYYitxT2JBejU5ZVozdVJCUGNkOVU5UWUz?=
 =?utf-8?B?Wmcvb2VpMjkxa1V5OVlGNGFoREtrZDBqTkFPY1lKOUtkNCtzQU82NEdFdmhi?=
 =?utf-8?B?SWlWUE5YTG1oY2xMWFRjNTVkOWplRnJQR3Zsa09LRnZoODJLT1oxQU1JQ094?=
 =?utf-8?B?b0xKSXJMcXVXbTE1aXA1YzVRSUFiQmFUTnI0d3c2ek05V3l2VGxOWVJQSmRT?=
 =?utf-8?B?bWNwMnFvKzFmcllxZ0NRT0owQzc4UG1ISUZLam53K1AraUxDU2dWZzg0Ykw3?=
 =?utf-8?B?QkcxVUFBREwwTGhZQTNJS05uekpZV3dYbmRxMlFJQzY1ZE9YaDBTZnFvNk80?=
 =?utf-8?Q?WuV0aMnS8X6dqZi9+O77+KM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c0118597-2db5-4389-0a13-08de3353d1e6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:40:23.1315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pB+iO0vxyqUxbjFtLSV7V6cLpc2/lfUTzgd/eVoi+qCjWamQc9AftZlaAuBUt+lCKE3Ew+0QVkcyvL0vfpV1pxqWJIl6iV+NovPpjJc8TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10159
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 22/23] ARM: dts: stm32: Drop "u-boot-led"
 from stm32mp235f-dk-u-boot
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
> Remove obsolete property "u-boot, u-boot-led" from
> stm32mp235f-dk-u-boot.dtsi.
> 

There'll be a replacement once the Linux kernel merges 
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251112-upstream_add_boot-led_for_stm32_boards-v1-13-50a3a9b339a8@foss.st.com/

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
