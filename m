Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8FCA7390
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 11:43:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 326F1C628D4;
	Fri,  5 Dec 2025 10:43:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013038.outbound.protection.outlook.com
 [40.107.162.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A364C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 10:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j74GiFeESQiTJ3+5vosuIV2Kg9gPEoK1B5O7+ltv2eevoWg0wklrJmcu4fpO38IqQCSE8AqzbnZbtCS3mia4rXNONLVs2jjpyi9Wq5guh20OEpcMWNiQc20XoC9Z0gSGLQR3VaizB9OAgDP/nWFrTZfrEqxH5y+SmSXe92qNe5bp6sIPtNMvJEE26UI/MdEqZsLG0oiUehCQJpgPsxxd+K+5CTaezt5ormIVYKoQWCPEjpEGfZmYCbuZSHBk7WBp+fohv5z95zIstsThx10DiqNfHVAIHSdAS0SfZEHlhXNu9QHQGnZiE2IIz7HVo3dkPpCNdS/daxI4P2Xeh8DSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqKzhmhkuQrTtDnDoll35v1KefG7FKquFVaKwJBFPx4=;
 b=Tq2pxFbAH/xSflNhJMA99UtMX5TnuKHD6HxMo2ILnp+yGbfGkZt74lMNxuEWpjKJ84/FszR93KctaxySSlCTBTL82X81x3EARQF88LEhQnEhoL3sSAMTIOpso1c2XOiA48Vl7oiRN7qgqtfDwzGHbf7YtcBPTkOFRFVDrKIRHMUtdkOSZRE3ysmFk7QOSTFdF3fuXcojiKVDc+GusB9XQKuiNbFKOCOjQj52SQHmYFUAT6ovX2Yoj0skwF53jYxqRuNknPxpF/Inp+rxraEUE90DCUBUwRNtE+OtCvLiYBRTVwQF5Z3/fZjNfEBMb41NIPhUKdqwaOwIqstmnrDhsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqKzhmhkuQrTtDnDoll35v1KefG7FKquFVaKwJBFPx4=;
 b=JXEi8pj0VI9tvo9PyLInfRVlXK2o407fkMDwjYkEQZ2+BK86KK/wLLt0CrGEQxhdX1bQdsskgE/gZgzfGvzGzG8Jo98jBL0oxDtIYo4P/W0R6UlqrTvGRhrBC0ss7QH1iZ/AIU+spF7LfkAzk0wlsBE/E8sQLtXPUl8Kp5utRTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB12109.eurprd04.prod.outlook.com (2603:10a6:10:643::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 10:43:41 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 10:43:41 +0000
Message-ID: <60aba0a2-a87f-4b5b-9163-6646244759f7@cherry.de>
Date: Fri, 5 Dec 2025 11:43:25 +0100
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-3-patrice.chotard@foss.st.com>
 <309e316f-1be0-49bb-be93-609d8b29ccaa@cherry.de>
 <8f529291-5903-4fb1-a695-dbad5287cd25@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <8f529291-5903-4fb1-a695-dbad5287cd25@foss.st.com>
X-ClientProxiedBy: FR4P281CA0364.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB12109:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d133c8-0352-4cca-3f2f-08de33eb2825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFVWQTNyUzMyTzBSZmRTaHh2Z3RIYmJnVnJmaFRYQjd5bzBscENLbWFOellx?=
 =?utf-8?B?TUxiYkt0KzVDOGhlVmJXeG1KQjZBbWljcUJ6TE1STDRXL1B3TGVxeWZ0T0Fs?=
 =?utf-8?B?MzR4RE9YS0UrY3ZDUk5md1BjbTM3WXA2eVhTaThDbHJ0TXY0dG5HemFZUGNZ?=
 =?utf-8?B?N0hKdVgxVkxVNHBVb0F1VnNMVWxabXBDbWwrL0EybDlKdFRJREY4b0VoTGdD?=
 =?utf-8?B?bUhzTGMzTUhnTEcvamo1elYva2FyWHBLNVhtTTRBeEwvaDZlcDcvamdMcGww?=
 =?utf-8?B?ME16Y3NTVWdYUjEyVFdtcWRhMXkrL1QwYXIrdVpLaysvYlV3ajV4MzM1Sk1F?=
 =?utf-8?B?TUhUQzAza09ZUTJ3OWx6VForb0NqbEdxbzg0TUhLbXNyK2pib1VyQktaVEkr?=
 =?utf-8?B?YVpZbFdzamJaM0VOVlpPaWFaMjhsWHI4UllkYm1hZnl4MTd1cHVQRGg2Qk5K?=
 =?utf-8?B?MnBhelVNcjA3aUlURTgzM2lRaE1BVDlJdEIrSnA4TEN1ZXZRQXVYUUxGUm9F?=
 =?utf-8?B?UFUrQmhQTzM5OFdhUEtPNTl0T3d1cDVkNE9uYWkxcnF1WlZSbnJLM2tjRFdr?=
 =?utf-8?B?SGRSQkM1T1cwUTc2Y3pwSjlYdUFMZStoWjRhekxBMlhEdFhPN3RWTXE5SXlT?=
 =?utf-8?B?UVBSUndPNWkySGM1SGcrZXo5WlNyQlI0b3h3NG1IUnVOTlE5bzMvMmFlL0h3?=
 =?utf-8?B?Kzl4aHhEcUUrZ1ZhQW92eEZBRFdMdG9iK0swWCtWU1BSeW1JNGZMTlZFV240?=
 =?utf-8?B?MmJCVkNvUkM0bEdSbW1abTlPMVRBRWt2czBQalZZYXdiYzNwQ3NwbGxtZTV5?=
 =?utf-8?B?OTh1U3VzRVFaekl0RUhEclZ1VXJvcldUL0M1UFZZMDNrQzhtbFFoblNadGNw?=
 =?utf-8?B?K2NIUU5KekFhUVV5SXRIQUpzWDFCZEc2Sk1GbWJRbW11MVpCSmJ5SGpwRFJy?=
 =?utf-8?B?Q0t3N1p1ZjIzTTNaTU0yaC9PMmJQdFFxOU9hR2E3UTNNUG9tLytBd1NHeGVT?=
 =?utf-8?B?dmg3MUJZT0UrM3BSOForZXhiZmZpTDVVVTdWSFVCL0E1Q0FiRkF2T0duVTk1?=
 =?utf-8?B?NFE5QnJveTRrNlFnTXU4TkNraU9aZDNmbWZuZGV3U0gxcmlZZ0tCa25yc2FL?=
 =?utf-8?B?cDBLVzhvSFZNbDRURXNTNWpRWGZKL0pOeEVvVHZIMXpvMEhQMjVIdk9UbzYx?=
 =?utf-8?B?R0toUDFWdFhaa3hrT2JtWWt2STBxQU9xZUFjaGVtYkZEM0RVYVlDOXRjdW9Q?=
 =?utf-8?B?WE8wZEhCN3VrMWUyc1I5UWw1WHFJV1FVZGdPU0ZSWkRNK1lRRHZDMWtzWGl6?=
 =?utf-8?B?QWdhSnJhbkhBdjBLU0doZHFwNUtmNjMvZW1nb3lMcnpiTHNUbjdacU9VTDNh?=
 =?utf-8?B?bzFhZkY3NHFYSTk1MmVMUTVCWm11eUhYSE5pdENsQUJ0NlVVNFZFcm1KOE4v?=
 =?utf-8?B?TFFNbEFCWkNPU0VrWGZiTlZRZmJIdFRDcXArbXptR2VkZnFnV0VTbW1TcUJ0?=
 =?utf-8?B?UW02aHBGaFppeFBOdmcyVGw1QVB6VGRWYXlBNXVZWmxKYjFudU5NS3BSck9r?=
 =?utf-8?B?NFQ2cVBKbldIRXZWU2k1UTk5bzNJRVg4YWxmQURvSUdkTlp1cHgwWFBqQmZI?=
 =?utf-8?B?VEZMQTQrUnh4bDM5VUlkQjNxbm5qZmFEcU03QWtFQWJGWVlyaC9pVW84aHlH?=
 =?utf-8?B?cHpjTGZGR1pzWU5lcVBIblhmQXVxdlF2ME5YdjlLS0NCOGxLazVDZzJJc0ZL?=
 =?utf-8?B?bndZMkJkcnJuR1Y1L2VCQlU3TzFKN01ZWUpDYW44MExHRW45dlNVajdnZVcz?=
 =?utf-8?B?ZVBDWkV4MGc2Tk5oVHUzQmxYSXhuVHZ3TytBNC9YTnF0ZWM3UkQ4OEh2Wjkv?=
 =?utf-8?B?T0QzSk9URUd3THk2WnA4ak9JZ3FHTzFlSmkyYlJCcDh3eUQ4cW92SXNsQ3lG?=
 =?utf-8?B?YjA4WDNwTlc0L2JSQ3h3QVhGa1JCc3Fhc25ENG5rVDM4TnpHOXppWXRYRDlR?=
 =?utf-8?B?Ri9TaEhodVhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXVGK3RwWkxqaGhnbFJSb2luYUlRVEFqUVVoSkpVQW10bHlwNjJMNU1PR0xJ?=
 =?utf-8?B?Q1R6VGFPS1BKMmdDQ1M3cDNjcHRGZ2IxRjcyVXMvOVMxUlFGV1lsMzBtd2RX?=
 =?utf-8?B?a0JIajdZTnRPU28wclU4Mi9XYnYza0RNL0hrWWxXQU5pamxYZHJ3OTUzVzN5?=
 =?utf-8?B?aWY0Lzc0NmQ5SHg2bGNwT1E0cHluN2NyeDlWMHpYaDhiMFNQME5aT1U4SW9L?=
 =?utf-8?B?NXhvVjJiZFNqTXFrRUFkK3ZIWm5LWnJvUmhTL1hCWklIWTljVTM0WWJiMzYw?=
 =?utf-8?B?RkQ2dStTR1pyRHh4Vms4VXoyMXlYMVNUS1lkK1loZVBaWHVZUGQzYVl0NHBS?=
 =?utf-8?B?WEFQWE9UbytTN3B5cWV2RkhMczJpZ1h0OGJHUko5Wko5bWZDOFFqOFA0dnJY?=
 =?utf-8?B?M1dwUUZsQTBQUlRUNTdGb3p2bGcyT2pCMGF6ckp6SWNZR2NMRzJ5L2dJdlBs?=
 =?utf-8?B?ZW1PSDhBSHZUakhVOENvQnJxMkdvN2FTcS8xWTFMcDFJemN3YmhkQVNUVGs5?=
 =?utf-8?B?Lzh6S09yQy8vc1Evd3Q2RlVkL3hNbE1mbC9jVmEzRVRmLzZDVmVwU1RWTUpT?=
 =?utf-8?B?aTdseWRmL1BuYm8zTWJmT05OdG94Y2VIT0VRcmxjOFo2MkRETUFlK0xlZnlF?=
 =?utf-8?B?YkJiVW5OQ1BWandZYWZhZCtNajFFV3FPTTZ5UFdTSmtEYkViUGtkSkIxcmhG?=
 =?utf-8?B?ZnY5a1k5QkxkN24wQVZRdEhTK08xejFMSGVzM3JOUHVnZnBpOGIrMWRGMFVI?=
 =?utf-8?B?VGpORlZDN0FkSkgveFFvUFRGeGlic1BnclVOcmdjclFLaE1DemNGMFc4RUFG?=
 =?utf-8?B?cXBkVE5keld4aXB4cHRMSDJBSnVGWXlZSi8ydW1CSGdPQTFoc2ZsTVhsYXFI?=
 =?utf-8?B?WXZTOUxjVWdiVGdXOG12VDBxcUplRHBQSmMvOHNodXFiczNNZVRBVmY5aEFx?=
 =?utf-8?B?d0l6L3F4NVcwM3Q0QXBSSEpQdnZDTlhLT0RRd1Q0OFdCcVJYUkc1R3loYng0?=
 =?utf-8?B?Z3dZa2NrcG1RRmhRZENnOHVEVjhKaDhGZ0FGVUZRN2lIZUluV2NXK29JMXd6?=
 =?utf-8?B?MlFieXJ2YzNMenJBKzEwaDVVd0JhVGljcjNDZ0s5MUwzQmRjTEpRbGxkYWNk?=
 =?utf-8?B?aUMrdDRuYzBSVlJ1Rlhac203RStYMktGOCt0UFR6T0h6dm1MdWgrOGJNSEFp?=
 =?utf-8?B?ek1ObFBVVWV0TjlPTWJObS96MEtCMHgrRGN3djhueFBWbVhwRDFKWkxBK09l?=
 =?utf-8?B?OFI5ckNHUHNmUWUwUE5SRnFwUG5zU1pNTlRCRWNIVVdZVXZYcG1HTk45NmF0?=
 =?utf-8?B?RWNuMjZKS2pqMEJiVUorbFRHS05ZODlmTlVqZHo4NFc1NnRVdDlWdDZHVmZU?=
 =?utf-8?B?MTBaUTVYbjI2azJ2bUFSckh2YnoyNEJ6aHphZ2t3bmxOZWhkV012QVpWdG5O?=
 =?utf-8?B?dHFXTmxXUXVoRmNQdUs0Y1ZIS1lyblJhSnprNDlGSGI3UERUSlVyaGwxdTZR?=
 =?utf-8?B?VTN6RFVPMHZZbGJ1YzdubXdWTThvRE9NQktQcmxNYm4vaElPeXE3RTAvQU5B?=
 =?utf-8?B?ckl5cnAzSjJwRlB6M2FHbDZmdVZlSUFEWHdOL0RYeVhTTzFUT1hONW1NOW1u?=
 =?utf-8?B?NVZjWWZOYjhhZldoN3ZKbVkxeGpZZWlRS3RYSzFkZVRXT2t3Z1B2UlVRQUlH?=
 =?utf-8?B?ZDRlOS85d2hDS2lNb0Y2YWxHWXMzZG9VbWh3emhMRnk2YmVVb3RzQ0V3N0E5?=
 =?utf-8?B?K3NJSGd6ZHhCQk53dVBrQkM4TlFvbFFpMktUNDB6OTM3UzRDR0NEbzBiS3hY?=
 =?utf-8?B?VzFEV3ZQQk9ETXJ5VzRrUUFibk44Snk1S2x6SmxlSllKQWVmM3BvREJ6NytC?=
 =?utf-8?B?dG4yamNxcjc3ZWEyVVJjSWxqdk05Tm5US1Z3K1RUcmVndkdJdkRJOTh5OVdk?=
 =?utf-8?B?MW5pS09hM0RkVFRMTGZqNUx2MzlpMXRRRFZmSWozVGtUbU0wK1JrN2xoTFlq?=
 =?utf-8?B?Z01GVlB5VXJ4U00xOC9EdzFWbjFVbzdSc1k3T3RiVnppeXhZdTAxdUFEbHVw?=
 =?utf-8?B?aklZdTJmTmx1MGVzd2RZS3JlRm9iNTZGMVpnOHhpUGRsdXdOMnJxREw2aVhB?=
 =?utf-8?B?SjlJN05FeFIreEZJL3NHMTF4QTdaY1JENlRaMUtxK3VjbU9nUUNSWHRwMHl0?=
 =?utf-8?Q?e9tjU8iLklJfbqQ2sYGioBw=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d133c8-0352-4cca-3f2f-08de33eb2825
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 10:43:41.7947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yo1CDE7TGuVY27w6V9hmKJAiLPHhjRN5AiNfN+fziuAYl4nNLD5ra0FpiximBSjRk8+qJvX+4Hyj/YuAgpdRp48MrsPN3sX/HCLCyH+fh8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12109
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH 02/23] board: st: Update LED management
	for stm32mp1
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

On 12/5/25 10:24 AM, Patrice CHOTARD wrote:
> 
> 
> On 12/4/25 16:38, Quentin Schulz wrote:
>> Hi Patrice,
>>
>> On 11/14/25 5:23 PM, Patrice Chotard wrote:
>>> Remove get_led() and setup_led() which became obsolete since
>>> led_boot_on() introduction. led_boot_on() is automatically called
>>> from board_r.c
>>>
>>
>> Yes, but called later than board_init(). If this compromise is fine then it's ok.
>>
>>> Regarding "u-boot,error-led" property can't be used anymore since commit
>>> Since commit 516a13e8db32 ("led: update LED boot/activity to new property implementation")
>>>
>>> Instead get the LED labeled "red:status".
>>
>> Would this work with stm32mp157a-dhcor-avenger96 (led4), stm32mp157c-odyssey (red but not "status" as function?) and stm32mp15xx-dhcom (error but possibly broken since commit 332facce6f5669fc1bb8d150c08cee2ebdae6d2b which removed the led with that label)? Seems like Odissey has LED=y and LED_GPIO=y so it probably worked before this patch? The other two, their defconfigs don't seem to enable LED support (new or legacy) so I guess it never was used anyway?
> 
> Hi Quentin
> 
> Regarding stm32mp157a-dhcor-avenger96, stm32mp157c-odyssey, stm32mp15xx-dhcom, these boards are not
> STMicroelectronics board, so i don't maintain them.
> 

Seems like Marek is handling the DHCOR/DHCOM stuff, and he's in Cc so I 
guess there's a chance he sees this and do something about it.

As for Odyssey, you are listed as maintainer but maybe we could add the 
people who contributed to it?
I see Marcin Sloniewski, Grzegorz Szymaszek and Heesub Shin for the DT. 
According to 69df7ff4b844fb22d02a941d57d8e6c2d6b679dc, you probably 
contacted them and had no feedback. But maybe add in the commit log that 
this is going to break them and hint at how to fix it maybe? For the 
error LED, I guess simply removing the error label and adding the status 
function should be enough? That would change the way to interact with 
the LED though (when using the label for example).

>>
>> I'm also wondering how you get this string... I don't see any label or LED_FUNCTION_STATUS function for the LED devices on ST boards. I'm probably missing on something?
> 
> As indicated in the cover-letter, the LED "red:status" has been added in kernel device tree by this serie:
> 
> [4] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1023034
> 
> U-Boot will inherit of these properties when the above kernel serie will be merged and U-Boot device tree
> synchronization will be performed.
> 

So are we supposed to wait on those patches being sync'ed with U-Boot in 
order to merge this series? Because if I understood correctly, this will 
break LED support that currently should be working.

I personally don't care what you're doing with the STM boards, but I 
depend on this series to be merged to continue the work on removing 
legacy LED support (which I also don't care too much about but now that 
there are patches for it, let's finish this :) ). So if 1 or 2 releases 
of broken LED support until the Linux kernel DT is sync'ed in U-Boot is 
fine with you, that's fine with me as well. We could also edit 
-u-boot.dtsi DTS manually until the sync and have the best of both worlds.

Cheers,
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
