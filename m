Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3DCA6FA8
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 10:46:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BCC9C628D4;
	Fri,  5 Dec 2025 09:46:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20D90C2909A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 09:46:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B59c4Qv2067911; Fri, 5 Dec 2025 10:45:58 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4aubndkbdm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 10:45:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH4hb4ItPRTn52VW1nH/csbMJvWVbMF5NdX71sDX0Z7/1XQK1u3stvy45qUnKwjr1HDApGO7pW9iBtxTUfrkyQoMiiCW2XKmDQ+lQeHbmHvDYc9GOrg4PFptdFEsEJK7sz1xSSg+7bO3J90rnVkop9r3+3Pa/Y/dvuv4JVk9Jibbcl2NIRhEwOAF8n9/ipyMawsSQXvuz8DxXuIG7ahstP8Gc4AKQ69p987cLKp7sT1gCArp6JqyO/zzXGaMbi7elMK14/nJCB9jCkzMbrg8FgSTFuoQ/HCiq9bBvXEvCtnA5fdOJbmnWOFicshWbRcAffHNRxt/zzkPhk6fenhKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5paLzm8XaKzZicmI6sgQUB8EPt3kNDbhTWCvRubyxVA=;
 b=P6iB1iLyD6CQX9YduEWrGk1aqNmsAA3I6xsH/c9VbZpnJRaC0UWwtT9oqe+hOpE3NFonMFNFdB/MCGmGwiWjs2siSY5P2xDjvplhBrbd98NW9jH289pMqnIa6DTP5n6C4l34uakaM2+NdChCspPalNV/NijcGpdChFC4KMBNMgNFewF8bLa5w6vKVCpsDt9RDkYc2AJmLaTNzOenHUpqTfvgRctoJplw0wQ79NM8Zj3tE6fou6eNhiB4HsPSO4fTirqGmafl77jA0ufE8bqncUzRRX+1grg9ciaOrjnnCBtTk7u9NYV8vIZ0Cy1rC8HMtCq/2KFbnkMyM1V1jMtslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=cherry.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5paLzm8XaKzZicmI6sgQUB8EPt3kNDbhTWCvRubyxVA=;
 b=b4nZeXRVAesWpLHeTZ9n/4cGAZan9xjqrUSk0SuzP+7ws8YbspRHPgzTYJCILQgontijbeFhkAE3m/gF984ycAmb9ku9AB+6c+JPSzLwJtFcIbupMaTwm/g0qMtK99xBaghqqkUB1HfOiz2BVRIAjk5jPMxT6Jj24fFFIejqJFmgXNWWkSH3pSfAdCc8T12ujXtqs55HqGKRsPCARlZi3t0Sl5Y/M0JF2IQ3k3+4/YBNEHRvDjfcNhprXQ5Q8FCrm8PIqqmMWG09nxSu3fSc2ma1essCEWWxQXJl4zmZHGhFiGmB4sT0tLX6ySbHZBhBULs7mRiEtTCJXORI0unFog==
