Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C10CA451C
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:44:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55131C5F1FC;
	Thu,  4 Dec 2025 15:44:49 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8555DC58D77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyfsfsmhNeDJ2g3KnEte8xC/MSilWUag+1miAaB2TthFbenpMzp13cderHDa7n3mNLTrf9sqesQ2T3dLbkXAmuoBEUGy0K/YZSKylPZK1jXDd5D87BI+jgefYow3E2HSte6kc+41jiSEafMgbx0vGe0z7WPaxo7MgmyZqGG3Y7UvIih75qDeIJCATYjFU1O6CG+8zjAky8RC9Cdld92VlTgGVxa4K7vPuQSnGEZUuDqMONTiRzy4cTy43BWsnMHfXGUfrNAU3Vb/WBK/LL+AhEH+OCiRG7ejlz0IBt8cIdmIZVq+p8Y021aV1Pr3+o8FoIpQ/68v6ojN9Y/zldwp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dl/THlkqPqHn5Z1gvoxtecv8EbVD81B0xfiBTFrBh8=;
 b=uInq0WEYNF/HPPJ67nh/gjMBJ5ctbH9saMASd8GIaVVqxgk1TKTBLyuJ8Tzt5DsGKMmpubYb1WRSI8nno/9yRDuckdYFGBlocIJsTEnyMwHunkZIoJQl+jU1g8tsqcdsEiHNgzuwlBO0+HXmVNBO/5zg5y5K9aBcS9BE1WpzQjEbLiMm5xZZQpEeyaJ6tGDjhMUq9FBdHoZrJUfxU9+HlQeU8zH3baIruS57bNPW6dB48Ozzy1/FQt6ZK0wpz023Eyy/iHKM3oMcOXhXOGXdNwaTUdu55NW8Hb/6zWE2NPts2AhC0SxpUX8wV3+Q2G5sJP8qhydYuKpr5rhZhl+JEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dl/THlkqPqHn5Z1gvoxtecv8EbVD81B0xfiBTFrBh8=;
 b=eiJ6RNQ5tq9m+1PiTyVWr/J4lGuIG0Rj2SohsKXIOt7lOadpzIrTh2b7qJ66MS3VL6OoWOSI/n5xXCCA3cP+/zDSVwA9b95fuExZYP53bsGG7qiNO5yC9KdwCTLUj8djQaA1ZhRixZf/HCoPIPc26650ybnbnvtaLGR7vAAHqBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 15:44:46 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:44:46 +0000
