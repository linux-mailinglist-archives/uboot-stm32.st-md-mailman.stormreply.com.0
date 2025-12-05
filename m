Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD4CA7A77
	for <lists+uboot-stm32@lfdr.de>; Fri, 05 Dec 2025 13:55:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1D74C628D9;
	Fri,  5 Dec 2025 12:55:01 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08C62C628D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 12:55:00 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5CQUGY2544273; Fri, 5 Dec 2025 13:54:49 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4autdg1gxd-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 05 Dec 2025 13:54:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTi1M5ETxAwy+P4QX3GAzcs+Vpi2+n0zZM9kQ3IKC6E2d+JStrEWjg1X7GMiBqShOTgP2KCJbU40bp3oVFqf8hhnVZ7AJNTpxd7WNWtMcmZaZIxpviYlCk4IHLZoYgIaHOA2IBQt1WqufN5IQaZhmm0aiTcbslUcZn+otYmfztGUCkA2uFE3JIrsqBDYmU1ydvwfwkU/SP/HftHtHZyGQhii71lJ/9SOd2taGSo5TC98OIeQawt4BBzqc5/zzlX3/P86wtF+nd1eEKQoTHZ0QK+Y+hcjTav3lmzYGyBZTO2uNQTiv4CYnzv64cr9V2xo2tHbw1+aaHnFAT841PiC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYWpfZ/sGH/rIlISqB2fIlui8r4ViDota0ZIla64nms=;
 b=xIZRv8fyB9I5YYNLYdqnO1+bRv6lveZJbGQpkV2q2A+lw1V+q02u3WZkNNjzwTckGPI7aKF1ce3fNChMpxLjNhCb5+yv14jBVhwU+I+Y0OrSNeyerNgjbsd6WU2nzPXO3RqM/xKjCKaY3TfzqMM6kZ44G6MjHXZSh11mVLCWDvNuCrMa/r42pYD4NFQRuQv+JjlfSJbH3ZAvuFurPbTffoQDv07SGWRRc2EGXrNkHb/swRw4/6cdkna5U0xx0wHl8iWq87UuoJ+LjTeKEw+tliymGDH6E0lbg1akI8SjdxVqWHYwNKbnUs4X1Q7r9L0ngHFmZvSEgee5fhBy3pvk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYWpfZ/sGH/rIlISqB2fIlui8r4ViDota0ZIla64nms=;
 b=CnANy+BDiBYGj3hwRIas/kAHWToIgbCv5+lRVNTvTKW/VF7LZVhjy2pAPGNJUs6mYiUR4c4FNCe7B3gp5CuibMusLmSzmNxgvXOCWTXcSZXWTEraU4FcImkzvu3OC5zXznvjXZL+6k8SY78SCw8gYbYCXESaT1xKYwqJbFACjdBB4nkwSao2cAYKo2ZsQvzCGuFx948G/rt3p9K0y/XpU13JH0rEvgr1HEu/SDcaKpAQe9IdFooVKmhSNLGMGPkUpXSvJ0SSyo+HrNPNP2Qd8PwfPLwAZ5N+zPttU02Lr0rmsbAy0T99xAZBaHbxNFKFECjH1qMzRMCn40MOjfzp5A==
