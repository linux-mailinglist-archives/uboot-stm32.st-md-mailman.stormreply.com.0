Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BDBCA41F3
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 15:58:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1DAAC5F1FD;
	Thu,  4 Dec 2025 14:58:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4844C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 14:58:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6IybFTiWFIgn0kBXlZyeHiZqc+TOJfxLLK9QpsUcMypstREY17ahVkTqdbGhBb8MdAOR57FisTzwUoi5REbyjAHGxU5K0329JB9ZW9rlwTJXSl7A5eEcC+S4sJqH3haaNOHEx9x1wOVpWRPXI3sQml/BLOB/k8DEH/W0p2yodiYKxibspvR6wHieLGRXJPlTUGlW7ESr399TFmqXRewOBdajYC1PFRtE/fTn2U7E7NkCsyk1ELLhjd/tRqJ0aroIvhQRv81DCRMbhBiz4Tdtab2043DzqVcyiNDfcTXoxYKxzgLPwN5qTiAcZAtqDv0oBDE/zKU1APf8Rv2otkzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9e0Uvd/oWoo0JcnFYx+CsQFlin1hghNyT8mnd816Mc=;
 b=JQmlYtPUznNymmjNcVJMLLa6eKXpxXLg1ZsNzQYVUTwloE60lkL0gHBBaEO+R8PJJJXiYGf+cu7tsTIjONauJ6IHNNkm1lQPdZRYyDGn+laNsRfKTpKhdp1xoIMTRglREHXc9kbn+k/rYiar5wsqZ1u10RSpStH7z7WsDVPQX34eo4LQ7+vofIgPOrwxS60M4um1txtN0X0pfuOmjgXzu39IKQwzL263l5n+LnGeIpSZsJrjw9fxRbRzXI88Aj+SItGSYRszJT+sswbI46aDBdVf1/R1JoeGTB29RPGSE8VZGTC7ejVnR7PEwk/I11ORS/523jBGqsvTF/T3rH4AZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9e0Uvd/oWoo0JcnFYx+CsQFlin1hghNyT8mnd816Mc=;
 b=ePZakK5OJ5/ItRjAgVl1zNk5p4u/MBJUgDh1kUMHK0g1Lg0knJTd+wJN4dlJgDO2R0KlG6q1BrmTQ8LsI1GI39bf9juGJ+otJqOeUS4CviJma67T3K6oZwoetISnCbUKp4R0jM5xh7slMY5kmyckmvbojAmY1bHgjyPp4LRXKXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA6PR04MB11736.eurprd04.prod.outlook.com (2603:10a6:102:526::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 14:58:07 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:58:07 +0000
Message-ID: <0c09e4af-d4d9-466e-b20d-f2e17c4a93f4@cherry.de>
Date: Thu, 4 Dec 2025 15:58:02 +0100
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-2-patrice.chotard@foss.st.com>
 <68fd4327-58b6-49d5-9f37-594e16209708@cherry.de>
Content-Language: en-US
In-Reply-To: <68fd4327-58b6-49d5-9f37-594e16209708@cherry.de>
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA6PR04MB11736:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c92d7a-cee4-4fc9-7e16-08de334586a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGt5ODAxbzFSWUJDSWxkQ3VtSzZvTk9MblR0bTIzRTF3VlJtK3lUdmozejVU?=
 =?utf-8?B?Zi9FamVQU3JYcjBVUTRUb3Rzdlp3YmJOZ1ZHWGZDTllscHpmWENMUzI0OHlp?=
 =?utf-8?B?NWxZRm9KRk44U1dIZ2ltaGxxY1BYYTBoZWZ3LzIzdW54WHJkOUF4a1JtUEZB?=
 =?utf-8?B?eEdQbUJnNVQ1YzBqeGpFNWJvZTd4SkVyUXNWelAybXlNbFpDSlpTSUdCcHc5?=
 =?utf-8?B?UzhqRjkvY2pNa1FHNmVNRDlxOERNcTVuNkFhMkdJYnBFVGRoSVNIbFNiclU0?=
 =?utf-8?B?cU50VXE1S2Juc0FmOHVkM1l4SmxXMEI5bjR0Rk56ZDFCcXFUQUUxbDllZkdm?=
 =?utf-8?B?SHVxY3ZaMWQ5QzdBT0lnQ1lRbGhXUFUyWXpBbG5QY29DdUtEbElQVnlKc3Ru?=
 =?utf-8?B?aHl3SFo1QldIRWFmd1F3T2w2eHkxR29TOFlmZjFYVHh5K1BoZk45Ry9YY3RP?=
 =?utf-8?B?Qi9mS2k3MUFMSTErM1Q1QmkwZWcwQ3d1bFcrOWVNbXZuLzRXUjVhcHNIS29I?=
 =?utf-8?B?RlBWZ0hPcFg4dkhjQ25UN3Z3d25JQlZQQ1FnQzB6YTdQVmY5bWIvK0hYbDhv?=
 =?utf-8?B?azdaWjlERWRjNjFZd3hucC9RT0NZTUVWaVlDMjVPNDZMUHg4MXBLb1VSY2N4?=
 =?utf-8?B?LzVkYnE5Qlp1NFdtcTdNV3BqRWwwUEN2SXZUR1B5N3pSZkxHa3lHS0VuUmph?=
 =?utf-8?B?NUJjSlFrS1F3bDRYcTlHaGtRQXNDR1IzWjBnYlhPenJ6am0wMXk1VFhDY2U1?=
 =?utf-8?B?eEsrNnNRdXZpeVdmdXdTMzJOempUV1dXdXNTNnFsNHZBb1poZ2FlWkl3MStl?=
 =?utf-8?B?U0JhWlNxa0kvOVFaOGlmb1dRZVdjSGZIOHBwMmg3cW1VV2VrNDRwenNsODBF?=
 =?utf-8?B?ajJsY05HZzlxdXJqZ1VMMnN1OENpQzJlQVBVYU14dFM4UWRTRERQME9JTEU4?=
 =?utf-8?B?YWpCYmJlcUZzTVR6ZXd0UE5LZzVNdU9BV3lvRHpERDEvVmxvNmdqdDZFT1o2?=
 =?utf-8?B?Q0ZEdjRDaDh1ODBIeXZiMDArbTl6WHBNVEsyM2RjM2lQa29NV243a0krUndH?=
 =?utf-8?B?ZzZYczVrd0JyYWxNdSsxOHNrOUpYbE9PTFUxWlpjL09YaTMrVGIrS2lPTG9L?=
 =?utf-8?B?VkEzVXprOVpkNmc1NXRCYUVLb09TWmJ6dXV2aFNORUpNWUNpaTMzN3Q0SmN0?=
 =?utf-8?B?bk9mbDRzV2NsOFlpTlR1TE8zZ2oyZCtqK2xuVHRvMjR6UHpDM0ZmSkYwa1Fp?=
 =?utf-8?B?YkJTcFVtUmlUeW9xd2dzODUxbUJSVDlEZlBKV0JTNmZDYUwxcVZHSXdHZVNG?=
 =?utf-8?B?c0hDaTRLTk03TnBhVXZJaU52d1o4Mi9xeVdyczhPNzhCazg5U0N2U1BBbnJk?=
 =?utf-8?B?MXgramNhNDJJc2VoVFVBYXdUaHFSOGo1TTl1V1dNS3dtWGlVR2hsQ1pYejlr?=
 =?utf-8?B?K0ZubUNzNXVla0djNXpvZVNmelcwNHJtYWpielVacVBmWWQzYjV4ckpHejNU?=
 =?utf-8?B?R1RNZzQ2QUZYbEtZNmVwaU4wYW56SFdaN2VhQVNrTGdOTGZ6ZXRwKzh4TFU2?=
 =?utf-8?B?S3ZCc3BkdGVKUmIvMWV4YkNXaTVZUDlzNXRiY2Frcnorc1I2NnZ5VHdBSjFo?=
 =?utf-8?B?dWVMcnJML1R2UjhSbE5NeTU2SGhhVjVvWmpEUjhmSGkwSzBZVFRPdk1QVVF1?=
 =?utf-8?B?Z0p3OUs4Mjg5ZTBFSzFBRlcrckVqNXZJSEk1OVJUbEoyeU1icWJscXp0WjRX?=
 =?utf-8?B?MnJqQkFiVEhaNlpLRzlWd3JFTnBPYjRXTjRqNWhod2lXN1RkNjJTQ3d3QXhD?=
 =?utf-8?B?WEpmMVp4R2w1NFhvWEM4ZklNaWR4eG9remdwNElKS1E5M1prRThIaTRTWkMv?=
 =?utf-8?B?N3E5YSszYm5BcmZUYk1ibHpKaGw3NGhLNW9UZTBQOENWSDJ0Ym9NeTBJekpl?=
 =?utf-8?Q?jWoGN+rm0Kylqk0VZFVQGoSdui0eYnMK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUFBL0E0TXM2elQzV0d6S2RnY2tLMFVQb3FMOWI2VWtXKzkrMWs4N0I2dkxs?=
 =?utf-8?B?cWJFdndJTWtKdkVQd3hDb0JzODJsZ0x6K1BFcmYxOHpEcUF2UWhGaWdJaFNC?=
 =?utf-8?B?Ty84K2Rpb2tCMDI3NUNIdWhmY2RzWVExUFhNeVIzQmtKVFJYTEgrMWQ0am5l?=
 =?utf-8?B?ZFVTeEdQR1huVlRVbVliOG9McmIwVFEvL2VCZ3d0d2o3U0I2MFpYZlowRHJE?=
 =?utf-8?B?SFN1M0twN0M4ZmJ5TnVDdEVBTTBXRjVQTWllMVdyeUxkRFRmWFlGcWdaNnpz?=
 =?utf-8?B?RGtnelJ4QnNjMHhaOHJyQnBjTnR5dVVEME5nYnFRZUMxRFpTSFBiS0FsK2RS?=
 =?utf-8?B?cUphOEdMeng2cllEaWc5U21GRFA3a3BHVlFOeUwxQ2NRR25HemxwQ3QyenVM?=
 =?utf-8?B?ZmFPV0xUODZwTDZ5QkUvaG1CQzc5c3d1QmduQU05VXRmSWpGMHd6T2FkSFAz?=
 =?utf-8?B?alhZbFAzOEVtaXFCZjhET1hyZ3RFNnIrbEdYL3ZZSEEzTCsvNjkwRVJ0bWt2?=
 =?utf-8?B?QTIrQy9XNzVwbmFFY0V6bThwMzlYdHV3WW5DeUNjdE1BT21OVHd3V25aVzcx?=
 =?utf-8?B?bVdXL1BRd2dtZ090QkgxazQxWWZaNkdKbWlWZmFkMVdLQnUwOWtUUnRVQnRh?=
 =?utf-8?B?L0V0TGpUQVRBVGNMUys3Zk1YZnI5U2VaUWt0TUFOUkJOeUU1L3F6SVFKb2Nh?=
 =?utf-8?B?R1J5cWp0VGViWXp1WjRYaXo1OXhYVTJBVlFqQjRBakhVTU00ckdBMTI2VGhP?=
 =?utf-8?B?TDcwdmVCWDllMXpGMW5DUG4waWl0UFFzVWZxYnNZaDR0OThNdmZPaklnUWNW?=
 =?utf-8?B?dHNoVUdyMDFFNHFyckNKK1J0b280K3dLVXRtV2hzRzEyQ0NUSEpERUxSVG5H?=
 =?utf-8?B?YTJPVUliVXRJMmwxcUQrbGE0Q0pVeTFaWDB6YktFMXBsaWwzMWZyUzVnYlRr?=
 =?utf-8?B?V3ZwTVA1Y3RBMXdNenR3NnUxOHR0YXZ3YXlnNTRIUlp2MHJDSCs2REVyNVFk?=
 =?utf-8?B?VnhlN2twdGUvV0padGRRWHNKZ09FN0dwRGt1dUM4czE2dHB0c3FveXlNc3BY?=
 =?utf-8?B?NmpYaVJTbXYxQVlhSCthVzQ0Y09zU3RFaGx6bE4zZm14MVZXWCtycGVNR21L?=
 =?utf-8?B?eGxXd2RJeW8wMC94dDQzMFRzcm9nYWEzK2ZFM0gxVHdxdlN1b3ptRldIcnVS?=
 =?utf-8?B?c1VVR0FYWm5xSmZRSU42Sm9oc3loaU54RXVmV1VxQml1Zzh1dmlKWjQ2cXBs?=
 =?utf-8?B?UVhqcXQ5RDJoS0RPU2tVRGEvNlN3d1crLy8vNmNDVUkvNnNIeEM0c1IxcFJO?=
 =?utf-8?B?a3dsem01QkVlK2RGYUlMSDdYYXVjaTlwVzd1Y053MkoxcmdKbHd0dTFCMUZT?=
 =?utf-8?B?bWt5eGdoWWRONW9QNW4vL2dlK25LeEhITDV5c0UxNDF3WlZnRlNnMmNxNnFN?=
 =?utf-8?B?bzI4UDVyc2JIb0dGT2pZaEM0M1N5clpOK0krUlVWZGNLSjlibVdDeGlVdGxk?=
 =?utf-8?B?cXl4RFU0dXF3bzhZenJ3OHZmRTJBaVBuUFA1VFpqUGduVVAzRFVROU5EaStw?=
 =?utf-8?B?cUUzNkFtbWF3cW5CdU5BaDltd2NnUTN5NFI0eW9Bd2JsT2Y1TFJyRFVRQW9a?=
 =?utf-8?B?U2tuWE5Venp5RVRkbSs2cmlidWl1d2h1V1J4QXRFekJTNDhSa2tMOE5pbVBv?=
 =?utf-8?B?U2N6TWlVKzV2WjM5QTQzTDBoSnRtc0NoZkt1bVhaUVNUVjlNY0RnUXZDME1V?=
 =?utf-8?B?TkxQcEVVWGxDV2hMRHhqRC9ySUk0eWE0bVlFTlhadmg5RHJsN282WUtQWkQ1?=
 =?utf-8?B?YlowY3ZMZFFCOER0ZWhLOHpqa0gyNzJZcVBkOXNxb0o3Wm1odzZhd0MrUWpE?=
 =?utf-8?B?c2I2Um1CWEhiSnMzOGxkbkJ6N3huT1B4UmZUN08yeEZMVDZvVGJLMDJXQVdJ?=
 =?utf-8?B?RUlsR1pDeVd1V2JEeVYvdzlaNndwL0ZySlV1TlJBZUlJQkFPamJwZ2NmOE5j?=
 =?utf-8?B?OEdDUm95OGpySHNzSFpKK0VrU3pOWDA5VlpueGpBaHk3a1FlRHRFTjNFUzZi?=
 =?utf-8?B?VU55UXVKOVZMYVV4cGZyMTBwTGMrWDdFbVgrNEhyeFMxc1pMd1pNWFVhWllN?=
 =?utf-8?B?cjhaUGFlVk5Zc2cyK3pMbjhxY1ZMQ012bmc4S3JvWXJFWWhDdkorSmYzVEtn?=
 =?utf-8?Q?sUE0wRa3O/yhx6XB+EQXziQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c92d7a-cee4-4fc9-7e16-08de334586a0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:58:03.8572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdnCRfIcByZSDt1qb2BmvhtrD0tjUvDAh7i989iryoxPGH33zwS4Njcz8m4z/ediYGtJ3gW6UjJ6T7aYPpjYjtf/aAIAIP9Oz7+3uS++lYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11736
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 01/23] board: st: Drop old LED code from
	stm32f429-disco
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



On 12/4/25 2:12 PM, Quentin Schulz wrote:
> Hi Patrice,
> 
> On 11/14/25 5:23 PM, Patrice Chotard wrote:
>> From: Simon Glass <sjg@chromium.org>
>>
>> This predates the LED framework, so drop it.
>>
> 
> Well, we could still use it with the legacy LED API if we enable it, but 
> stm32f429-discovery_defconfig doesn't, so I guess it's fine?
> 
> Since it was disabled, I assume we don't need/want to migrate it to the 
> new LED framework using DT?
> 

OK, this is actually done in patch 4.

Cheers,
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
