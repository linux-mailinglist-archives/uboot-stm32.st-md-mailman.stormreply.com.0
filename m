Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB1C62A8A
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Nov 2025 08:08:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A602FC628B2;
	Mon, 17 Nov 2025 07:08:17 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC1F4C030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Nov 2025 07:08:16 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH6kVal603581; Mon, 17 Nov 2025 08:07:51 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4af5bpty1c-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 17 Nov 2025 08:07:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0gvdysR6mV2NnPO4SGv8TUPicegUJYhMvARmvkyyzNeXxd8ZhLNjVcn6NIdVF/0eZ0YO7BuHO4yDbNLKkDF9beS8oRJTQ17va4sK36yFqG/mndkT0hCtE5FBqSJNohkv9NI3D61v+AuYuF9nR2T/APbrzl7/tPskX5YEd9C6S/naaIeJHkAsOAmcTSRwi3HP8FBr9ceFTha8DubKSpv6VJdHs2x4iiJhMP7ZZSnbEZg2VhS20rUDGPAF+c6haGNE5KsdzMB5lhNXY8SyuAEtXKLEromWhCxQZrL5IAGbW4tESI7ieRwAj9emJNs9AUgxiXBIX7Fvlv+mOh2bPJoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+e9wEoKS74E8HZPXNuj0W3FTI3xeaU0+7cV3jtk+7+s=;
 b=S0SgB7E3eZ6AMVXAWH4HZ2T4jP1Kbw8k6En5aDsUYvRvlWaVo+UE22DpmxHR9To2jkCOYni8K7+jz2c8Xne+NrKgNx2syamxqqTHNMBogd/2yfu6i0y6rB2TUyC0HxnqjDAZlEzU63kLRLnnxJtTCQLoviSRefbmzCkjX5KeWMRDbVKs18VsirwAr1/n6O44dRXlO/LUjtq4cR49Z/iHPs0GxikWdTGvZ71zKuwK3SubaOdJ8yKOMHPjDJk7E+Q6gJOezkQegdgzpWIJQ0KMI6fUfQGhPD/i/eNc3By+Jx1BfnDy0ceZT6B+S7Tq+FE5Ky0qpxEeXbhTY1chYD86Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e9wEoKS74E8HZPXNuj0W3FTI3xeaU0+7cV3jtk+7+s=;
 b=DGjigAMXf9LGbqnU3yXCVfnORU5gZVJNIElCaOFr8v8aWw9JOKHADnlgLo2A/Tx9UgdLQociM7A85+ZP7upyDYve8ouVfGdcW/9M08lrUHriiOmjs8a6QuOolerP8o7j9LBO7ddTL/r2bDvNRIoV1NbtG6eCHSSGp4qo0pW26Z0V0GUBgAD/KUDioytAwk2g7MMiRBGvmHU4POQEaHRI45ZNVe3/xehfBrt36STFeYb3LEkjRda/hAbNEMjM1U1WDY6g0uSSI9Ir7Ek1L7TJjwA7DYERLr/03QxQSGdtHZZ76hBYYuEURKOgv/LoHDyz4qVDfktqqNad2het6hdCgA==
