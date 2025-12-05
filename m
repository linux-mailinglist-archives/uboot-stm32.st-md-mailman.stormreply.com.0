Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E80CA74BD
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 12:04:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C803C628D4;
	Fri,  5 Dec 2025 11:04:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A610FC01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 11:04:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5Ap7pt2609739; Fri, 5 Dec 2025 12:04:25 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4auesfatjx-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 12:04:24 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4YPOFR5w7bR5QYMbhoSsT6hgAoIDmehp6RlRzjV14TWTwLxUj7L202eFA731bpCbtDmpGrvYpaxy/pU087HtAfmvM8S7Xm7IpF2kCB7BaUsX2s/CrAg7uD0h47QRhpaOtCybh4f9AE2aW2VUqZYOCAyvlHLTGoM8aj0BRvHT4FFYhAjMi0am/3jkHmIFDhkNIXmcihc033YNy8FnuxtWJIYucfggtXiESBHTNz8jFPHJ3X6AlWa7CfhF4Q/QkaXIBx9JJ1FpfBoVzuVrERosNE7ZP9+l9TN00m2nWTn3oNhvyMoLgjWb/PXODKy6trXfkNl740uETm7Ne8dVufErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLPTjeNJ71s+tHqCd8k5btjC28BorxffYcv6lxjwt0k=;
 b=fmRUGuRLxgIU5U9SbiXLC9atvWKXhM3bLvmeNSTZnr5U277hue+3t5MhrCIdzcdeI1BqDmFP9xLJOy+Sr/NOJ7UwAkpIfR7aFEVs7dEqpEpLAtsJzfq/dM3vs4k83rLc2NlAjKEcQ81IjFCDxemPanPDYaeqcb3HaZfZlozRF+803IFKJM7JtUXzCOm0I9xOuZrCBzvC7qLoTU6JjkVAVhW0dzYjiNTWjjIXwRRtP1dhj37xNNYAQANSBexW7dP5cBzOSbrKQ6EAsnWlI1hkh5nUSnKFxCocWyY3iSOQSzCyiK1KV3XdVRR+M6nEmFR08P+lLqpR75sDWwLVcwHV+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=cherry.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLPTjeNJ71s+tHqCd8k5btjC28BorxffYcv6lxjwt0k=;
 b=QrqCwSw1CBLzYxy11LcsrMru9ayv984U3/Thtj6kXfUSJS9uqgKF4c+ORedmSfvwarrlVR85W2z/aVMOp7TthRQdZkzl7oZptETF2Kd9PyVjpOuAe6iM2glbzm9i3g7Iutcznmh/3iDr+E+QU9+h/xBdJoz8uyF+fQpSdINNXOd13SuYaYue/pbOfvXooPPXtMZsGoAseyRSKXI4MI1+PqxR5b7rtKSQB54AJu8Ty5M076zoKlx7OyHcNp7mdMWQ+VspeW4w6fNWCJXBdaHuQXHKBZGm2I5yPKRxb68D4PPEBnTAO+VV9ZL8S+uVcwfa8WM+4a77a9iILOZYcHw68Q==
