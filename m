Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AACCCBD031
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Dec 2025 09:45:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B56FC35E2B;
	Mon, 15 Dec 2025 08:45:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DD25C36B2A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 08:45:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF8Xj2l2030031; Mon, 15 Dec 2025 09:44:48 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013029.outbound.protection.outlook.com
 [40.107.162.29])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11gad3gw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 15 Dec 2025 09:44:48 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJA7S8m4UHnFA/p6pjqcNGTJLGmXOW3pSqp0mbeoP415GYEFBlWuanggDftelG4zE4wgiNIt0MXqeBeWjv8YoFlNXUjq5GF3MVGvF9JsmUfvK5oG9pfguFwCa9z7rD9zLFirrm4Ka6L9gjTAEvc9uKtsRzDFxOP4izwzpi/KILXEU3pREtfePEXePtbSC9ycprGtib5VZ/s6oqP4SiYWN2suYCTbkgre/WeCER8lbt1Ay7syGEfXsDJ3TQWKJ4QI6yqy495a9L8cfGW338LH5vYe/0k3d8v7J44OtynY4mBk3Yvf+QrEgsrctdAICklVBbdtgs1Q4b1dLo2EZtqWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A42LtwmcvN/srTaRF5FjiXKV8RN2ERJC9nO44L15Eq8=;
 b=vgjzf23sBYvp0eXCcHHvtKejtjTlf0+6yMUm/AKNJvzNqUJq8vViVJ2RLNSL2/lV+sKOhe6P4znARi75pO8M+xkIiOxWwtpVELht+v3mHo/hhQouHaNxn2NgcJno/935bOZbj6hMvTofQLOk3us3238JeMjs4XHf232eoFfDq7qgzUugPVY2744nQWO/cvGm684T/PXFQOM/zfpaAsAW7LPj/I9/E5Jj/dMeJbZ3jFe2CKh6lZGYX0a4FEegyVWAG5CAmUUd+9GdCiWac+h4A5oHLgQ8QRtBIbMx6dpUVpfU2BYwOZSpMOG7qjBWXWLcCvr8m+tCsWmVpjkNDH7+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A42LtwmcvN/srTaRF5FjiXKV8RN2ERJC9nO44L15Eq8=;
 b=avcashKSRHZIbTYunTF1dxLFYAs0bfJUEpB/dhDrSoW00rMCf2aSAFZElOTM+gI89NeCj4DF/8LcdnlPrRMCvjeaysdYKRyi45TD5DpgBEOujcFL+tYrL4p8lS7QBfhy5Q4jsN1Z5FzWuzAyQ3NzQHF+PQHZ4eC/sloSAhRxVnQloOMdBUf+nQOtJF85p4qaOcsZvx0zT42B10XtpTZmHkhHM2fWxXm93LSXfKplWlyxKB7NmVKNl5jdaVQeCWgBM0oLEntUxLMCKKq6VZ+08H9PjAPKrr9hyFFN2RVAu6XyIMUQ0yUqoiYVN8raNadVcB3fPsCJ0k9wCJk5XqR8IA==
