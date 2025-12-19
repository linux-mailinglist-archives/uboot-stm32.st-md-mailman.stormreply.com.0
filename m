Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CBFCD02C6
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Dec 2025 14:56:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52999C87EDE;
	Fri, 19 Dec 2025 13:56:24 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6E17CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 13:56:22 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJDpi3n806282; Fri, 19 Dec 2025 14:56:07 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r32kjq0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 19 Dec 2025 14:56:07 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0uCBGPcayr4N7gB60NT2ShnoM1+r+3HTHuMHR18kli4lc85L6TE1SUU1hS1AuV/6qMdw+g+Tw95Szzxelp65PMrNwvhh3It4BPdMCYPrPbUzywJIJxOEHA6cH2kL8n1Nlkq5oUQ/DbLbuzLD/5R91cT3dBXhec1eBMEZku92CwScMDeEfsLt4gzVEUx8cexS/TA5CBtNFFevUUtfltmNGEBaOG4mJmwz+v1/elkrCQ0H79hhlNIfjiyb8nyZ7zY9W/iTmI0fQFxyEvEBb5WYCPQZTpcKiO06w9luKn4eBMtj6WcpxplV8KD8pwPtz86a0kiBm2RrAx27N41F23e4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqPimxAjwgeY//UWa+AF8BPTe2KOOcHFSV58l3d65KY=;
 b=i23uPvUl8waS74teE5Q4ZyGO0f37vYjwYpN9OIoiyaj2XuFWUbtsXNiM/2R68LtYNXIDEj0C3JPCv3l+lVipJXuCra2nO7oJ4OE4YMB42P7h/sYEJQkVWQLpdKD7hJXSngeclKCa6OC9X9ZjOpRWg9vTbASi8hPzNOMmxLlTDLEaC42atVneGbeUzwCBAx271uPcWElE/R2AMgSW8BGgOEfhhpdh6yhW3GdzEjrXRHdJGKcDChmoebP0yJDEFRvhjzYRy+THQd3k7QMwA5EvVO77YwJZ5sLouVC13cgaYGluplYEOlodj1dBYhRNpdFUbybAN73lHWjqPQ90PGy32A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqPimxAjwgeY//UWa+AF8BPTe2KOOcHFSV58l3d65KY=;
 b=CMkRSurGtR8U8dJ53FBFCx32oYJFQhtTXd4M9k1eee3W8+QZ84McKJGtHU0mZo3Z2zihUG0fW5+8v+DI0NT/Bgw6eu2OAZoX5kS6c+0fZRtdTFn4DizstjCHlp501t7J5GnIYVfM3e7UTc+714roIW1xWn5XjInwtAkDNbd1quvTomhpFm9GrI1WFMObJdOYnvy+Ih1LlLs9HVDwnF7W+EolkyaVddyKTZkpAFXBVGGPkB1QBuGM7vMGzhoPnGVueDZOX8Y3vEPtT2QDX9LLIqSIKj7BCEva0nqr16mbwNP2Df0vPTL16DbFAWE/98rggyCm0bgQjP5kNpJJ7Gc+Cw==
