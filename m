Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE0D3A9BE
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 14:01:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C664C36B3C;
	Mon, 19 Jan 2026 13:01:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BF5FC36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 13:01:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JCLD3h632194; Mon, 19 Jan 2026 14:01:33 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4br0e95p8d-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 14:01:32 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds8zr+D/XD+Gkw3YeTR4JviseZbsCB+fnHGIB2EU7M4iThRvmkcxxmoicEIeJ80t0x7ahpoihhqbeXqLSdeL+lSNyTJthJ05bbuXe+mLt4wFLWP8vA/8dsI8RDaL8+i4AH+HYeuGCcLEjt7/vUcXOo9oh+Qgxv/V5fYkO+szE2+K2a7B8BuodF/Za8n60ZXAZpYxaONGu6NDIe/4XcXl3sTrz1O4NN5Bu7bseT21rXHDPpKXyT3sTn3EB0u3CQckiP/cPU/12oJeigaBFIA4JCIyZkA6mHoB1Q9gx1YqoT4wLil/kQ0FjqZN50LNYyRMGNOejU1Fke73vSLkBdN9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPRobMid/MeOD6aFAw6hAsLu3u89qWFv2o6rkdG3o6E=;
 b=wcO1aA/NH+DuwgHZCQyO1FIauFYGIINGvtu+on0P0qHKxhf1Fd5z0zKCjbNu+QjBZu5f4mzRO9cUs1trkpTffYfns3tBA09E6LqXgBYu4tjPH1WZ5ND57oD7tpdCk/RGwoRwGWf21WGABjDk/nWBovrTxTQdKcyzfnn7nmsqoHRATtD9v8EsGnxacAm72Kg6BRijdQVTPH0Y6VBEgUlx+4CgEhxWadXcB/mmYOBY097arbtlsU5DSVQzHWgdOF2tkck9MbdrMtwOdgk+FKaL+v4e2NLSmtpCbbEY+9c+nC/O69XUxUeMTUPAlqjsrqTD6yk0agGQu+TEjSKdWrYBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPRobMid/MeOD6aFAw6hAsLu3u89qWFv2o6rkdG3o6E=;
 b=Z9smRBYrBtWstRDcBUECJeAxt+UNHP43hvLGfe2IgqeVAOPFyYeTOR3Z2ZawyQ0OqnKXQdyET2WEaxZokl7S0uBcdwjn13NX+/e16mDC1YlWB4vGpc1DIBNANtK4bybEia+OYIJDaUXu4nBiulMyTEC3Rf1HwmKglWBbRSXcE3Z+c79vAYDziL+HuDIlFDLpHprshmhjMG+C0nAC7EPNczSL4UPzXDJ0oFp2rQp6SsebWBbUx0pOXeVNCRQ2VFnnhv1ajUMm6M6gYby/wsdQXFjvp1xcV3ezrkqt+CrJxU+zyp3Uw87N/vTopsqK8mNOcqc90bKsY5z0GXNT1rEanA==
