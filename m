Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D8CA4705
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:19:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0742C628D3;
	Thu,  4 Dec 2025 16:19:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0164C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/7Z9mWtGewjD7KphMQk0PrXW+6bJ3dhMeqazJwgSbyd9/t7ODQbgmX7BulbLTCB1iKlC09xGiwMRoBBq817ePlo8nNbrfUvWUWiXMqlMv5wG6PTDduUORl0fhdrM+HsBj7j6U4FC8A5/uwXbmLb3vNcFd8/kciEv+JaXDCtTYrkczDuCI4JjMGrYciEaRp/sFVwcap/eGHWTTFmGesU2ly8HXIU7EqKat/Yn0FPH65QKDuqK61V4pYckGcVj+4jgC0c5sPgzLuLVh5UsXKLcKpGVIV1Anq1PsueP9BbA4k5TNL6qB133On8F8LDQThE86Tf150pprhuHSyi4FLaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=vgW9bCqFH3EU+MEoBVT5rn6qyeQppF4WQdtJGdKquMq2hV2TOG7/bR8c/S+Qj8HKf82qKdX/hhpUWSoSUXjY6xuLmXU73VjmBqHnmBYwyNuijACWwRY4lkqRtaCPtk/lhwKlOvSF6hkT6vTlp93cF6EKDcZk4UfcqvVMUie3+RQjKNEIZIAcitNP4soMJAxT4JLciZretPZYolJPUdk+B6sVkRkddgT01+3Fi8e1CYf9KNp4y/bVwNkfkdsqndPmpGi/QZlBLQIBmvVdBypaaf7dE/YH+ZJI9wh+rIdjioYFLSnYtweYH6A3RqfGmFPVzBXH91aVyNq0pBvey62hmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=QQZKoSXe/GhNmYenx8w9lVF5SoZxmGKdWG3LGeALlJEaQ/+lHVRq2NRQCuyghu54n1Fn+eGSN3CDJBu0Rw8H2pGTQl03pzPDnR1KAmo9+jF1UqQ1GifgV1MYjrlm8rw0H19Ha1Kb1cz95p3TUvCoLe3uWrcONda5tUbN5b4fFnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10372.eurprd04.prod.outlook.com (2603:10a6:800:233::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:19:24 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:19:24 +0000
Message-ID: <6d19e765-ae58-4216-851e-8085d84e4883@cherry.de>
Date: Thu, 4 Dec 2025 17:19:23 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-15-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-15-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR4P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: e31df370-ab7c-4274-7986-08de3350e3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUwydTRHNTJhc21hSTVQeGd1NFkzendKdDJta3pFL01peHNhOXVNNlo3Tlkz?=
 =?utf-8?B?WDQxajJKaHhEVFFQWWpYYlBlcDRIS2lqU1JnZlNJUmwxanBqUm5Sc3dVUnFs?=
 =?utf-8?B?WDlRYnJBMitNUGlHdnA4SG51a2NoMHNFUWxCMHdIOGxRbVlOMVp0ZUpDNm5U?=
 =?utf-8?B?ZXptbjJqSHpnUGhZSGIwT1dVWm5iNkhDQjZ3cEpyZ0NHcWRSOGExTkJJckw2?=
 =?utf-8?B?TWpQZFNOVU5IVXp0cGM5U0VJamNVSEVCRHZXejBudGtUazZnYlRORTV2U2Fz?=
 =?utf-8?B?TE9zMGwrTUhhcVpiS3c4eGpyWUg2ZldpUUt1YWwvc2k4ZkJac2tQQzMzcy8r?=
 =?utf-8?B?YVdac1d5OEMxWVpKbEZCUGJNUmRXYWRNWXZ3VEREOFVUSjRiMXF4U21CWDVF?=
 =?utf-8?B?ekh3aHhRUTFzQUhLQTZJL0N3MkgxWWNUOVN4MncrZFpYelR3K2JKSEVHczRy?=
 =?utf-8?B?d0Y1aHZUS3A2RCs5VXhmOEwyWmhuSkkrbElDOE54TzZtM0JiWFRYbXoxSFVp?=
 =?utf-8?B?TWhBQnFnRjFaaEpoWEpJZXVIaWptZmRwaFpZNjR2ZElxOVRnWmloY3YvdGtT?=
 =?utf-8?B?Tm5semVML2JLeFNYRUtEYWFST2wyRnJYYTRxWkpqWnhjeDMzdldJb3hhWGFC?=
 =?utf-8?B?Uzg2V0RlVWFJbklIcEJXNWE0b3BWYndacDk1NHlBdXJnRHo5eTgvT2tQNFpv?=
 =?utf-8?B?cENCU0szVVlvZFd1UzJqMXU3ZkxIZHNFY3VQTTg1eXorZ3JYZ09PWEovV0ZS?=
 =?utf-8?B?QXY3dFZWSWFqN0tPWFJWNTlzU1lWc1pvRW00ZnJZUEUyWUVPVHNqa0VlZkhE?=
 =?utf-8?B?b3Yrd2p4Y3JJb0plNnFOTkorR3pkcnl4aWRyOG9EMlRKNm1LZE8rSmozOVIz?=
 =?utf-8?B?NktQcDFSamtxd1dSMGYwU2dHaW5TVUkyZ2ttbTZtMU9VUkJlVnJ2d0lvbHVW?=
 =?utf-8?B?cVptcE9ldWlLTmo4ODBkQmVIdVhHWkcvR0NCdDYrRllkbS9POHZCN2lwTDVV?=
 =?utf-8?B?NHo5L0hDR3ZzMXBJQXJiTnVFY2dQSXZaWUxiaHZYTFVQTzlFc3JuVkV3Nm92?=
 =?utf-8?B?T3hRN2toZUpma1l6QzZVN0VXRTR5VlV0VVNOYnBBamhLSmR0ZmM1T3lSd25M?=
 =?utf-8?B?KzVnN292bEs3NGFUMmdoMDIzbXk3dGluNkNEZmRxTDJXOFRyd3VQQnhyb3Nu?=
 =?utf-8?B?VmxFa0hjWG9TRjA0bGFVWm5DNGo3dlhGZ25RRFh1YW9wU3RIY0UxMVhJZHNO?=
 =?utf-8?B?M3lVY2c3TFNia1lrMjBxbEtzWElrVVcveGxrVERxRDQvaVUwcFg3MEFFOWRJ?=
 =?utf-8?B?b2JUTkJoRTl2Mm1FdFJ5eE9XYnRPdE1KVGZtelFEb1FUQ08wajh4T29XNlVE?=
 =?utf-8?B?aCtVTVlSa0VOcDN2WUFBL2U5KytkZHY1YnFsRExsZjhkZHhHY0h5UytWOGxn?=
 =?utf-8?B?cVVERks5TDVBdElYTE41VlJ1MThWK1c0NWZ3Yzh0R3E1YTFBWXQyejdCUmVk?=
 =?utf-8?B?dVY3VmdtaFl0RndNYS92eStSWXRzclRXaGNvbEY3TCsrUk9vNlNoL2crN3M0?=
 =?utf-8?B?dVdad1VKNllRNjlQOE11WjFoeElNVTZnRHZmeXdMSEtZV3ZLSmFROEs1aEZR?=
 =?utf-8?B?ekNPTmMyMkhua0sxSTJ6bSs5Y1gvN3FDeGZQNUkxSVduVVZwT0NwRW1makZ4?=
 =?utf-8?B?VVpQaG1sU2FsUUtXUEFYTys1RW1sQndaemZtTndZMHU1SzdwUm50UytWVFdE?=
 =?utf-8?B?SEdEY1dSa2pvU2pFMnp0Vk40Rm44MDdSZXZleWsvTVd0Qm05cFE2RUo3Uitm?=
 =?utf-8?B?R1NSVXpRMDJ1bnhZdk1NdncwTmliTGswd2lMQmNjZ3lsbFlBSkY1YjdlQS9s?=
 =?utf-8?B?dWNlUGdGTTdpK1dMREtOQ25SQmZ4cUY5VHF5OFVIbVJDUHVWOUZiejF6a2Yx?=
 =?utf-8?Q?Tc7i+4+ILoSlnflWF+BT0jrKT2EOlcct?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzR6QndSNXdtY1ZRK2JOZ1VEcHMyMmlXNzlPYU1XbVNHRFlFTEh2c0NrdE5t?=
 =?utf-8?B?QzVJYzZFUVlFa0NtalpZcG1mK3JTZUIxQzFkZjgyajhVdFBsRjA0UkRzK0x3?=
 =?utf-8?B?R0JWWHlFa2dxK09sQmtVQ1hwMVNZMnpaVU1CL3JWTENmOHV1eUQ1cU5wM3Nq?=
 =?utf-8?B?d0N3a0dJL25oVDkrM2FYbG9XMGZobkFDSXFTWWZOdDNFYjJvOW9uY3ZWcHY3?=
 =?utf-8?B?WFpVd3pzNnIxMzhObmp6TUtLTkVIUzE1cUtCbjdvbmdiZGVoN1ZNN2ZWQ1Ry?=
 =?utf-8?B?Uzl1aEJCcGlZOUcyc0F0NHA2OUF4NVpOTTdzem5FcDV6OWlKNDVKNzdrQ25S?=
 =?utf-8?B?V3M3amFCK2x3TFQwdHA2Zk15Ylo3UUpFS1dBT2RiWFNtcDhwd2w5NDNCblp4?=
 =?utf-8?B?UTJzUVpIZkwxS2htUU9XYjNyVVlUZSttVjVMTDRzMnNMdndVL1JQM1dGUFd0?=
 =?utf-8?B?ZWRIVWJKblNLVTFUVHJUWVRFdUg1cERTUnR5NmNMdHRDT1RnUHRpZDcra25t?=
 =?utf-8?B?alduOERLeklhbXVPSDdhNitnaStKd1Z5ZEJMUDBFS2FpOWJpVHl0NXk3YXZ0?=
 =?utf-8?B?WHdjVEVwMXM1aElTblpLc0JYdU1qeFgxVG5WRGgxSzhRMGZKejhaSGx3K1FF?=
 =?utf-8?B?eHZPQU96U2h3TnZpR2JGWURHUlFkanhxNmw2UDEzUFF0akMyN1dQekw2WWxn?=
 =?utf-8?B?VERxU2srZGFkdHJReVlUaE1iNVVtd251RGRLckwzL1V3c0JMWkNBQzJncXpV?=
 =?utf-8?B?OVh0UVk2V3NpZDNvTHVsM2xwR1p4b1NPeXdORUlzY3I4UnV5SUd6ZFdqdVM5?=
 =?utf-8?B?RXJybmNaNmZTb3RoTVhXYjhEelBCRGlYaFBXMnNhVndXT294QzhLMURTSTNl?=
 =?utf-8?B?SG1HcDRSTG9PRXVGOEM2ekpTZFVMa3FlT1JubVBHZ3M1RnRlL1VnTVBxQjgw?=
 =?utf-8?B?clJpajEwMnpaV0tWaERZdjJGY1FhUnZjY0pDbE85NG1QUVZTaEY5UytkTXZy?=
 =?utf-8?B?SGlqcXc2T0N6bUZ0VWx6TFlhekQ1Wkk3U1hnNmNKeUxkZmJIbHRIN0pzNFBa?=
 =?utf-8?B?d2ljOTFTTjFyVDhIWUE0RUpvNGI0bCtYL3VlMWxnY2dYYnkwVWticC9FVTNs?=
 =?utf-8?B?dFNlbE1FNTJGWkFZZVIzODg1WVpHQzNFekt5WWRISWo1SDc2emN4OGJ4c29j?=
 =?utf-8?B?d2VMTFkvVTMySHVKdzhkbXcvcklidXdFSmZvR2s1MVhERDU1MnNkYncyT3RW?=
 =?utf-8?B?UWdjYVAweG5uVC9kdEtNTEp1MkFXQWI1QksyUXlOTEFuV0RlZVV4R2M3dk5S?=
 =?utf-8?B?QURWQ3QvbjB4YTBZb010T0Nvb2dBdjF2MlhETEV3dlpCd1dqb2F5a1dZNFlY?=
 =?utf-8?B?MDNZakF5Uy9WbDl4T0IvZS9yTWJVWDJqOXdCaDZzckpPeTFWOGhGdWpXWEhJ?=
 =?utf-8?B?dklsUm9JajFXaW04d2FrRGJIekhORzYxMFMzUVhwYnhFclBkVzYranhRdjdM?=
 =?utf-8?B?MG9FR29JcnZ2c1UrN095Q2Y2WDVyUmpTUFRBQVJwakFyRm40c3FuRGI0U3Zz?=
 =?utf-8?B?aEF1MkRQeXBBWHlsM2dRNzczUWxWTW5IYTl0OG1hNDdQRm1zQ0lZSzZBVGlH?=
 =?utf-8?B?R2lhUTU0RlNpajBVcDBwWERGVkRjTk82bVlsMmJRd0V5UFhCNUxUc1NjRnV6?=
 =?utf-8?B?cXNDeFppK1NybXV5eWhqSXNJRU9zSzk0SVkwbGRFNWFaeUxWRFlYUXl1ZGg5?=
 =?utf-8?B?K2hsVkcvSTh6YWZaTXZlTkFjSk1LK2dDWlFpbmpHKzJHWXpDeTVTbEZLM3Mx?=
 =?utf-8?B?RE1GU01FSHJLOWd5NEpQemZvaHMyMkJrSSsrSzlkeTB1ZWJRQXNMNzMxSVoz?=
 =?utf-8?B?WDhJTnRvanVCclJxOXpsZzlBbjlBdDBBL1ZhMmFSNjg1dFk0c0ZvWE04K3Fj?=
 =?utf-8?B?UWdhbUowVzZERFlHemRIWHFGYXF6OGZQNERXdHd2MU1YQjJ5TkUvY25iZDVL?=
 =?utf-8?B?bHNuekJRN2tBVWk0YmtHWmxad3JZd0IwOFBTWGRFOTRybmIvL2lRaGp6bFdr?=
 =?utf-8?B?MXVQY0VvbHFKT05xK1h4UmhTeTFUUlpGMlErdTEwN3g2am9tc2RibU9MZDl6?=
 =?utf-8?B?ZTByOXpRVThGSmRpL0FiblU5RVN0QU1PNlpFdGgvanpmNUhacnhCN2VJak5I?=
 =?utf-8?Q?/cj7eIeCJ1VpMhbH1YPSPsg=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e31df370-ab7c-4274-7986-08de3350e3b3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:19:24.5337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCA7SmndaX6Q/81bopcKA5hthJp1sh44gjtt4KuCILj9VhP0//uV24QGxnubvKU4/f9hi4CZ4TpPmIBpyLRnrMcMlada9ZlCIJFlUt5NbMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10372
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 14/23] configs: stm32mp15: Enable LED_BOOT
 for stm32mp15_trusted_defconfig
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

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