Received: from DU2PR04CA0273.eurprd04.prod.outlook.com (2603:10a6:10:28c::8)
 by GV2PR10MB6526.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 13:56:05 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::4f) by DU2PR04CA0273.outlook.office365.com
 (2603:10a6:10:28c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Fri,
 19 Dec 2025 13:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 13:56:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 14:56:53 +0100
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 14:56:03 +0100
Message-ID: <054ff1e4-3f50-4a2d-b852-dd1c3414e43e@foss.st.com>
Date: Fri, 19 Dec 2025 14:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-0-d055da246e55@foss.st.com>
 <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-1-d055da246e55@foss.st.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20251215-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v3-1-d055da246e55@foss.st.com>
X-Originating-IP: [10.48.87.14]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|GV2PR10MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: e90ac095-279e-428b-f1fa-08de3f065a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzQ0bFY0QXBUWlZDQkdQUEpmU1RQOTRFeVNWRFJpWXpnV0xWZTFENitFQjhO?=
 =?utf-8?B?NUR3dUVISlNETG9MNjkxd2ZIYmdPbTVPYTZmdmwwQnBxdi9PWnNPditNdVF5?=
 =?utf-8?B?WFpxQk80Z2VyL09iOVRpSmZlamZmT1JscXNZNWMxT3hXWDg1bEtoeHRJbTBv?=
 =?utf-8?B?TlVJZmlJUzQyWHROTitPZE1UWEFTekhKRkNTNXZBQ2pMQ0Qzc0NWUm1ZTXZj?=
 =?utf-8?B?U080SVRVTW1rU0tLOXN3RFBUbGl3RVRaVzY4UE1KL01aTzNLTkU0Tk1TbE5q?=
 =?utf-8?B?ZGNYbnhXWjN6TDVyWXBjeCtSS1M2NFM0NGNiODRySHIyT2wxc2psQ3dsallx?=
 =?utf-8?B?WGl1aVlEQldTaFdZLzVkY1hPSmdaUFZJRmdkcVNxQks2Y21HL3NxN1NMc3ZO?=
 =?utf-8?B?VGJsUGJDVnMzUUQwOHV1N1NDN2s0akUrTk9YRytJbFpHR3hUdWRJTlcvTDUy?=
 =?utf-8?B?VlFnUW1uZEUwcThhekFrTnJGMkFGYksyNStVZmZWeExWeEtwTjMwN3dpODJU?=
 =?utf-8?B?OTMrdElBdnM2N3lSbHpVZFBaYWdHakpPUXZobjZzMjFFRWJIMnFXTWI0RGNa?=
 =?utf-8?B?Vk5VM3A0OVNzZ2hZNHBPa25FTVlNTjEvc2lObDVKVHpKRXlGWTJaclNQYklh?=
 =?utf-8?B?akV1R3FveGdWaW02eUFLZFVkeXk2UEE2VGxhR0Y5VGdmd0NxQ1dJWUN6UUtn?=
 =?utf-8?B?MlhDR2FlZ1JZN2dVbVU0aVJEbmlHWmZoaG1JVEhQZDlLcHAwVVNYcWRMY0w5?=
 =?utf-8?B?MHIrd1dkbThML1NTS3ZMRkdYRjE3L1F5VE5DNnJOUWxNVFRsZFl6TXdMYmpH?=
 =?utf-8?B?SGt0ZFhnRU0wL0JYeUs2TVhvbkszeFBSQ2F1djd2OEp5aEVXemlMSkVrVlht?=
 =?utf-8?B?cFJSaVVFNXNYYUdsTUVXa1lHNnRIb1loSnhGRXVVTjJCL2Q0UjNId1QyYzZt?=
 =?utf-8?B?YSt5Z1FzREJzTm05UUZyVVZFc2NjNXRvWGsyZHJQaEVRVGlVVFVGYzhWaE1U?=
 =?utf-8?B?S3U2WmJLVVNrMkxHZkFNUFZXem1id3YvSGx5bTdKUEtYRHQxMHdxYk9jenVm?=
 =?utf-8?B?ajVCeG5WM1lQTVZuSDBHbGQ5N1lOK1pWc0dOL0haVTVEY0tpd2piZUphLzVW?=
 =?utf-8?B?dk1Vdk1SUldaQVV4blV3Vm1xQVdlNVRERmhqY0dWYU1USk9iajhGa0JYc1g1?=
 =?utf-8?B?NS9iUnFLSmYvZTByQ3pGTnVjcUtadTJYWnF3QUxxTUFXVkJ1M2FzcXRxdWpj?=
 =?utf-8?B?UzU4TW9VZld1RVROTS9NaVRWQzRuK0tFMkJOc1VsU1l5eXQzNVFZQXRyOUJS?=
 =?utf-8?B?WlREdW1lWTNLbFpIakFyNFdWQ3JtOXJyZTJTb01PcWJkSHVWK0ZvbGs1THdR?=
 =?utf-8?B?M2JUZlB1c3hRT2VSMnI5VWJMTGVEQUJNZ1diNG5rbTZKcDFDcmNsa3JzTlgx?=
 =?utf-8?B?amxwQ01PTDcxS1ZRUW1KRmRkL2hSL2lpaFZxQnRscnk0NmJZK29ueEZUdVJM?=
 =?utf-8?B?MnBZVUxxeXdKbnN2bjN1ODR1cUIwZWJZOEg0N0hvVEoydWZ0bUo5R2FORzVL?=
 =?utf-8?B?V1o5NllzWUVjK2pZUWZ5MFduY1Y1T2NRZzlBZi9WQURraUxlelVEOTZ5bGxn?=
 =?utf-8?B?cjB6dGFlS1pxZ2pLQkFaZzJSQmR0dThHay9UYzlLSFdHU040RXk1dVVjbHdt?=
 =?utf-8?B?VVR5TWNMNzRtNkRObXZqd2EvVENjSWJydHUzazd6WGtpdmgyNlU1L0hsVHpD?=
 =?utf-8?B?TTVWMnhYYzRIeTNrZ1F4TDJtblJsWXNOVHdBTTFZQWJHOEdGSmxoclkrd3JH?=
 =?utf-8?B?RjhwWDhnRGlrK3o0d0ZRY0FOWTlLd01yM1BRU0tyVjIySDFBZlFWNUtGRzNy?=
 =?utf-8?B?ZlU3NG9kS3RLYVRpTmFQRlkwM3cyS1NlUnhKRWw5ZFMvME1vTGdvNi9uVmZr?=
 =?utf-8?B?VnI4T1A3c1liWWw2N3BmRDYxcVY2bE5CRjZQYk9va0NaNG92cjB0MTVKN1kw?=
 =?utf-8?Q?l7AAtcCzp5rZThAvNwTg8xe7HtcIuw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:56:04.6994 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e90ac095-279e-428b-f1fa-08de3f065a28
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6526
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExNiBTYWx0ZWRfX87kbuMw1zqUl
 B9YPpBP4NrW1D/sZyYHgBmT1oIwo+hyjVrdAgTHgUvpiDEyHvdwcxab6EJwSNiKwFe/PjWcpU7u
 EMq486dl+Jl9lO2MG35+ce7eRopU8BroAFugZR8J08tZcL5vO4LX1h1GgAdZMr3N1M+xfy/G/2d
 H5xpIgGY55X2oNU6Y46KUVcYWjntJvw8fUvLMW8fQ9B/rTX6zDMRTE6IuNPhw7YPQ4DluaHyRKI
 x92wgjlx/Z5DgcNQQzWvZlsBrvUxxDdVrmIHQhMXMKYNVSLtQZ46viPJQFgkJU9GM+RTODh/S6y
 siSS9/yB/q2vAc34MwbtghyQvBN2XcrKiEYU6q1IqBITY1Pk3l2CoLxrSMBU7oP7UmpxPTsTF+x
 InnvhJisD2x/jPWsk+7Xy3zJ6QyAQGmqrmFRw1F3tByBTgte19PXEWIHQK6jHMKRaNmVqBejFqS
 J+2hRfbpUEItldlnraw==
X-Proofpoint-GUID: kZjdJajRhU4SeQJPN9PHkgNzJM2LeNy0
X-Authority-Analysis: v=2.4 cv=XdyEDY55 c=1 sm=1 tr=0 ts=69455977 cx=c_pps
 a=pv+iSUMxSX8tKyfHAWeKVg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=o3YcbkTvxikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XpE1AkgCAAAA:8 a=8b9GpE9nAAAA:8
 a=goFYKN2dyGwo_dc-xmwA:9 a=QEXdDO2ut3YA:10 a=_VNrz7lXTIYA:10
 a=dpZMgbseYPk84XhQl7oQ:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: kZjdJajRhU4SeQJPN9PHkgNzJM2LeNy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190116
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Marek Vasut <marek.vasut@mailbox.org>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] clk: stm32mp13: Reorder include
	files
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