Received: from DUZPR01CA0185.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::11) by AM9PR10MB4087.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 13:01:29 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::67) by DUZPR01CA0185.outlook.office365.com
 (2603:10a6:10:4b3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 13:01:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 13:01:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:02:55 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 14:01:26 +0100
Message-ID: <5db5267f-adb7-4d35-8aa5-cebc16ef639e@foss.st.com>
Date: Mon, 19 Jan 2026 14:01:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20251216-next-v1-0-469e1d901920@foss.st.com>
 <20251216-next-v1-2-469e1d901920@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251216-next-v1-2-469e1d901920@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|AM9PR10MB4087:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf8cfd0-f83a-46c4-7939-08de575adbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHNwa095OUFsSVgzMXgrVnhHWnhFVXhmbCs5WHdTWWkvQW5xUGlVUUdlVHR4?=
 =?utf-8?B?enJJT0lUODNJYTFqNi9hNzkrd0lNMDBieFFrTkI1eVFaSjlCaThTa1QwTlph?=
 =?utf-8?B?eFE1WE5LVmluMXJ2VlRyT3J4S1RkR0VLV282S250aTF5NzV0aUR3ZElrVEh2?=
 =?utf-8?B?UkxyZTEydlpjbTRuS0pFVXc5WklxSThSYXVwNk9KQ0xmeTg1Y3k4cFNKSjhJ?=
 =?utf-8?B?QWhzcG56NTlJdjJGQ1R5VzJqTTVJSWtCTFVER3h0OUdmUi9sc0NIWnNZRGtk?=
 =?utf-8?B?bkV3SEwvUjJiNDJQbTRWNmJpV3E3akJNZ08vTzAreSt1aHNVQjcrWERzUXRu?=
 =?utf-8?B?MTRvVUUzVDQ3UGFSQ1lLQis4aFRhSThRc3Z6ZUhBeGZMMC9ZVFc3QXR5N29s?=
 =?utf-8?B?aURqaFV0ZWY1WmYxN2gzdEZNbjgyUUs3M0NXYWNXUkJMMFNLTzYrdlRKNFNu?=
 =?utf-8?B?NXhPWXFHKzN0TEx2bHdWRzd1dVdyK1pLUHBBZnpkQ2QwdGs4OVlJelMwaW9y?=
 =?utf-8?B?S1pBdWRxWVA4M0g1NXd4dnBZN2RPYTJOVk5yNUNFVTZkMnJkSU45cGxGMHEy?=
 =?utf-8?B?TnRFODlWNGJ2MndEQVRON1o0NGorOUxTWC9pTU1WYzZZVHVVQ012S3lKWVFB?=
 =?utf-8?B?ZERyZ09VZWlXSmJuQURzZXhSSndHM1hjcW9IMlRLaldzdHdTNzh4VjlUSkJa?=
 =?utf-8?B?VTZFeFVzMEt3cFpBYjlWb1NCakFKcTM1WjM3TnBDZGM5K0c2cjFCOFcrck9B?=
 =?utf-8?B?UmdwZzRBcmlNOFZMWk5RL2NtbnhuYnlNTUF6bStoM3c0cmFadVB0UElMNlV2?=
 =?utf-8?B?aFdrTEoybm5WL3FuRlFSZ1dCblZsUWFQVE42SWZNTTVrUVB0cGFJMk9aN3l4?=
 =?utf-8?B?aC9lMXdkQnp6UmF2cHkzbHhGWk9qaXRreTIvRVB4NE50OWRETjg2SGFZeXlE?=
 =?utf-8?B?RFo2YlovaGNMRnY0T1FiZkI5VlIxRVJBUVAzU3c3b25HYW1wN0VHenhhZU1s?=
 =?utf-8?B?RVNYRmxGS3dkdkJmWGRCMDdOOWpjV1RuUEt4VllFWDVNTlZOSkxjcVhoSHNs?=
 =?utf-8?B?NFhJR2l3dE1FdUZSOFJQK1Y5eVJ6ZzlwSlJ3RGRNRjlwL29mclQzMkpPTkVW?=
 =?utf-8?B?VVFqaGE0Q3R2eEtSQnBZMlgvNVRYaUp0Ty9POFdnK05rOW9zcklEa0d0a1Mz?=
 =?utf-8?B?ZWh2alJ5UmVrTEN0SlQ3a2ZFN0pxRnBRVkZzbThlSEFZbU5LZ0NNRmxtU0Va?=
 =?utf-8?B?NE1zOVpNRUJWaFZjTnpqaitEeDRoL0N4Z0N6ZzZnVU1haVhFaGQwQnlpblMv?=
 =?utf-8?B?U0UwM1N2T2grMlhTUUdFVW5IMW5RSzUyNTA2U0hQZGIwYWx1RlNqSEJSM2Ny?=
 =?utf-8?B?ZFlVc1pGeFhlRUFrS1Z6QWc0aTRCTWsrYVlnNWZlWDkyOElmZEVpVFQ0alV2?=
 =?utf-8?B?MnhXcTJhLzVGSmhOTmoyYThhUzF6ZmcyZnZMSjRWMmtPbjYya2ZoSkkrdHRq?=
 =?utf-8?B?YTkrSHdDWlFxVjJUdzJlZDFIMG1pWHVoaGFrNmU1NmJYbitmUGtqM293RUNK?=
 =?utf-8?B?OCtvNG9TVjFCTjNoU3JWWk5YSUpYTFNIODhuQlBjVE5rZFZsRWF0L05ybkRa?=
 =?utf-8?B?KzMrckQ0OWp3VkdmRlJxK3NwU1FwZjRIMG9QQnBWZm9mRGNhTnNmQVFsaWhu?=
 =?utf-8?B?a1RoQ2NmWHRkSElaVFRGY3I4MUF5clU1akl3L1Nhd1hyQ0ZzN1VOblY2R1lM?=
 =?utf-8?B?S2prdzNtZUdIVXFURDRYbnBHaE5RcXdkU0pGZmUwa2JPZDJ3YkFVQm9Icnhx?=
 =?utf-8?B?OGhWOHlYR0d2WDFwbmFzOXNUeXpnR1Y1c0ZzN1g3azE0dHJMTGNObmdXVmtH?=
 =?utf-8?B?WTlZZG1WN0NHbFVEWHFiTnJ4U3hnSHA1SXRtMHZDRXErSjhRZXNsZG1tQ2F4?=
 =?utf-8?B?alR5QzN1U1BPYVFCN1AxOXFYK3ptbGdsM295QTdNNVVoVVJCaEpOcXNxSUlX?=
 =?utf-8?B?K3prNjJDSHNNT1BZVlNrQ0YzVnZ4Ykg5OVUyK3hrU252cmpDYVFmYjlWKzlk?=
 =?utf-8?B?eTZqNStBYTRBeEh3SEZQcHI0VHd2Rk9WWDByNzVEVUNSWGFqdDBlL2IzbWVN?=
 =?utf-8?B?SnhCNk5YVjVqdHQyTTR3cGJTUEsrWDN5bXZlTmdFUm5yYkx2a3dIQ3BMYkN3?=
 =?utf-8?B?b0w5RFlUaWZqUmdLcStaaDc4dTZWdWdycTdHd29iZXhVY0dVbmozaEswTndF?=
 =?utf-8?B?dFJ4Y2tNamlDM21aTldXbi9lMFl3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:01:27.6182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf8cfd0-f83a-46c4-7939-08de575adbaa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4087
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwOCBTYWx0ZWRfXwIho62hJWhh0
 WlL8x0lMu/Vjq2ZlWl7kvGwVocQtEk4AU1YOhHvMjHk9y47u/OKzcQZOJk3DyWVwbSd/1d+8jtb
 NyYZTIgzsdw41w+eWkmnwHGdUXL0hCfRYvzyEnWUhLa+tr1MQfVpPn7OVWcW2so85imSM+zt2vQ
 q4z3CenaSKM48QNmh5+9UV1lKRNqgrKeumi9f+/cPSse79w5++d4Cq2AnS6kJvZzXUVNZgJ1vcL
 Vz2QCYc62ZhPI+6ewmO7DruBhj6YcXadHpDQvQrbYi9PXeoGOB42DDoQzUxPti4Xhu8KmcsEfcQ
 R0zEupBPVlcMCR8unTZZV5NkxHLWes/x6YEwc2WhzQFzOXByhBtksIcUS1iBEVmcXPDGdot2hPD
 UEuJgYK+Ew2aRR9AXDBIAT7wyh8uiYUb+uZhu4+03pdZV+eiRLSTqSbIyyal3QfiGEVcYVLpyew
 /jBfUij2mZUYIDsi+mQ==
X-Authority-Analysis: v=2.4 cv=ZOPaWH7b c=1 sm=1 tr=0 ts=696e2b2c cx=c_pps
 a=yfwLCzQb6LAjxR0fyU1Vyg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vW1nh7Jg1_YA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=HbqUCD9AYU86AXjMiLEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 4wFD4Z47Zt01_-zZyDpViyM1zw5b_0ed
X-Proofpoint-GUID: 4wFD4Z47Zt01_-zZyDpViyM1zw5b_0ed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190108
Cc: Tom Rini <trini@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] spi: stm32-qspi: Increase read
 throughput in indirect mode
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