Received: from DUZPR01CA0230.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::7) by VI1PR10MB3197.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:13c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:07:45 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::b3) by DUZPR01CA0230.outlook.office365.com
 (2603:10a6:10:4b4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 07:07:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 07:07:43 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:08:07 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 08:07:42 +0100
Message-ID: <aed84a68-192b-4f38-b0b0-2d828079baba@foss.st.com>
Date: Mon, 17 Nov 2025 08:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251031041640.174689-1-marek.vasut@mailbox.org>
 <45aac9e6-eaeb-4e96-baba-225a6b63f636@foss.st.com>
Content-Language: en-US
In-Reply-To: <45aac9e6-eaeb-4e96-baba-225a6b63f636@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|VI1PR10MB3197:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e00a2d-65c1-433e-8ec8-08de25a80118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V21WY0kwYWxmWUgwalBTa0hpYXBpWkQzaDNVQ0FzOXFvZ0pxY0tPRHZKakxo?=
 =?utf-8?B?dXVEanFiSEtZWjh1K1d3bTI3Ry9EU2lZM0FzUHIxUHkvRjhUeW9xWFcyTUxP?=
 =?utf-8?B?dzk0VytqblRiRnZpQWw1bldmVk9CbDlJbVN0WXFWa0c5dFJJYlNrN29FK3lv?=
 =?utf-8?B?cWxDbmdGZStkbnBlZHRwYUZDUmdMNnZOZ1lUVFVSMDlNUkdoOHNvRSt0a3J2?=
 =?utf-8?B?L2NoWWpDZ1VUTDdXNEMzaXFiem91ZDhKZzB4M2JKSEVaSXQwcnlaQ3pnb3Vr?=
 =?utf-8?B?OGFDNTNDMkR5VEcrNzJQSTdWVjM5S01pQk5iNC9ma2xoYkh6UTl4M0s3RGp2?=
 =?utf-8?B?aTlqRzRuc3grc0taVVJPN2VIV3pWUnppR1UrR01FRVZjUXVNcUI4WFRXc00r?=
 =?utf-8?B?WnVSRkJuUDhnVTJ3WmthRlNDS0Rta1hOUm02NFlMN2tQeVYydUh5dVlxU2lk?=
 =?utf-8?B?SWJBZUNkVDBoN2JramRrMXB4cEtiT0JoMmRLdUwyeDJsd1pFSU9tcWRscjdi?=
 =?utf-8?B?QW1HTHFoMVZaQkwwblVDd2ZKV1hMbmxiNzFYWk5XNVlHTVEvK3lTY3czaTdp?=
 =?utf-8?B?RkNLQzRaSXYwbEt0QTRWRGhmZDU1TGE2SzAxemxTQ25iU0RLc2QvMENrV0Jy?=
 =?utf-8?B?V0tHS2ZSM0pXaDREbGhQbTRabEpsRG5kZFdyOHpVK1NCdStFWlhYMjY5OFU4?=
 =?utf-8?B?aGdCOXhoRmVpSFdLRUJTbENlR0p3NndXK2QwZWlaREM3WHZnNHNNV0JOaU1n?=
 =?utf-8?B?aHJCWHZ0R24wZXdGVklZbVIzT01ZK0xhVFVHY3QvN09pVTFDRE9sY3MwRXpx?=
 =?utf-8?B?YVovL280cDRFSm9JMG1CM05tOWdUNTRLVldhYTdBRUVUZHY0ZzRCSGtkRGhk?=
 =?utf-8?B?RFZGc1QrWGJXVXFabk5jSS9xS096NmZIU0dhWEYxb1paRG1pK1UxajJGVDBW?=
 =?utf-8?B?SEt1T0RqM1hiZDJzYmZSb29TZjlkYUVOcjFjM3o4dHB3V24yYVlQRU12ekd6?=
 =?utf-8?B?MWZ2aWU5TlEvd2QxSGlNL2kzV1RFdkhXN3c4akxyUUtFOStUeFNRbWtmd0JO?=
 =?utf-8?B?bVpxUVVkZTJBU0NrZEQyUEhvOGZDbkxSUU1keXBzUVlhYmpBVG82R3ltUHhx?=
 =?utf-8?B?bjJsRTk5WC8wSnpJWDg0L1BCVTRpRDh0OHRNZGYxMHBWc0ZJMmV5VzJsYWFV?=
 =?utf-8?B?NGpYZ1hsRG5YUjArT1UxUXNTeDhaTUtkY1VsOXN1ajdjUCs4VW5QbUhTYWxC?=
 =?utf-8?B?OFkrQmd3bkxLeWRFaUtLdjY5d215eDVTcm1ZWE1oYlIySERYTWlITE5KNWlo?=
 =?utf-8?B?SGs4dS9yaWI5ZzM3RkR1UWxhVW1iL1ZCVy9KQ3RDbzc3cDc1ZmhiM3N0V0Rs?=
 =?utf-8?B?VFRqaitIZzRmejJMRUhGV3dZRWRJTGVjU0Jpam9qQjNpaW41eFE4MGMvWXRI?=
 =?utf-8?B?QWlxK3VjaWdFZnJWYWozOTBsSk85dWtOY2FTdy9LTmVSWTBDQUlkeG1Ob0di?=
 =?utf-8?B?Q2tRdHdldXR1OHlEbEtKOXVBUWVxTTllQmg1TTg1TUNHVHB5S1ZNZFlHc3J3?=
 =?utf-8?B?YkEyTThuVEpCUGw3L3V5eDJxQ3ptUjZaL3d1ck5heDhkWmpSa0RlMEZEQWhl?=
 =?utf-8?B?T2RSclp5NnptUlF2MEwrVnVTRjcvdlRra2ZkQU9pVWF0RkZGZkcwOG91NTJ1?=
 =?utf-8?B?c3ppYXBLZmJweDI3U3FZWjBJMkhRNUNnK2I5Z0s0UHg5YTU1ZVh5RVNkL0RW?=
 =?utf-8?B?eFZJODZqMERvYi9lMEJvbHJHM3VZU2VDSG01eVhEWno2dmhQYm5ZMUM5bW9z?=
 =?utf-8?B?b1Fad3FwMDVwbFFLd2xOTWl3ZHNOenRwS2FzSG9rT1c4NjhaZFcvQkdLZ1FM?=
 =?utf-8?B?eFUyQVRycjBPRVVpZ2I4ZzdRRy9Pa2NMd3poZHozdlFhZlBJTklQd2NTaTE0?=
 =?utf-8?B?bEdDOXhEVFlMZ3c3OFc2M2xHL2I1aU5OM3B6blNDVzFEYzJVR0o5K0tCOHY1?=
 =?utf-8?B?UmJBTTErMTNTanFnWmtmR0x4d3lFNWxMUEJLbjhpcWxzVnBEdGdVT1hMdUky?=
 =?utf-8?B?M1A4cTE2UndnNFRTT1FpNmU0dnV1Mk53bUtTNStGL3lpSE5zRVVyTFRNT0dJ?=
 =?utf-8?Q?I7Ec=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 07:07:43.5172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e00a2d-65c1-433e-8ec8-08de25a80118
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3197
X-Authority-Analysis: v=2.4 cv=StCdKfO0 c=1 sm=1 tr=0 ts=691ac9c7 cx=c_pps
 a=N5nYs/rxV1Qs1gBNkHC0SA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=dQoswRhcus6D7Pw7L-cA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: XQIDBc8ge7BdLx4MomDVbbV83zIlL4Lw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OSBTYWx0ZWRfX693eAxOChGKB
 ifpXpYl4Ye9a7Qy0vkL2RCJib4yW12UgkRLB1igNkX75crJRTzzakqGBcKlfs5Dr6wBSIzcCumU
 r+bF9cGNnzhTQQcXxQORXIt8h7GIt3P2uV/zha2bBDS7jUc4EPJ+/pZQPP4vD5Q6HicF2UqmPmy
 qf6uF8fQ5jNPgXvUifBXxOiA/vpxTxnOR7QlgZwX/BjRiSiX4SyO/poYISbhhJGbie26BsbXkqn
 F2hPkhn1+n1J6hLS+NZA8mVstshFCGvfDD621+gzS70bVv6dc5H68j9D8r924+ThsbU0R2sc6dT
 v8lpuVnGJON092Aw+II29RIcf/2mCpMp0dNlS95kfMkVQX4FnxHNNJqopqvggI8HRlUNaV4202n
 QyAuq2IrCmZp7v3Li1joWL56VyfPhA==
X-Proofpoint-ORIG-GUID: XQIDBc8ge7BdLx4MomDVbbV83zIlL4Lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170059
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add missing build of ST DFU
 virt code on DH STM32MP1 DHSOM
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



On 10/31/25 10:48, Patrice CHOTARD wrote:
> 
> 
> On 10/31/25 05:16, Marek Vasut wrote:
>> Commit 6d91f0a3a14d ("board: st: common: cleanup dfu support") split
>> the vendor-specific DFU implementation into two files, but failed to
>> update other non-ST boards. This did not lead to noticable breakage
>> with plain simple dfu-util, but it makes the ST proprietary programmer
>> CLI tool end in an infinite loop. Update the Makefile accordingly to
>> allow even that kind of tooling to work.
>>
>> Fixes: 6d91f0a3a14d ("board: st: common: cleanup dfu support")
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  board/dhelectronics/dh_stm32mp1/Makefile | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
>> index ffd221ac224..2f4a301d1a0 100644
>> --- a/board/dhelectronics/dh_stm32mp1/Makefile
>> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
>> @@ -7,3 +7,4 @@ obj-$(CONFIG_PMIC_STPMIC1) += ../../st/common/stpmic1.o
>>  obj-y += board.o
>>  
>>  obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
>> +obj-$(CONFIG_$(PHASE_)DFU_VIRT) += ../../st/common/stm32mp_dfu_virt.o
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