Received: from DU7P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::26)
 by AS2PR10MB6519.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 12:54:44 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::3a) by DU7P195CA0007.outlook.office365.com
 (2603:10a6:10:54d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 12:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 12:54:44 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:55:21 +0100
Received: from [10.252.31.202] (10.252.31.202) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 13:54:40 +0100
Message-ID: <41597f9a-767f-43ca-8153-f31acedcff56@foss.st.com>
Date: Fri, 5 Dec 2025 13:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251118231953.578007-1-marek.vasut@mailbox.org>
 <7d765b01-f905-4139-a72d-059f748eba87@foss.st.com>
Content-Language: en-US
In-Reply-To: <7d765b01-f905-4139-a72d-059f748eba87@foss.st.com>
X-Originating-IP: [10.252.31.202]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|AS2PR10MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa4ac84-0adf-44f0-da77-08de33fd76bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1ZMc3JFR2d5TGxiWm84QUVDd1p2R1U4bU1SMllIVVBOWmh1VUFwTEFoNGVY?=
 =?utf-8?B?RjNuaGVabHRLbzhWRURCWFVVVWFGWnNvYzl6aU1tZUxmNC9KVEE2Z3VoVWo3?=
 =?utf-8?B?cWFNZVgwQzhZTXF3UFlpeGc5SFhhd1dPS29vV1Y5Y3VRU3hqTlUwTEdqRHY1?=
 =?utf-8?B?Wm5Ick9IVXpaSDNvd1diRG03L3Uzczh6bW1ZS0c3T0dZbVZvb2FjWVV6Ynpl?=
 =?utf-8?B?dlBSdTVWT2xZamFhN3FueWlCUDFCODZ1dWVJYTBMZlgwK3c5SCsrMDFOUHZE?=
 =?utf-8?B?L08yVmJFMXV2UzhGeGRMaVdVK3htb0tTRmQweVh3RzUvZUxzT3RGUzlmdm9X?=
 =?utf-8?B?NUMreDRoVy8vbEliS0ttQmR0SkVLRmlJRDlwR3hIdlZDN1dDb09LVlpFdGxM?=
 =?utf-8?B?Z1RNalZLM2xBMnBWN2w0VzdVU1ZuR05WZnh1aStLRWRkRUdINUtMN25hcDdX?=
 =?utf-8?B?UGZucENUZkNYZ3RYSnE1allvdy8yaUtPNDgwUis2aktDRFowQXpSYnhkd2gz?=
 =?utf-8?B?OGZ3d2U4UktYaXp3SDBqYzJKOTcyaGE0a0R5anAzdDlrbWRyRDBWeUdQRHZB?=
 =?utf-8?B?cmRVVGFyVitXOE1DSHJ2ZTk0bTZJYy9JaXhySEhRT3lMTk1jUnh1QnRGbHJX?=
 =?utf-8?B?T1NGWWtHdG9UNVg4MklHK0VhZDU1QkVNWW82VUU5NVdaMHRLOWNLYWRRb0k2?=
 =?utf-8?B?a3lMQTJVN0xDWTZLempzbTN2dXdEbHAyTzk4eTlOSFVZT05zeXZDaGRsdXBJ?=
 =?utf-8?B?YXZjQ0h4L1dTY0k3NTN3bXBBaFQ0UVd4bHpGQ0xIRnJNT3VVSDBneG0zb1Ny?=
 =?utf-8?B?RjlEZ3RYb0NBbnlqNzByZThjNW5YMHIzYm5CMXpSMy9LTndyNmxKNnpzcmND?=
 =?utf-8?B?UEhVczZSSS9iS1Y3akg3cGpvV2pWbE1Ubzhmanp6ckxiM0VOTGNnV2dpWTV1?=
 =?utf-8?B?WUpNZnF5bXhvTWhNcWp0Y28xL2kxZC9HU05jVFNGZ3hpRmJUWTY1VldkVVM1?=
 =?utf-8?B?citidXczeTZ1c2RNN2FCZ3VHTlFmSFVZekRSYVd2QUlNR3hNZWZWelZMZUhH?=
 =?utf-8?B?VDkxQytuVXNBbE5SWmwzekliQUhsYUJjZllySmFFNlRvMUZLMEI0MUM4YW5a?=
 =?utf-8?B?ZHBKOVdWdnB5NE9ncVkxVUpETnlnZGY2TWdobUNGRmpuaHdQaTdqc0VXMkpa?=
 =?utf-8?B?MU1CNWNPcUJKclEzRHJYQjlsWTRuT2VHd0xhWjZEVnJFcHY2Z1VRa2tCTUhM?=
 =?utf-8?B?OVJZOGFFWWdXTDg3akdXdkh5SCtsMkJFV3VVOHVuT2lLQ1E2ZXZUWG41TzhV?=
 =?utf-8?B?eXkwNlMrK3BwR1JhcFdCS3RONnJYZEd1eTZCQ3F2UEdiYzZlMjlETmpFakpM?=
 =?utf-8?B?d3JlTlgzWGtkN0MxdjMrWi9Cb28zeXBWR2JLWGkyT3VQamNyeEdNbTYzeEg3?=
 =?utf-8?B?Y0lBWElhRHg1LzNDdHQ5QlNGNlFydnN5Tkp6R3JRMG5oQmgreE9Lcnp6bXov?=
 =?utf-8?B?WC9mdXMvQ1o1T2I4eitseGNtcHFvVzBqeVROM2Nhdyt2NUlOQ2hNZDdQNi81?=
 =?utf-8?B?VHhVZWExWkJwTVFkT3VCSzNsbEpGK1ZyNlVGWFVmRTd0Z3VQVEtaZGt6QzQz?=
 =?utf-8?B?azJobmZHMTZoY1VHcGN2ZmZ5K3ZZU3dUeHZSNEk1ZEhaOW10QkdNcVg2Q3cz?=
 =?utf-8?B?MW90aTFpTzJBdVhZZ3hrTCtYaWxTQnZsZUNweFpHbnQ0K2UyaUZFYW0zRVMy?=
 =?utf-8?B?SjBFNUUyaVc1VmVkcFk3L0g1QmI5eGZPZVA1M3ZNcHluWkVtVmk5WWdqSW84?=
 =?utf-8?B?bi9wZng4L2pLMlRqNmVIVmoranJicHp3dnFRTVdpS25qS2Y2QzBBTUM1OE1w?=
 =?utf-8?B?cU1jZHpZanJaVENTaTV1YnRaYlhMTWNqUGtFMUNKRUFwdWtPcXpBK1Q0NVdS?=
 =?utf-8?B?eTBlKzl5dFJKNFdiUFhOY245UnBJdzk4dUpScEhhUlg4eTQwYlJlQXNZQXhY?=
 =?utf-8?B?bTFVNXl4bGlMTTVqWnlxaG03VXZzOFhaamkxMVVvZWRwaUxrV3JaODA5VXZW?=
 =?utf-8?B?L0dmUTl0WVhJZGxncWJ0UDhieWVMZ0lNNjh2V3JJMk5RRmlrY1FZVUp3NXZC?=
 =?utf-8?Q?aRY8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:54:44.3873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa4ac84-0adf-44f0-da77-08de33fd76bc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6519
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5MiBTYWx0ZWRfXyZuxgzJJMcoR
 eu4dWolr3qyr2Ud9KPfv1JQucfuPnizh94TatLspXLtpYjyB3qJdLdrHsRx/Yp+xojHJxjtNMwl
 mP4hrNxsiHX20VDnxi+dX0YX/vCw59Q1dKFoJ/fdKXqNc6Xm1PMPJ77S0FV7KuK2oGOBs6hU3r7
 5BLRVeCYUhncoYbDxVrk+xFqTFregkhrSnvn7IEYC5+xwAsB0xO4xoVCpUpNxwyEwRIwxV0RA1v
 rWD20Kndtg7St26XKDbIlWjhIlmP2SOO0B2PnB58BGsrClnLw6Rkd7jsiEmXNwdD9AxnISdp6PV
 CVNtDbCXstXsV+Rapu5dVMek5fXaEQ+fD2o7AJFTHDEqFFH//0YLODQs/wLdQ6KI7thsQF2keOF
 xsmIz1KarsMq1OdKRpayIKymRig0ew==
X-Proofpoint-GUID: b2kHIwm10-J9iWJDFJUDLlaz93q5Yklz
X-Proofpoint-ORIG-GUID: b2kHIwm10-J9iWJDFJUDLlaz93q5Yklz
X-Authority-Analysis: v=2.4 cv=YrEChoYX c=1 sm=1 tr=0 ts=6932d619 cx=c_pps
 a=/riwZtEhZw8wleqld+6sWQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Uo5EeBN78AAA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=gk4VONcb6n9A5HcdGCgA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050092
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add 1 GiB DRAM settings
 for DH STM32MP13xx DHCOR SoM
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



On 12/3/25 15:19, Patrice CHOTARD wrote:
> 
> 
> On 11/19/25 00:19, Marek Vasut wrote:
>> Add DRAM settings for 1 GiB variant of DH STM32MP13xx DHCOR SoM
>> and support for SoM DRAM coding HW straps decoding and automatic
>> DRAM configuration selection. Enable CONFIG_BOARD_EARLY_INIT_F on
>> all STM32MP1 DHSOM, as it is required for the HW straps decoding.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  .../stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi | 100 ++++++++++++++++++
>>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi    |   1 +
>>  board/dhelectronics/dh_stm32mp1/board.c       |  30 ++++--
>>  configs/stm32mp15_dhsom.config                |   1 -
>>  configs/stm32mp_dhsom.config                  |   1 +
>>  5 files changed, 123 insertions(+), 10 deletions(-)
>>  create mode 100644 arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi
>>
>> diff --git a/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi
>> new file mode 100644
>> index 00000000000..1d268d58b54
>> --- /dev/null
>> +++ b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
>> +/*
>> + * Copyright (C) 2025, DH electronics - All Rights Reserved
>> + *
>> + * STM32MP13xx DHSOM configuration
>> + * 1x DDR3L 8Gb, 16-bit, 533MHz, Single Die Package in flyby topology.
>> + * Reference used W638GU6QB11I from Winbond
>> + *
>> + * DDR type / Platform	DDR3/3L
>> + * freq		533MHz
>> + * width	16
>> + * datasheet	0  = W638GU6QB11I / DDR3-1866
>> + * DDR density	4
>> + * timing mode	optimized
>> + * address mapping : RBC
>> + * Tc > + 85C : J
>> + */
>> +#define DDR_MEM_COMPATIBLE ddr3l-dhsom-1066-888-bin-g-1x4gb-533mhz
>> +#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000kHz"
>> +#define DDR_MEM_SPEED	533000
>> +#define DDR_MEM_SIZE	0x40000000
>> +
>> +#define DDR_MSTR 0x00040401
>> +#define DDR_MRCTRL0 0x00000010
>> +#define DDR_MRCTRL1 0x00000000
>> +#define DDR_DERATEEN 0x00000000
>> +#define DDR_DERATEINT 0x00800000
>> +#define DDR_PWRCTL 0x00000000
>> +#define DDR_PWRTMG 0x00400010
>> +#define DDR_HWLPCTL 0x00000000
>> +#define DDR_RFSHCTL0 0x00210000
>> +#define DDR_RFSHCTL3 0x00000000
>> +#define DDR_RFSHTMG 0x0081008B
>> +#define DDR_CRCPARCTL0 0x00000000
>> +#define DDR_DRAMTMG0 0x121B2414
>> +#define DDR_DRAMTMG1 0x000A041B
>> +#define DDR_DRAMTMG2 0x0607080F
>> +#define DDR_DRAMTMG3 0x0050400C
>> +#define DDR_DRAMTMG4 0x07040607
>> +#define DDR_DRAMTMG5 0x06060403
>> +#define DDR_DRAMTMG6 0x02020002
>> +#define DDR_DRAMTMG7 0x00000202
>> +#define DDR_DRAMTMG8 0x00001005
>> +#define DDR_DRAMTMG14 0x000000A0
>> +#define DDR_ZQCTL0 0xC2000040
>> +#define DDR_DFITMG0 0x02050105
>> +#define DDR_DFITMG1 0x00000202
>> +#define DDR_DFILPCFG0 0x07000000
>> +#define DDR_DFIUPD0 0xC0400003
>> +#define DDR_DFIUPD1 0x00000000
>> +#define DDR_DFIUPD2 0x00000000
>> +#define DDR_DFIPHYMSTR 0x00000000
>> +#define DDR_ADDRMAP1 0x00080808
>> +#define DDR_ADDRMAP2 0x00000000
>> +#define DDR_ADDRMAP3 0x00000000
>> +#define DDR_ADDRMAP4 0x00001F1F
>> +#define DDR_ADDRMAP5 0x07070707
>> +#define DDR_ADDRMAP6 0x07070707
>> +#define DDR_ADDRMAP9 0x00000000
>> +#define DDR_ADDRMAP10 0x00000000
>> +#define DDR_ADDRMAP11 0x00000000
>> +#define DDR_ODTCFG 0x06000600
>> +#define DDR_ODTMAP 0x00000001
>> +#define DDR_SCHED 0x00000F01
>> +#define DDR_SCHED1 0x00000000
>> +#define DDR_PERFHPR1 0x00000001
>> +#define DDR_PERFLPR1 0x04000200
>> +#define DDR_PERFWR1 0x08000400
>> +#define DDR_DBG0 0x00000000
>> +#define DDR_DBG1 0x00000000
>> +#define DDR_DBGCMD 0x00000000
>> +#define DDR_POISONCFG 0x00000000
>> +#define DDR_PCCFG 0x00000010
>> +#define DDR_PCFGR_0 0x00000000
>> +#define DDR_PCFGW_0 0x00000000
>> +#define DDR_PCFGQOS0_0 0x00100009
>> +#define DDR_PCFGQOS1_0 0x00000020
>> +#define DDR_PCFGWQOS0_0 0x01100B03
>> +#define DDR_PCFGWQOS1_0 0x01000200
>> +#define DDR_PGCR 0x01442E02
>> +#define DDR_PTR0 0x0022AA5B
>> +#define DDR_PTR1 0x04841104
>> +#define DDR_PTR2 0x042DA068
>> +#define DDR_ACIOCR 0x10400812
>> +#define DDR_DXCCR 0x00000C40
>> +#define DDR_DSGCR 0xF200011F
>> +#define DDR_DCR 0x0000000B
>> +#define DDR_DTPR0 0x36D477D0
>> +#define DDR_DTPR1 0x098B00D8
>> +#define DDR_DTPR2 0x10023600
>> +#define DDR_MR0 0x00000830
>> +#define DDR_MR1 0x00000000
>> +#define DDR_MR2 0x00000208
>> +#define DDR_MR3 0x00000000
>> +#define DDR_ODTCR 0x00010000
>> +#define DDR_ZQ0CR1 0x00000038
>> +#define DDR_DX0GCR 0x0000CE81
>> +#define DDR_DX1GCR 0x0000CE81
>> +
>> +#include "stm32mp13-ddr.dtsi"
>> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> index bedb7c600d5..39ac5692e08 100644
>> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
>> @@ -6,6 +6,7 @@
>>  #include <dt-bindings/clock/stm32mp13-clksrc.h>
>>  #include "stm32mp13-u-boot.dtsi"
>>  #include "stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi"
>> +#include "stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi"
>>  
>>  / {
>>  	aliases {
>> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
>> index c18f1911fe4..55526189d5a 100644
>> --- a/board/dhelectronics/dh_stm32mp1/board.c
>> +++ b/board/dhelectronics/dh_stm32mp1/board.c
>> @@ -304,17 +304,29 @@ static void board_get_coding_straps(void)
>>  int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
>>  					 const char *name)
>>  {
>> -	if (ddr3code == 1 &&
>> -	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x1gb-533mhz"))
>> -		return 0;
>> +	if (IS_ENABLED(CONFIG_TARGET_DH_STM32MP13X)) {
>> +		if (ddr3code == 1 &&
>> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-1x2gb-533mhz"))
>> +			return 0;
>> +
>> +		if (ddr3code == 2 &&
>> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-1x4gb-533mhz"))
>> +			return 0;
>> +	}
>>  
>> -	if (ddr3code == 2 &&
>> -	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x2gb-533mhz"))
>> -		return 0;
>> +	if (IS_ENABLED(CONFIG_TARGET_DH_STM32MP15X)) {
>> +		if (ddr3code == 1 &&
>> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x1gb-533mhz"))
>> +			return 0;
>>  
>> -	if (ddr3code == 3 &&
>> -	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x4gb-533mhz"))
>> -		return 0;
>> +		if (ddr3code == 2 &&
>> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x2gb-533mhz"))
>> +			return 0;
>> +
>> +		if (ddr3code == 3 &&
>> +		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x4gb-533mhz"))
>> +			return 0;
>> +	}
>>  
>>  	return -EINVAL;
>>  }
>> diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
>> index 210ec201bf5..d5ecbac29e0 100644
>> --- a/configs/stm32mp15_dhsom.config
>> +++ b/configs/stm32mp15_dhsom.config
>> @@ -2,7 +2,6 @@
>>  
>>  # CONFIG_ARMV7_VIRT is not set
>>  # CONFIG_BINMAN_FDT is not set
>> -CONFIG_BOARD_EARLY_INIT_F=y
>>  CONFIG_BOARD_SIZE_LIMIT=1441792
>>  CONFIG_BOOTCOUNT_BOOTLIMIT=3
>>  CONFIG_BOOTDELAY=1
>> diff --git a/configs/stm32mp_dhsom.config b/configs/stm32mp_dhsom.config
>> index 56a40839d28..31fae2de19d 100644
>> --- a/configs/stm32mp_dhsom.config
>> +++ b/configs/stm32mp_dhsom.config
>> @@ -6,6 +6,7 @@
>>  # CONFIG_SPL_PARTITION_UUIDS is not set
>>  # CONFIG_SPL_PINCTRL_FULL is not set
>>  # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
>> +CONFIG_BOARD_EARLY_INIT_F=y
>>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>>  CONFIG_BOOTCOUNT_LIMIT=y
>>  CONFIG_CMD_BOOTCOUNT=y
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