Hi,

On 12/16/25 16:31, Patrice Chotard wrote:
> When WATCHDOG_RESET() was replaced by schedule() in commit
> 29caf9305b6f ("cyclic: Use schedule() instead of WATCHDOG_RESET()")
> we not only reset the watchdog but also call the cyclic infrastructure
> which takes time and has impact on read accesses performances.
>
> Move schedule() from _stm32_qspi_read_fifo() to _stm32_qspi_poll()
> and call schedule() only every 1MB chunk of data.
>
> Test performed by reading 64MB on sNOR on stm32mp157c-ev1 board:
>
>            before      after    ratio
> Read  :  201 KB/s    520KB/s   +258%
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/spi/stm32_qspi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
> index 3216ec8010e..1778f8c1458 100644
> --- a/drivers/spi/stm32_qspi.c
> +++ b/drivers/spi/stm32_qspi.c
> @@ -165,7 +165,6 @@ static int _stm32_qspi_wait_cmd(struct stm32_qspi_priv *priv,
>   static void _stm32_qspi_read_fifo(u8 *val, void __iomem *addr)
>   {
>   	*val = readb(addr);
> -	schedule();
>   }
>   
>   static void _stm32_qspi_write_fifo(u8 *val, void __iomem *addr)
> @@ -200,6 +199,9 @@ static int _stm32_qspi_poll(struct stm32_qspi_priv *priv,
>   		}
>   
>   		fifo(buf++, &priv->regs->dr);
> +
> +		if (!(len % SZ_1M))
> +			schedule();
>   	}
>   
>   	return 0;
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