Received: from DUZP191CA0062.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::25)
 by VE1PR10MB3886.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 09:45:55 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::e4) by DUZP191CA0062.outlook.office365.com
 (2603:10a6:10:4fa::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 09:45:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 09:45:54 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 10:46:31 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 10:45:53 +0100
Message-ID: <9fd0a6aa-8201-4202-a1cd-ec27bc24c59b@foss.st.com>
Date: Fri, 5 Dec 2025 10:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>, <u-boot@lists.denx.de>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-18-patrice.chotard@foss.st.com>
 <07a85afa-dccf-48e2-86ac-5fa91477806e@cherry.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <07a85afa-dccf-48e2-86ac-5fa91477806e@cherry.de>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|VE1PR10MB3886:EE_
X-MS-Office365-Filtering-Correlation-Id: efc6b040-fce7-407b-855e-08de33e3157e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d25saVViVTNnYTA1a0M4S2Zhc3RTR2FsVWhtTThnV3NxR2NyVW9PcEFsajFr?=
 =?utf-8?B?d04rZ0NHZExiUUNoeUU0emUxSVdpOVgwaUY5VWY1SmZ1bXlHNGkyWkJwdE5q?=
 =?utf-8?B?Z3BkaVdSN1NPRHB6cVRBWkhDTFRuQVZJSkxnR2NrVmt1bVg4OWNJTTk0RzZ1?=
 =?utf-8?B?eTZ3QWI5NXVPYkY3cy82SHVVR0ZjbzB6M3QzU1E3dTdac0R1NlEzbUpwQXRy?=
 =?utf-8?B?eS9lS1ZySzZKR0lXM1FSc3dwdGlDV1ZiUnhEc1NidUtGTTVxUlREWm82L2hU?=
 =?utf-8?B?b1FybndWS0owS3VhTVJ6OStMYkRaZEtodkw3a3VzWDVvSW1KOVB6SXZnN1Qz?=
 =?utf-8?B?VWIxd2RjMlFwM1RhUDNMQlZRQVl6Q3pTdk5DU0JaMXJydmZ3SFYxcXBCdVlP?=
 =?utf-8?B?aEhGOGtBZXl2czRxRllPT2sxZG9haG02OWs0NjBKZkJYNENYRmFhWTJIMU5p?=
 =?utf-8?B?OE00cXZRZUpwVTlHZTJ0WS8rcXR4T1Z2b2hFQmdGaHF5VDYzb3NPN1A2eUxx?=
 =?utf-8?B?ZTlTTnQwMTlJb0dMS0dHamZoNUJuVHBFTUxHWTB2RUNGZk5pcHM3Uzc2UEdR?=
 =?utf-8?B?NmQ3b2NiSWxDSVp1RDBTbmFLK1pUZkNtRkhwaEN3bnhjbzM2K3l3ZGEwd3ND?=
 =?utf-8?B?azVYdVJKM2w1UTRFUDRzbTJOQ0xXeDc2WDFsTlRiVmxkeWVvMS9mVHZTSDVJ?=
 =?utf-8?B?bW1pSDNSRmtscVBURFZOZi9ORFdXMStwTEJsRVZXTWMvSnBCNkdLMzQyZ3Bi?=
 =?utf-8?B?amRIblFqamxuc2hNL0pwRnpldU1ZejZEaTBjTExwR0pWRnl1ajl0ZUZ5WmdR?=
 =?utf-8?B?RVRvY2c2ZGthUjNVckl4dXBKVWdXNUozblNoZEl6OG82UXZ6Nm5kbW9LRCtk?=
 =?utf-8?B?dVZrWXlPQS9DYTlFcHVUSDdqVzZNU1hDNUJYbzBMNDFNV0VBaGRNUjVTd2Jo?=
 =?utf-8?B?bFVkR1l3cXhwZm40djNhbUV2eGt5bmQ1cXhrVHRkRHgwU3g3eEc2VHlxUnor?=
 =?utf-8?B?REJtcGswTVdxRDJWOGR2aUJtcDBKYUdXMllPWEZ5WnJHbjkrYjRuMVlEeVcw?=
 =?utf-8?B?NmFqRzlONnFTOXZOOFp3QXlvRGlMbzRlMFVIVTJmU3lZM2p5amd5STFQVmsz?=
 =?utf-8?B?a0hodHNPQzd6U29mMjJxSEh5VUFUSmQ5WFptM1RST2YwZm1TZi9QQk5jT0tx?=
 =?utf-8?B?d3NNbkVmcUw3TldnR3BJOWtwNkJLMUhraGJxV3djSWdhREtaNk55RVpyUFBJ?=
 =?utf-8?B?MmZ4cmdVYW5JVkRGQXRwT1BPRlYxYm5PclNsUXBSRkFrd1VlR0lqYzc3c01N?=
 =?utf-8?B?VmNjQmQrcmlxczY2OTJhTUx5VW1WK2ZNS1AxV0xLQmpiTmEyYWorK2lFaXFv?=
 =?utf-8?B?VHI4UjBQb0dPZDhoSTR1MlhRdTZna3NIemFjRVlKaktkbXh0bFcvYnFrZ1lp?=
 =?utf-8?B?NFpicGE3ajE0cHZjUmFBR0xlMWhTWDBDb3ZZaGtTK3VBUVZPUE1SMzB3cXJB?=
 =?utf-8?B?UVZYVFlWOHNJUXNtYmxuSzZTbGlBY0tLOTNqTnp5QVBpaDVRVlRvK05hQWJJ?=
 =?utf-8?B?STIyNHVONE9KUTAwVjlvQ3hGRlpNMHBJRzM2dDJ0S1Qza3pheUxiMEJtaTZi?=
 =?utf-8?B?ZDhTY3UxM2VMMlZCVnZJUXA4UkxmQUlaQ1dZK2hGeXRFYWp6d29uektTQVli?=
 =?utf-8?B?VzVSZzFYdU5wUU92cE9QWjBxdS9CY2V2UEtjcXFyKzVaZXpMbU1OQkdBWE0v?=
 =?utf-8?B?THZzNXlMdkFpZXdkTTVDMGMrd2orY2xPRlRnUWl4UTRLdkpyVTlHWENRT2x0?=
 =?utf-8?B?UDlLZDJPNjVsazVzS0ZEYlpYS0NwL1QweFZDSUpoSVJtaEcxNGY4eWpNVTZI?=
 =?utf-8?B?Y05ySDJJS1AvSThOR2REK25tamYyT2tsUlpnNFJWdTZMZU50WVRFR3VrNld3?=
 =?utf-8?B?WnpPVjQ2cWJXd0crT2tmNjZwajBpNVl3Ryt3Wk1EOHIrVGhHaDYwN0IzTlE4?=
 =?utf-8?B?RGVPMjk2d05qYXJlR21hbG9CSVJ3aUhLMVJIbC8zTis2WmlTQ0J1SUlGM0pl?=
 =?utf-8?B?cDNFSFVEN0Z6VzA4OHFyVDJ3RytkWDgrTWxsQnVBWVdIWTArRlQzNW8xMkpG?=
 =?utf-8?Q?AzTU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:45:54.3218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efc6b040-fce7-407b-855e-08de33e3157e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3886
X-Proofpoint-GUID: N9UeicjHdLoVaWF_6GIvmz-KuDIQcPvD
X-Proofpoint-ORIG-GUID: N9UeicjHdLoVaWF_6GIvmz-KuDIQcPvD
X-Authority-Analysis: v=2.4 cv=FtUIPmrq c=1 sm=1 tr=0 ts=6932a9d6 cx=c_pps
 a=fL1+D+coQxbnz696CNuinw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Uo5EeBN78AAA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=K0kzNf4V6fZ22Zka2D8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MCBTYWx0ZWRfX584el/jspYYD
 6kEXnb91TIB10vgmx5i5/Al3cpddwpf4bDoyivNfRw+drEjqYtlg8v+llQI451461vIqhMOJntQ
 PJwVEGopVjzeEoLSUhV4L+RfbihIMpUFd3BVN+WWhOYdcnezjUCp+0WMskSpxKhTv3XbgvCXEpv
 oQTrfnZFTFdhus0Rv9s46V81dUKc9aF3JG5ruuEQCpL4vyREYHedoHbeNa5I/eE06J1FNjr7tgr
 V0gyIiDmasR+2d6JLVvDGGKFqv6HwNoQB6c5XVc2mPiEa8D9G0wON06XXDWwblY8WqRQ/Q+XsCV
 VzWrJjjYNxGjOQ98rqJ6QuJtt+N3QfqESylcT+CGmRsEHtmXnKZ+7BMdMpoYtyD6RbSLL0hiCmf
 yX63/MFORHq1Ac9E38IeVGk94g/beA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050070
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 17/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp135f-dk-u-boot
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



On 12/4/25 17:25, Quentin Schulz wrote:
> Hi Patrice,
> 
> On 11/14/25 5:23 PM, Patrice Chotard wrote:
>> Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
>> from stm32mp135f-dk-u-boot.dtsi.
>>
>> Remove also led-red node which is now part of kernel DT.
>> See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
>>
> 
> You may want to wait for the DT to be sync'ed with Linux's for this patch so that the red LED can still be used with the led command?
> 

I will not wait for the DT to be synchronized, as the red led is no more functional since a while it's not a big deal.

Thanks
Patrice

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