Message-ID: <6c8725c2-cf51-4ff3-a91e-a5d1faf0375b@cherry.de>
Date: Thu, 4 Dec 2025 16:43:57 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-4-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-4-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a77baf-edf7-44d1-119b-08de334c0cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wkh5cERscnVHUWpkd2RhZ0UvTllFVDJKdDNiY1VIMFhGQVBSdWlMeDdUTUdi?=
 =?utf-8?B?Y1hYMGVwSVBWUmdNMzViZWdvM0VlY1J6Nlc2b2VXMVo2eDY3eWc4K3BEaGNK?=
 =?utf-8?B?UFdudFNMdXF6aFlya2dlNC9iQjlta1p5c3BSK3o5SjFSQlhiQklWRlFZQUx6?=
 =?utf-8?B?R1hKTHEwcHFacjd2Tk9hQmVtL1I5TnhHTG9ZSmh6ZnNib25yeXFYZXlxeGUw?=
 =?utf-8?B?SjFabHF2Sk9aZ1NNU2FVWGQ2SmFtN08wa3BHQkxUV2ZPSzVhUk9QT25Oc3lo?=
 =?utf-8?B?cHM0MTdpL29FeVhncmNmVzQzMHZQZXVFYUtQdG5RLzA5NGdXTlVpTkxIZnBJ?=
 =?utf-8?B?ZDROWmNOOGFWUyttS1l5WVdjQldGU2o4dVNxTjRzTVZ3M2ZQWDhTa212bTdH?=
 =?utf-8?B?SmFPa01ZZlB4cDBBMS9wb3RDQXFvV05MN2xuSDgzWjZLUldiVDIwYkxIVUJW?=
 =?utf-8?B?WU51cURuaUtkQWxtQnozMzdHbkVobFluWW56WGNITnJaeGxtM29uSE9oMlc0?=
 =?utf-8?B?ZTRIaUljOEhMVEZOMnNaT0Y4bGFjdGpLVDkxNEJOVFhNKzEvU2xOUExIZ3Uz?=
 =?utf-8?B?TkxBRnZJVkJHS2JXelV1RG9YNy9rRGFGU1NwK2VVd2pyZ1dGV3RyWDZVSWN2?=
 =?utf-8?B?enhITFU5M2x5MUkrQm9ZYy8xUnl2NkhvRGNTeU8vbE0vbjdmNTBUWTcwcmk2?=
 =?utf-8?B?TGRKUzlPdG9XUGN6UmNTZWlKdldjMHlhcWp3aU54ZVpHbU9DY3ZxaEJtbmVu?=
 =?utf-8?B?Z3gvNEJ4RU9IWE4vQnVNeGtxNHpTamJzNytQd2VmYjNsdXlVaXZCc3pwUU0y?=
 =?utf-8?B?b05USDFvOTBKM0dvVFBjSHZjNHZYTTErR2dzQUd2cDVTdGNVVURRUU1jRDhB?=
 =?utf-8?B?Z0o0N3N1M2t1T2xaRGhPS3gvRGFxK0Q1aS9zVnJTMWF5Q1UrYWJKaW93bTdI?=
 =?utf-8?B?Z2xkb3FGNUFSRHJXL2ZqY0RZMjRSRFJWSHRUZ0Zvb0ZhWmZOdGthNXNlYldv?=
 =?utf-8?B?b01jR3oyb1BBTnRTM2tNT3B6bSsreE4xcDZFMnR1NWNvZmc3TWlRbURTNUd2?=
 =?utf-8?B?UE42RjZjOENDQXNyRENLQnNlL2VaOWlFc3pLeksxd21KcTdQYXMwOHppNlJX?=
 =?utf-8?B?YTI4dWVnK1NBYk1XRTNNTTRsV0dtZmpYNUc0TEZnZHdiK1NseENOQWthNDZp?=
 =?utf-8?B?Vm9wOXZWN3l5SlJVVm5TYVBQRWVmNnJpdlp0Ti9Uam56SS9TdHM3N3dpM093?=
 =?utf-8?B?WFVJc3hKWmlvZEp2QnpvcnNSVVlHcE83RzBxSldLQ1JyZzc1aFA4NzIwTkRG?=
 =?utf-8?B?SzF3UU5rMEhINUR5YzZ0ZFJwbWdkQ2FBSFFtRmN4dTZibXU2U0QrdUZSdFhM?=
 =?utf-8?B?bU1hMGJweFl5aUVpL2xmZURXNUdxTUV5aDR1dkZhaHhlVTgrb1hlM290VkJl?=
 =?utf-8?B?RU9NbUVQeHJDdEhNOEtWVW1rT2Q1NGV2UGNIWGdOTWh2VEphYWVvQjdNUUNu?=
 =?utf-8?B?TkhGM0xWbG9mekJ1TlFjZ3ZsUkZ2YnAyN2hYZStsc1g1bHFWME1IdWJrZmlJ?=
 =?utf-8?B?RHJlbm5GYXAwMmdsL2RuU1Rta0hFUlArOHp2aXd5RWhvVnd3T0pLb09yQTdD?=
 =?utf-8?B?a0FNTDBmSnBwcXd3R2E0MnN3aFFnWmcrM3EwaE8rayszeUFsaktsYlIvTVNV?=
 =?utf-8?B?R1pFMW56SkFXa1BaNG01M3FpSlBNRTNwK01HWGJCejlVQXR0emlYR0p1eEo4?=
 =?utf-8?B?VkRoMTd0c2Erb0NzUEdKQWl1RVg0bUFFU2NYSkt0NEdCWUxjRGdCbzdDbG5G?=
 =?utf-8?B?Y1Rnc3F2QTJMVU9pS1QrdGhvbnNONG8vbG9tcVlHU2VvbnRYMlZaNjJTdjVi?=
 =?utf-8?B?YjlubDVBeVlvV1N5WHNyNEV1OUpJSkV5TW9TM3oySTg1REd6azk2RHU2cHha?=
 =?utf-8?Q?Wx19MUpdG9H6ulq9hyKoG21hN72Z3YR4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTAwaHE4Z2RFbFVJK0dlc1FiaDhvbVppcEd1d1hXQThUdnA2T0hZZnBvVG5h?=
 =?utf-8?B?ZUZRSkNrM2E4YXoxWTh0VlV1ZTQ0RVNRalJJZDNRRlNIRFJ5aVF4K0lya1pz?=
 =?utf-8?B?eTFaeDRsUmo4YitlL2hsQ2hSNDY2a2xKOWZaSVVBQUZUclZOSjNwY2R6WWp5?=
 =?utf-8?B?U0FwZC8wQWlDN2dqUnlxa096ZThaMVJaVzZDb1JOaWNjaVpYUlp1L1E5cERT?=
 =?utf-8?B?WFgrVVZUVjRiMEVFeVpuSDdRV0tabGhXREYwR09iZllleDNEa0U0RlJqNml1?=
 =?utf-8?B?YWYyVXRjblhUOTR1T05UT3J4ZzU3NlhNMXNxYnMwZzdnYkQ5SkpkSkZlU3Bi?=
 =?utf-8?B?Q1kwQ3hOUEFzOXo3dGpIem9wc0JPYlNmYnV5enVWZUdCeWcxekptZGJoWXhB?=
 =?utf-8?B?L01QamhQSlVTMHZucmpxUUdVV3hUOGRld3FGWHAxTGZJaTNlS2NDeVowRFVQ?=
 =?utf-8?B?NkVBTmRoMTBBSWxzZndsQUpySVFMeGp0Y0w3ZzBuZW50VWp4T3FvZVlZN3k2?=
 =?utf-8?B?OVJTTFNqNlJtR0ZtUFVFMjVEMXFCRzJOVVRHWGhTR1VlUHFJQXdrL2tVb2NO?=
 =?utf-8?B?UXVjUU9UQWYwekR2bGRZZ3NHR3BRTUY0VUx6NFZxN3gvOXdBeVBXd1FLTlZ4?=
 =?utf-8?B?Mmt0WnE0UmowZXdOV0IrWVI5YVdRR3RBOWdrWjV4WjgxU2NKMGZJSzZCcVpm?=
 =?utf-8?B?UXBRRUxQS0FNRkpnZUdFWUY0dmtqVFZSQTVqZFBqNXV0bFBLNkc0SjJGTjQ2?=
 =?utf-8?B?Q0tEdWVjL1VqaE1ja2FFTzZmaTV5c0MzQzdGWHRNeTRlUWorMUdwdUxjR0N5?=
 =?utf-8?B?VlFmQ2NuMTJ4RmhhNVNQNEoyOXIzQk5XYWZLdzYyeEdBRWQ1YmZvQTdLeU0x?=
 =?utf-8?B?TUhaTFpyWFRXNHJmTnc5VG5pTWNkZXJxWU9zTFNLbjNDdGxwWm1PcjE0akox?=
 =?utf-8?B?TEJITzlvYUtrUzFSeFdwKzY1ajRUZWhENU8zR2ZBYTN2UWdzNTVMSVg4RnAx?=
 =?utf-8?B?T3JXeU1KMjgvMWhBVDVQV0Q5RUlqT0VKMWZ2S0x6VFJTcjdjQWlSaS9DVXdU?=
 =?utf-8?B?MkxMdzlBZjFRVkFHT2RTc21yVVZpTTc0WTM4RXJCRE5PTnU4RUpUZldrVkhW?=
 =?utf-8?B?aUlRbGsvcWkrNk5ZWUhPR0gxNDYwOEl3SXJZbjM0OXFnazBadW15V1VQMkxr?=
 =?utf-8?B?NnZsQVRhN2w4a1Q0LzNNalVNWUE1Rndhcmh2dE5jK1E5TVVOb2NiNkJwVHR3?=
 =?utf-8?B?bjB5eEl3SCsyMHo2NERWNGZZcmRIOHRzeGtwU0R5NGFUVVhCaERyeWsrV05H?=
 =?utf-8?B?VFB1dUhjelZQUmRiUHM2OWdNQUtpNk5aM1NUVkh3OFVvRXZTREJ4Si9ac08w?=
 =?utf-8?B?TmhHcklSMFAzVXRHUGU4blRaQnJEUmNYUWZwcDNDdXU0S1E1cmhLeUtxYlR3?=
 =?utf-8?B?MjlMdjQ0aGszSmNtNVBlWDQ1RHZKT3hUTENsQnF4RWhHM2ZkbStMcUNvbEF0?=
 =?utf-8?B?YmI0RzNTUW9CVEEyVnJFWUlCTjNpMzdNazIraE9BdG9iNWdKSmRWbG9rL1Vq?=
 =?utf-8?B?d011YTF0ZmNYaFM2V3RZUTBHbjVBL0tMWHRUbjFqUVF3c3dONmg4OW9nNXVL?=
 =?utf-8?B?ejNBcjYyNlZzQnYyMHQ1dmZBaFJXa0JNNjlrcmNJY3d0YlMzZWxOMys2WmVr?=
 =?utf-8?B?OGkrTHFHc1ZldjdhUktRcU1DMTBaNThzVHNQdjF0RHZ4bVRHM3pnem9WeFIr?=
 =?utf-8?B?d1lTL2pEQ3hQVDFKV1NDUEtsT0NvcEovcG56WGZrUDVGdGg4UFdad0M3endC?=
 =?utf-8?B?WlpqUk9ab2pCSkV5NVJReThJVnRBVE9OaE9aZW1iRVpmTm5icjZOcVVyakV2?=
 =?utf-8?B?MWFjaVZjeWxmcENDUkRPaEpReElNR2RET3p4dEpabE1PY00xM3FpcTZ1Z1F2?=
 =?utf-8?B?bVAzd3kvY3Q4RXBqa05Xb3ZuQXZ6Y28zdDIyaHc4N0d5WmVUNHRJYlNtSVJ6?=
 =?utf-8?B?eUc5dU5DVmdTUGFFZ2tCVWR0WFU2YVN0MDc4QlJaS2pmbGNmQUZiVmNtVGJk?=
 =?utf-8?B?MCtFMW1uZGVjTnB4WFNtU29xMnIxY05VUGRmNlpaUGxqSXYvVGJGNC90Zjc1?=
 =?utf-8?B?TU93Z1ljY0pIQy9vRHUyUlRIbDQ5M1BQaUw1QWJDdStmRzdUMm5UMng1SzQr?=
 =?utf-8?Q?igOgvsEBOHVe1R5qX1+WpWs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a77baf-edf7-44d1-119b-08de334c0cff
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:44:46.3348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9wm0rVoLiufZI/pxCjAAHrcXTRcMVNB4Mi4QRfmpENoy3E3ESGbwR9F3yZeocTNCyQovfm0H/3Rl2PbrXlMn9g/PZYrTISAFZ9+uP+yN9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/23] board: st: Update LED management
	for stm32mp2
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
> Remove get_led() and setup_led() which became obsolete since
> led_boot_on() introduction. led_boot_on() is automatically called
> from board_r.c
> 
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