Received: from DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) by DB8PR10MB3627.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:139::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:44:44 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::10) by DUZPR01CA0199.outlook.office365.com
 (2603:10a6:10:4b6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 08:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 08:44:43 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 09:45:27 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 09:44:42 +0100
Message-ID: <7469d2f7-427d-456e-b731-c1f26452fe0f@foss.st.com>
Date: Mon, 15 Dec 2025 09:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com>
 <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-2-44e6e7de2beb@foss.st.com>
 <b9fc4f8d-b10d-4308-bbe0-ff871fcdc940@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b9fc4f8d-b10d-4308-bbe0-ff871fcdc940@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C4:EE_|DB8PR10MB3627:EE_
X-MS-Office365-Filtering-Correlation-Id: 220bb59a-d213-4108-f65d-08de3bb631ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEh3Nm9rWXpCTW1odHAralhQRk1JdWJvM29CdW1LMDVpMW5lNUVYUGxSOTRQ?=
 =?utf-8?B?NHRtdXkvNVpRK1d3dTVCQmh1UHdCZW0yR3JMdzhVV1dSM1FHaXp2SUFYTHBn?=
 =?utf-8?B?bmsrTlJqUUVlelBpMmtKWDRPM2ZSek1wbzB5dXNsTTh2TFVWMElxdmtHTUdn?=
 =?utf-8?B?anBIQlVDUkt1RCtBWWs0YlNEOTRHV3lBeVZIMXVTb0JoZG42SW0vZTkvNDQ0?=
 =?utf-8?B?alU0YkQxNjdiS3NmeWVyRUE0M1duSVUwTk9RbHI0WkpBMWI2eE1kVTlPcnBh?=
 =?utf-8?B?KzVtbGFxVU1iOW9xVG5zTlM0QkJXTmx6aDJkWGVBd1pYczN5dVAwVXRRdTFC?=
 =?utf-8?B?M0hwaVdpTlFjSDJXcGx5MWE5L0ZaZ1J5Z1g1OFFOdzIzVW4vQklvbmxFV1E0?=
 =?utf-8?B?b1haNTR3LzFrbHhEVnBIN3JSRFYvYm5lbFNSWVVPTklPSnhrODJxanVseXMv?=
 =?utf-8?B?eWp1dEQ5RzJ5b21qMzE4ZU5GQUxPSkN5U2ZHR0graUdjZEN5TWR4bjl2RHZk?=
 =?utf-8?B?YWdjS09mc2tKemJYMCtxNkNIYXlLUW9IT0RUdXh3d2ZNck5sOWw1Qm9uOG9u?=
 =?utf-8?B?cklUZm1GbzJaQm9TZmdzeS94MHE1MEo5NDViaXZleGZlUHJ5VnBiYTlqUjU0?=
 =?utf-8?B?Yy9jWGVPSkJNM2VCL0xZNURkUFNnQ3lqWU94UFF6NFFiT05BQXBZRk5MRlN4?=
 =?utf-8?B?QU5zSXFSZGE1WlhuYVJGTHc4cFZiSzY4elRINmFwZnd6WXFZZjQwbndsQjNW?=
 =?utf-8?B?Zy9leU1PRGYwRlV1b25pQWM5d2xJN1V6c0IybWNWdGJXWDlLMmlJdmVKMDU4?=
 =?utf-8?B?TmtzWko5MDNFbDNWSXdQZzkzVXNQc0hvUXk5Z1REbnIyRzFzQlZBMCtGN1Ey?=
 =?utf-8?B?T0xIYzNZbTJTaGhSNTlZSE5Vd2xqbHlORlQrYkFCT3ZDMjJ1T3RXak56VGhP?=
 =?utf-8?B?ZU9TakgzelhDWXZCNUxCc2xJR2hEMVplMWx4MDFHRVB2Mm1JWDNSTUh3VTlt?=
 =?utf-8?B?eTNkam9QZ1VhT1o0bGlMQ0l2dHdEQW9aYXJTS1U4Mkc2OFdVOTl0Nk5LQ1dl?=
 =?utf-8?B?REdnM3V3NWRaelk2MjZtQW5pYSs4OGxONHlWSWltTnhPM29ITkV6Q29McnBv?=
 =?utf-8?B?NW04aXB6aUNHbHhZRktrcEdLTUVLRE5ocU1HVVh0OHFNSDgydkN5ZGdwczVw?=
 =?utf-8?B?UFhLd3hOYWJON3pzSElWMHVNMHhSbmU5WFhoQ1JtZ29nUGZtaE83ZGlCVjAr?=
 =?utf-8?B?d2MrM1Y4TWUvS1ZmcmRCMTRoYzJGZ0x2RHVnRW53U01iLzNKeXlKZU5PSERt?=
 =?utf-8?B?VEtTa0kyUDhla09CMFNLUTQzanh1ZXhxenBoL2dkL1VFK2diSkNiYUg0QWpH?=
 =?utf-8?B?ZHBDRXNMNmpZTUVpRkthUXIyVFVYS0JPMW5ETWpNbE5RYUV1WTFmWFprWTF3?=
 =?utf-8?B?dXdENm5SZm8raVQrcDlQM1c0emYrWGxZUDhwUno3SGluWDUzSldBdERXLzJz?=
 =?utf-8?B?bVBzOFdCamFWMWpIZW9BNVFadnArTzFvTFJrUmlVUmhoYldreTJ1aGh2UkQx?=
 =?utf-8?B?NDUrK3JPZjJwUUJGQWFsTlZ4NWRSSE1RM3I5cjVtVHRZM1VQNElHelFzRm42?=
 =?utf-8?B?VkVud1FSVGMrWlg5Vk1mZldqYmtsdWkwZUsrZnQ0SGtDYmFSa0hpZDdsYVV3?=
 =?utf-8?B?WlQveWo2Y2UzVTA4NGxCU0RaZk5jSS83Vm9mUXdaUFZhM0VvOUErMEtFSXBJ?=
 =?utf-8?B?T25pN0U0OVR2WGpaVVRNUW5RMDBGZ3JobkdKdjZoaEFtNExhem51RjlVNSs0?=
 =?utf-8?B?WkVxeUhhUkgxMlBEL0l0ZnV4aDA1RmR2Tk9FOGxsaW5lbHE1SXBoV0lZSGxi?=
 =?utf-8?B?Z2d0ZTJVVkdWQUVUZWRnQzZwa1VoaWtLQVRsb29VMnFadGpCOXlwZ01PN3NH?=
 =?utf-8?B?aVR5Z2IxamJtSXJoa2FZa095Vnc1Nnh6L2lkSkU4a1NkVmQzZ29oVDVZOGZZ?=
 =?utf-8?B?endYSkJXK1gyWWlad25iUFZxZENEUi9LejVhQU5YNmhWTTRMQk1DRERnT2lD?=
 =?utf-8?B?d1lxUExWUWhYYmVwRkpUUi8yeXdPK3I1NklVcitMbTFveUNXTG9OMW9rU1dJ?=
 =?utf-8?Q?RTME=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:44:43.7561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 220bb59a-d213-4108-f65d-08de3bb631ca
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3627
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX8DJwAj0ChRY5
 r3GfsguYBmxCk67C0jdpsa0DtkyvmIjuh+gTNtLaOckDeDJP2RfEONXXyag+bnpLaFGmEXKSoFW
 xFFBdRlasO/8l1mppz9d4zDuAFikBa6j9zHFG4/3cob+WqDNOWDgwIMlUrlFxXhtIiYa0lJASrW
 Dg7OKFe6YHK0igcvRnQ5p8DnyVoEbTwUuLCr05AkYe5DpfIZ/AOae39W6vK3LaDCzhg7bd3zLB5
 UxYtPA9kJX2jPquWT9pNs0MJIkQYhOGMIdjdlQ/skNXOCINomTKKT0ZqJtfGoPNda9BowpqbPS+
 lHv3QZvPyWOZptsQfyAg7DtCpefaVHK9ZyqO+iarreXoja3llbCl+UhhF9iekOnU9vb5aSuYCJf
 WKze0j6bEib7TECgK5HRIGp7NWlF1A==
X-Authority-Analysis: v=2.4 cv=AtvjHe9P c=1 sm=1 tr=0 ts=693fca80 cx=c_pps
 a=rkhW9/ox3HywulVFgu6bRw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=L46s1SQixGqRNaFqhC4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: pi4CgtIF3Kwu86GamWBwnv__Fho5Aq9n
X-Proofpoint-GUID: pi4CgtIF3Kwu86GamWBwnv__Fho5Aq9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, Gabriel
 Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] clk: stm322mp13: Resolve scmi clk
	before using it
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



On 12/12/25 16:36, Marek Vasut wrote:
> On 12/11/25 4:52 PM, Patrice Chotard wrote:
>> During clock's registration, clock's name are used to establish parent -
>> child relation. On STM32MP13, most of SCMI clocks are parent
>> clocks.
>>
>> Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
>> all scmi clocks are named by default "scmi-%zu" until they are enabled,
>> it breaks clocks registration and boot process for STM32MP13 platforms.
>>
>> By resolving SCMI clocks before clocks registration, it solves the issue.
>>
>> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Shouldn't the relationship between RCC and SCMI clock be described in DT using "clock" property and phandles / clock cells ? Once that is in place, you should be able to resolve the parent clock using that relationship described in DT, without the need to explicitly do these SCMI calls in RCC driver.

Hi Marek

I was ready to upstream one implementation when Peng submitted its proposal.

Honestly, Peng Fan's proposal was seductive as it was simple and less prone to regression.
But yes, everything is present in our DT to resolve the parent clock's name.

I will submit my implementation.

Patrice


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