Received: from AS4PR09CA0007.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::8)
 by AS8PR10MB6818.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 11:04:21 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::b4) by AS4PR09CA0007.outlook.office365.com
 (2603:10a6:20b:5e0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 11:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 11:04:20 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 12:04:58 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 12:04:19 +0100
Message-ID: <473cb144-ba23-4050-8e8b-6f732c205e2a@foss.st.com>
Date: Fri, 5 Dec 2025 12:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>, <u-boot@lists.denx.de>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-3-patrice.chotard@foss.st.com>
 <309e316f-1be0-49bb-be93-609d8b29ccaa@cherry.de>
 <8f529291-5903-4fb1-a695-dbad5287cd25@foss.st.com>
 <60aba0a2-a87f-4b5b-9163-6646244759f7@cherry.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <60aba0a2-a87f-4b5b-9163-6646244759f7@cherry.de>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|AS8PR10MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: d837ad09-952a-4dc3-3f29-08de33ee0ab0
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|30052699003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2g0UVU3YVlZNmpseDh1Q1JnMEFiV0RLTys4ZTlsNEF3VlNjRStTN20yWWhK?=
 =?utf-8?B?VzdJczl6VGJYYkxOUDFaYkhoM01FL2J2NjhtMmZqQXZrZmFtRlRFMEVhSjhs?=
 =?utf-8?B?a2tmZG9YdkI3cEZNYmpFdXFPTWczeFZpZWFKYWNwa25KMGNOWlVpMkNyYzd2?=
 =?utf-8?B?aGsrNXNYbTdJVk80UXQzMnlHUERKcGNDemdKa3ZxaVJTTnVXallsQWhUM2Va?=
 =?utf-8?B?T3dzK3lYRUgrWXk4SjArdWROMFdUZnlxbk1jVGRMUnZMT0g3T1BYbkNxd291?=
 =?utf-8?B?b2d2akMrcDRlc2dtVnYvOHNUU1hpb2lZaVB0T2IwMG9Cc3M5c2FXYmNScFFi?=
 =?utf-8?B?OWsraGMwMENwNWV1Y1FxdVZnZWNrcUg2ckJQUkhBOUMreDd4aXhmbXNmQ0ZB?=
 =?utf-8?B?WDRYQmc4WGM4ZW5Tak1kajhPdWwxTFkrTkE2cG1hc2prdmxtZGlVSmZURE5R?=
 =?utf-8?B?N2kxdTF1eWFXWHdheE5ubUgvZkc0Y1dqenpLN0s4N1Awa1VHNzB6UXBjcTlQ?=
 =?utf-8?B?VHoxc2N3S1QydFVndjdZTDVmYVd0SWxLN3ZJSFBsWDlmUHgrbk9tb2xVYWNO?=
 =?utf-8?B?STQ5RVVVdFptcnRMUGdHVG1lclY3b0N2aGVjTnZZWHk4YnBRdnlxMXZvY21p?=
 =?utf-8?B?M3hhRFlsMjh6YmhucXVGRnJsYWh6L1Rkd1QyQWpxandscHQvMDlZMXZxT2VQ?=
 =?utf-8?B?c3Q3dnFDK081KzNwYUhCMXNRa2NoTVR3ejBXN2VybkhsZjA0MFZMcStYNmJJ?=
 =?utf-8?B?TTU3VzY4a0lKZEpvZ1MwWEpra0JhSDhZbkprVjczWE1Ga1YzQktOSXVxTzF2?=
 =?utf-8?B?c0RhaDVLVTAwcng1ZElNK2g5NjYyRjByV081eDRseGZCdHR3SFg3QkNPTHdj?=
 =?utf-8?B?SDBrYk4rcjhIQkpOdW1qakFNKzZ5TUFTMHZ1ZG5CeFlFaS9Ea2NLSU5uaktJ?=
 =?utf-8?B?QS9URFV3c3dKTWlzL2huVDhCN1FJckNNbnQxR0FrVTlXQ3NqV2Vjd3plODdN?=
 =?utf-8?B?YUFPcklJWFZhMTFQSzdPOVk1OTdQWTBOemhTZmMxOVlLVVl2czRpc0x3TSsy?=
 =?utf-8?B?K2dOTi9tenN2SDhaZGpoeFlJaWVjNXRBeVZmbWVvMHlNcjU2QktNQm5qMS9u?=
 =?utf-8?B?MlBGYjlVc05adFNPNEUvU3JpYlB4OVlab3pMdm9IUzJZOGY0WFpoZmVRWnRp?=
 =?utf-8?B?eVJLY0lQdUlLVHRnQ0FJU0EyWEJRQVgrRUVIV1N6ZHU2WllSQlN3VjlncnE3?=
 =?utf-8?B?aWpZOGJNUTJrSHJwOHZkMmVaUFp4ekxvOUVmVjhlVnFYY2h0MUpQeUJvT3hB?=
 =?utf-8?B?VHRhVURoeVhvNGdlUC9aZkNGSlhySERaNDlNYmRBNTRLK1pDNnZhbW1zSDZk?=
 =?utf-8?B?NGFHMTFEMkI3TWd3N3J5SDRNTDAxTDlORjNWblZjQjhTN1R0MktCZW1zclFD?=
 =?utf-8?B?bkd1Z2s0Qy9FeVlZV1BTNzhtUU0wVmxmSlRxS2l6QU5MN2wzcHArUmF1YWpp?=
 =?utf-8?B?Rk91Nllna2l2RWd3QmVNRFRQcTViNFRPbTNDbW9iNk9qajlWRGtxNWU2WEMy?=
 =?utf-8?B?QXkzZ0pnWVdEVnFzOFJ2cXVhSDJlaUxxVXRLUHlKNVh6a2pKODN2VnMyYitW?=
 =?utf-8?B?Z2NKay9LOExNOEhQK0IrMWpLajlsVkU1UnRMbVFBYmJubjMxL1VRazEzV3Fv?=
 =?utf-8?B?T1ZMTUhBYU83U1VNd3crWGtLenAxMkl1RTdudkdZamk2eHIwazBzdDY4QU5C?=
 =?utf-8?B?QXFJK1dwZDB5eXV0clNmV003TTY2MWJvSncxKy9lUXBtekVhS0N0TGpZVTNt?=
 =?utf-8?B?NGNPSlZFTEE3ck43VEJyU01oSFBRdE9hSHo1TnVnaWxqK3pZZDBHVFdFcDVa?=
 =?utf-8?B?VVJjYjRQZHo2b3dCeHhiUDAvekJiRktOSDdWRDNYWnVEQm9rRWlhZnNGQ0o5?=
 =?utf-8?B?UmpydHB0NTlNdHc3ZzlFaC9ETFY4VHJBSjNCMTRpNmE0dVdoRm5uMkFvbnBh?=
 =?utf-8?B?ak1CdXhJUmxlSTlHQ2FiVDZlOEZyUnpvSHFJWmxuK3IvRXBFRnNSc3dKTm1n?=
 =?utf-8?B?TVdVeXhtNWtueEJDZ3ZYaVNBL1pYMnZWL0RJaGROWmVIZ1JwRFZSYjlRb3Ey?=
 =?utf-8?Q?z1DPooOK1MFW3aFrDneYgVWLY?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(30052699003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:04:20.6848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d837ad09-952a-4dc3-3f29-08de33ee0ab0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6818
X-Authority-Analysis: v=2.4 cv=U+GfzOru c=1 sm=1 tr=0 ts=6932bc39 cx=c_pps
 a=pOr88aQqtRPe188Gsff7+w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Uo5EeBN78AAA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=d-16c7JpMqW55nX3WZUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: d2pQjnXHjDn1TuV06RmhDznPN7XKhgON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4MSBTYWx0ZWRfX7B4ucERbrSus
 i1CuaUvVzUXHY2vvXU4pE3QZUKeHEAuxRgf+anbSxUsYBeMu5GfxpRycQiWMLXTwvmWI1HFD5Oo
 zHQBOOGLeMXRlksIgCAUABD6CinC6udvwmb0u/hlzNVvB52B3oiMddLyH6eIg2vmLAuvqsWXtCt
 jakpzsStzvnWT7v74DaRw9gAsoFYQgGK4vDi77riQSW+jaDm2MVumRpR1Eg9GHBy3UkjV7u+rUI
 AxOUANStfJBPlz3TdR52gbxh2Hau5nJo8TfJQd1Rxl5Tdy+Xh8G5jm9iSJpmX/sP++XupxByWLE
 Nw7lezCa4raEWzsK8VsKQq/aCCLVEueMnZX6+6c1ZaXEdg2ha4pVCDc8hDrXOFFSS1lHUOMo3Y5
 bVdKFcP2/IV1CwhanLSC97Ky7bCjEw==
X-Proofpoint-ORIG-GUID: d2pQjnXHjDn1TuV06RmhDznPN7XKhgON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050081
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 12/5/25 11:43, Quentin Schulz wrote:
> Hi Patrice,
> 
> On 12/5/25 10:24 AM, Patrice CHOTARD wrote:
>>
>>
>> On 12/4/25 16:38, Quentin Schulz wrote:
>>> Hi Patrice,
>>>
>>> On 11/14/25 5:23 PM, Patrice Chotard wrote:
>>>> Remove get_led() and setup_led() which became obsolete since
>>>> led_boot_on() introduction. led_boot_on() is automatically called
>>>> from board_r.c
>>>>
>>>
>>> Yes, but called later than board_init(). If this compromise is fine then it's ok.
>>>
>>>> Regarding "u-boot,error-led" property can't be used anymore since commit
>>>> Since commit 516a13e8db32 ("led: update LED boot/activity to new property implementation")
>>>>
>>>> Instead get the LED labeled "red:status".
>>>
>>> Would this work with stm32mp157a-dhcor-avenger96 (led4), stm32mp157c-odyssey (red but not "status" as function?) and stm32mp15xx-dhcom (error but possibly broken since commit 332facce6f5669fc1bb8d150c08cee2ebdae6d2b which removed the led with that label)? Seems like Odissey has LED=y and LED_GPIO=y so it probably worked before this patch? The other two, their defconfigs don't seem to enable LED support (new or legacy) so I guess it never was used anyway?
>>
>> Hi Quentin
>>
>> Regarding stm32mp157a-dhcor-avenger96, stm32mp157c-odyssey, stm32mp15xx-dhcom, these boards are not
>> STMicroelectronics board, so i don't maintain them.
>>
> 
> Seems like Marek is handling the DHCOR/DHCOM stuff, and he's in Cc so I guess there's a chance he sees this and do something about it.
> 
> As for Odyssey, you are listed as maintainer but maybe we could add the people who contributed to it?
> I see Marcin Sloniewski, Grzegorz Szymaszek and Heesub Shin for the DT. According to 69df7ff4b844fb22d02a941d57d8e6c2d6b679dc, you probably contacted them and had no feedback. But maybe add in the commit log that this is going to break them and hint at how to fix it maybe? For the error LED, I guess simply removing the error label and adding the status function should be enough? That would change the way to interact with the LED though (when using the label for example).


I have already try to contact these people you mentioned when i converted STMicroelectronics 
boards to CONFIG_UPSTREAM flags but unfortunately none of them replied.

> 
>>>
>>> I'm also wondering how you get this string... I don't see any label or LED_FUNCTION_STATUS function for the LED devices on ST boards. I'm probably missing on something?
>>
>> As indicated in the cover-letter, the LED "red:status" has been added in kernel device tree by this serie:
>>
>> [4] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1023034
>>
>> U-Boot will inherit of these properties when the above kernel serie will be merged and U-Boot device tree
>> synchronization will be performed.
>>
> 
> So are we supposed to wait on those patches being sync'ed with U-Boot in order to merge this series? Because if I understood correctly, this will break LED support that currently should be working.


I will not wait the DT sync to merge this series, i was just waiting for review from my 
colleague Patrick Delaunay or from other people present on the mailing list.

As you have reviewed this serie, i will submit a pull request for U-Boot next.

> 
> I personally don't care what you're doing with the STM boards, but I depend on this series to be merged to continue the work on removing legacy LED support (which I also don't care too much about but now that there are patches for it, let's finish this :) ). So if 1 or 2 releases of broken LED support until the Linux kernel DT is sync'ed in U-Boot is fine with you, that's fine with me as well. We could also edit -u-boot.dtsi DTS manually until the sync and have the best of both worlds.

Thanks
Patrice

> 
> Cheers,
> Quentin

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