You can add my : reviewed-by Gabriel FERNANDEZ 
<gabriel.fernandez@foss.st.com>

Best regards
Gabriel

On 12/15/25 15:56, Patrice Chotard wrote:
> Reorder include following rules available here :
> https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/clk/stm32/clk-stm32mp13.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/stm32/clk-stm32mp13.c b/drivers/clk/stm32/clk-stm32mp13.c
> index b4d0890f902..18e9ab364b4 100644
> --- a/drivers/clk/stm32/clk-stm32mp13.c
> +++ b/drivers/clk/stm32/clk-stm32mp13.c
> @@ -5,28 +5,26 @@
>    */
>   #define LOG_CATEGORY UCLASS_CLK
>   
> -#include <clk-uclass.h>
> -#include <dm.h>
> -#include <log.h>
> -#include <asm/io.h>
> -#include <dt-bindings/clock/stm32mp13-clks.h>
> -#include <linux/clk-provider.h>
> -#include <dt-bindings/clock/stm32mp13-clksrc.h>
> -#include <asm/arch/sys_proto.h>
> -#include <asm/global_data.h>
>   #include <clk-uclass.h>
>   #include <div64.h>
> -#include <dm/device_compat.h>
> +#include <dm.h>
>   #include <init.h>
> -#include <linux/bitops.h>
> -#include <linux/io.h>
> -#include <linux/iopoll.h>
> +#include <log.h>
>   #include <regmap.h>
>   #include <spl.h>
>   #include <syscon.h>
>   #include <time.h>
>   #include <vsprintf.h>
> +#include <asm/io.h>
> +#include <asm/global_data.h>
>   #include <asm/arch/sys_proto.h>
> +#include <dm/device_compat.h>
> +#include <dt-bindings/clock/stm32mp13-clks.h>
> +#include <dt-bindings/clock/stm32mp13-clksrc.h>
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
>   
>   #include "clk-stm32-core.h"
>   #include "stm32mp13_rcc.h"
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
