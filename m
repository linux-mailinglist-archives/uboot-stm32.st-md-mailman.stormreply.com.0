Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724CCA41F2
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 15:58:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0013C3F95E;
	Thu,  4 Dec 2025 14:58:10 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A1EEC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 14:58:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhoVUfKc35bPnDXpDgCoS1M3+7Mk7kAOZFnfXYyoYICu5XqA4Mgz0VeRE9zqTFt+qC1Py4EIToBxrRtPIaIAYOA0F2DfUMR61RzjUZJf2RMYt8hmHaxAp8aqI4Zzd6U/VZRxSNfYL2MF5f5dlIVSb3QyNvVIzhZCw0RDGMcxbOh5nzUSiuObuFA2TmPpzY8QMGH7/vEHxL+bUKC9fbgu/ZJHsJjDFqGOaVXVAGgHZwwYzvVXWi78Xbd1sJSInSDobU90/nwgybQUKANM6gaY3/dAzVzphde8oYwq/BiDCQWq5rAQfvChCmgUhhL3uU9+RnDEIuc2ecfwUlg9uERKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9e0Uvd/oWoo0JcnFYx+CsQFlin1hghNyT8mnd816Mc=;
 b=k63aFeaXrDXqUZSwhWna/7dOMQGEFogXPrPCK/lMP6aPcb/4QCx2xfvTBMUWc1m+LQhdJc3WF+EIhVzJZsWM88Cywr0EyfzldXIhG+iBXd0VUOd1swKe74vO1nzbYPWi98YS9ptMlEo5WBA2MiPyFAD5ARsEdvQSeP7oiTBzbWUvH3cBzvEz/WnkQN0kfQ6vWDu4NZSulvOoLr1grc9GiJwpW/9ySuyoBicarPOq/KDdPOWQO9SZTLhkjbdxBYat/hbdplU8yc78RumbUypA7EM0Yr1tEr2CFkNtvgDc7EicImuTy+jsieLC//rPLkQZTLdvqV0JV2CllNXgcO/LHg==
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
 by AM9PR04MB8715.eurprd04.prod.outlook.com (2603:10a6:20b:43e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 14:58:07 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:58:03 +0000
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
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e26bd1-d7b1-4070-c908-08de33458668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXA0Q3FONmUrRHN2UVNWV0Y4cVMxR2xTN2ZhbHYwWGg1SUJlOFMrZGdDMkZQ?=
 =?utf-8?B?OXlodEhjNTBTaDU0MDlPdXJWL0NPMVNjTFhTcGxuNm9sVVYrSFZNYk1wTFoz?=
 =?utf-8?B?TkRZSGsvZk84R2xCNmg3M0tsVEUzOFpndVN2RTAzSWlWVFN0Rnc1bzloWGs5?=
 =?utf-8?B?NVh0WHRiemN1eWVjUDZncnZVdFNTVldhRlN0SjhzVXFjT3BZaGFkQmU2d1NG?=
 =?utf-8?B?OVV2eWhORW5OSTFhV3hIMGNrVklsL1hZNW0xVmplTlZlazZPQ0dDT3Vtclov?=
 =?utf-8?B?eTBxYnlsZitTSnE4N28wYkozRU5CUElNdlFOTGFoME1XUzh5OUZwSHorOTVM?=
 =?utf-8?B?am5UYjN6S1dhMngrdDI4UUNKRmJ4bUx2YlVrR1VmWElHdVdtbkdnMDJSZ2hn?=
 =?utf-8?B?Rmo4cjl0akM3bEkrdDltWmJRV0oxcXJGQjFSbWc4T1BKQ0R4MTBQNVpEa3di?=
 =?utf-8?B?WWw0MGxzaGVxSlhKZWg4cHcvTkwzQ1FnQ2VvdWd3ZXNVUDBwU09sZjEyWlRl?=
 =?utf-8?B?RHgyem5vbW1nc1gyU3BqTnJCS1NTdzhRWFJKTlJsS2MzTVhvVm9PWGwzaWdV?=
 =?utf-8?B?VVFGMlVWaks1ZTBraUQxZTZVUEJuTHhhMGhvWGlPVVRVaDZwc2VaRWhJU2Vz?=
 =?utf-8?B?NjdVeW05T3ZEd1dzV3BOSUo1a0pHeXFTMkd0T1V0amh2VDM5b01pdzI3TXV5?=
 =?utf-8?B?M21nMHVTZVhDcFd3VFY4RlhVNGxYUXp0R1RKa0Z1anlLSm9jajhLVTI2WWdP?=
 =?utf-8?B?L3p1S2Z4MFl0cWR1TGhzTlJqc3VRNlpYcjhkQ1VvbHc0QUVGYU14Q1M2bFVK?=
 =?utf-8?B?WDdnVFpzd1BXTnB3Q1l3NEdob25MZVlZOVVSWnJBMUJHay9ERWdLL3hhcDU1?=
 =?utf-8?B?b0J5RlBmYzhoK3lLS0IxWnlLcW1Oclg1a2loREo5YmNSMnRsbURwSFVzUkhC?=
 =?utf-8?B?T21XS2JZblUwL2QzZ1p0SFdnYmxKeEo3WFRESDZnZjBZeDYyMjZvcXNoMlRL?=
 =?utf-8?B?aHZuWHpUOXpPL2IzRElaejlmc3dHQUF1YmRuanJLNjd4cCtCK1lDemswODdL?=
 =?utf-8?B?RTlMeEhqUDdieUo3OWRJeHRRYTRzb081TVNqNEMrWTFleUtZM1o2SzcrMkth?=
 =?utf-8?B?bXBNeWI1L0JtNWNtWGxPZllPUXJDS2MrK2RoVmhDWW0rbUgwOFFQajRsdm1Y?=
 =?utf-8?B?Z3pRK0xvZHNpU3ozZnlMdGhYR1hWWktITWFaNm1URGRNa05EaVNYTVdvRENa?=
 =?utf-8?B?cUN6amlHQUN5S2UydnV1NFExaG1Rd0VFTXd3OTNxaVZPdTA1VTF2QnhrNmU1?=
 =?utf-8?B?NlArZElZOFU5VHVPc2VjMDAwdVd4T2RxeTN3K2lRdlpWb3NxK1Bmc2ROY3JD?=
 =?utf-8?B?MUg1aGlhRENnMk1HV2JzcU5iQmg1QjN2UXBINXdVdGFRQ3JTRmdIL2VrSzBm?=
 =?utf-8?B?TmZ1ZVdnQnI2diszeEI3clQwWUtqUUd1Z1dsZlhEYmp1TWRLWk1DL3l3M2xz?=
 =?utf-8?B?WmNMZzllQm1Ealg0Ry9hbHRMd2drMFB5by9Ydk1WUmwrNmc3NHRjWHhEbGJv?=
 =?utf-8?B?MjV0dTV0TXIwS2lOV2FjRFpKWE5MOVF2R2pUT29Ld3Y1eW1zN2lvM2tkK0VL?=
 =?utf-8?B?bzMxcEQzenp0S0lCZ0VWL1ViQkwxWEhSQ1ZWaTR0M0dVa0d2MkI4U0dVRkNR?=
 =?utf-8?B?V3RRaHBKY2krUllrRTI1cElLL3FRMkx4dUl2Ui9Rc0R6b00xc1Q2RHVBeXFv?=
 =?utf-8?B?TXNYU2RGTHFPOTNiR0cyaFRhb0VMVkZ2U01rYWpIZFN6R1hxRGFNSmNHU09M?=
 =?utf-8?B?a0JjZHh5bkpjbzRYYW83Uk1JUVlFMHRwV2JFMkZEem9EYTZoZG9wRzhIbEdv?=
 =?utf-8?B?ZlVMUHI1bXAwOXZXN3J3Snl5Q2VJS0NFNG1JdVZhc1NrSzdaemdhUHI0Y3cw?=
 =?utf-8?Q?sRJHnWQx42EowjJEnRUbw0UgEBeRtoOo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHJINVY1ZDVVL0daTUlrc2MwRklnL0pGWXJFUXFFT3M0N1JiL3kxeEhVNHQ3?=
 =?utf-8?B?bXNvbjNVRVMzTG53bTR0UmdaM29RNjBrRTY2SmpMR0R2U1h0NUQ3aEQzQlNl?=
 =?utf-8?B?ejBvbk5tMm8xVzNDWHpnUmtScWJlUytYMXZNb0xCRjVsRUhZWVlzTmdaT3ZZ?=
 =?utf-8?B?LzNPSjY4M1R1OHZHaDRNM1NLbnJQTzZud29VR1dvTHJrbG5YcG1MZ2lSaUpG?=
 =?utf-8?B?ZENhL0VMYUF4NHNWRlZreUV5aW5SbjFpaUx2VmYwancxTnBwQkRKaVZEUFBo?=
 =?utf-8?B?ZWpWM2NOUTJSTlpNUEZkdXBPV2tDL3dvT1J6dEtXcHlRWXQzRFU3MGhOZlUy?=
 =?utf-8?B?b3ozMmFvWTlxY29valJUR3NIdnlubFJ4cHEyWTdOOXArd2EwZGVwSWd3RUVL?=
 =?utf-8?B?R3VLVU1CbnRnU0hMVVJGKzd5K3d0TlZaWVBKS0VxakFuZUNjcUY4aE1WVkdC?=
 =?utf-8?B?TENXY1hvV1d3eGdqTS9BSk4wTktSM3Q3enpHMlVCZ3N6aGlsdkhmeUJMclI5?=
 =?utf-8?B?VDBVeFFzdzY0ZW96UWpSd1E1S3hqWlhnTnIzVnFZcUVId1N5MlpmTm1PcGMy?=
 =?utf-8?B?dHptMXNEbFN2UjYzUjJudDRGNjBLbUpPd2Qwdjh0MnJBLzlKYnpKUnVCcC85?=
 =?utf-8?B?V2lzemdOYmVkSTlINDlRdXMyaHdXMHczaXJIem96OW5aRUl0N281bjQ1TDlo?=
 =?utf-8?B?SHA3OUpzQXRjMVN1Yk1JMzJRanV1RDltejBYdjdHdWpMSThISklRZ25vZ1B0?=
 =?utf-8?B?ZmFINlhmREp1L1dLOWZpYnVCNFJGUUtkR2oxWHVSbEJ3SE5tclA5ZVlRK0tv?=
 =?utf-8?B?VXVQeEk4R1V5MHVZblhrS053VlZPaUZIZ2JmanRGQlVhS293eUFpUjFEYVBK?=
 =?utf-8?B?YzNLbTJ2V2hIbGQzZE9tU1hQR1hHN0h3cnJBRlpkWkx0TGZoTDRYV2tWOEtq?=
 =?utf-8?B?cWxlaG1SNUNFYzJvTVZZS2VCcFEzNGxQR2JlMjRrZFZiSGhVd2NyNHVINDdo?=
 =?utf-8?B?WUlpVFZkY3c4dHltc0pud2xWajBxRUdwS3dOMmJHQ1BXTlBIMEkzckF3OTM3?=
 =?utf-8?B?YStXbXAvWVkydWdFd3NzNjZSeE5DaS96TlBkdmllL0FNYUpHOVlBOVJZa1VG?=
 =?utf-8?B?Z1ozWTVUMklXNG1aNGREZjlNdit1OVE3Z1pWalU0TGdIaTRZTlRFaWJGY3lU?=
 =?utf-8?B?VXFlK25vTXRrZ2pVdkRvaFViR0V4OFFPOG5RcHozQ3RFZXA2aUxrZFhwajFH?=
 =?utf-8?B?a3o1WWlLL0xiOEhUMVVSbytBUjh3YnJpWFlISU4wMlhuY2dXR1FCbkJ4elBj?=
 =?utf-8?B?THFsVWpwbWhmSVpvcEZFWnRZdlJmVmdycC8ySU1XQ1Q1VHpuaytoUWd3SEpp?=
 =?utf-8?B?aGNiZ2UyUm1WRGVzeTdWZThjR25mSEVuSGlOcTdudDg1STNQU2k4NXduM0JP?=
 =?utf-8?B?WFdqR2Jkd0s0YkR4VXBTWUFMWFZTaHNxYjFoYlJRRW1kbG5ZN2IwcWMxei96?=
 =?utf-8?B?THlsM2FzRDhWcm9PNzNBUGhSZExjbGVLOUJ6OW5qbDI3ZmpUTW1Va0tqdkVv?=
 =?utf-8?B?QkFwSE5YWHE3cCtkdVBudzBsSGV5Z0pyd0R2TmpCTk5xZ3hrQ24xRWpqcHNL?=
 =?utf-8?B?ZGk2ZFIwTDhHcW5TZnNicnI0bDlxdy9yQ04wbTFrdnRsUWc1S0dkYVVYdmxT?=
 =?utf-8?B?cHZ0YjhUY00zTkpWbVhKR25lSWJZQTdSd2JnV2lYd1B0UlZpTC96elVFUUV5?=
 =?utf-8?B?VEduWnFHN200K3lMamNKK1A1MlVsZHJ3b1hXTDR1dkpjeGQwMnJ1cFRWeTUw?=
 =?utf-8?B?MWtCaFNaamdpRTBlcFVldjQ0cUdOQjRTTm1vU0J5WVoxUEo0SkhUZEdtZGNQ?=
 =?utf-8?B?OHBVcmgzVmdGbUtNSWt0MDNYOURvdUR5RmdwRU96VFFMT2UrUlBJTEVwRi9F?=
 =?utf-8?B?WDkzRmxJdGwzS2Q4Z01jQ0VmYUhaU3Z4a0VsRERMT2JhMXJjSTZaYlZjNGlI?=
 =?utf-8?B?OUlVM3BsS2pLdGJrVm9jMGltNGJqNEtDNXMxZm9wWnV1dk1Lby9iL1JodWxy?=
 =?utf-8?B?eGtwd2g3T0ZUZjdURXk2dWYweWZSZzg2K1J1cE96d2V1WVdyUHVyd2Q4Z2hm?=
 =?utf-8?B?UitiVmRyZloyQnhPY1NQcklOWXhWdUlaTldKV1ZiMzNQRllzbVhjcUlFQXR3?=
 =?utf-8?Q?3ShSVAanSIhI63tp56HERE4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e26bd1-d7b1-4070-c908-08de33458668
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:58:03.5310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jhizlu6twC2TWIq4RUfKKXWzR4RLCOsLJkFOj1XgpmNIBP5ZpZQAOaOhZ449CQURAjwUVC72PKqQBxYVVc6buReRY4qQynXMVLRHNTA5EyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8715
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
