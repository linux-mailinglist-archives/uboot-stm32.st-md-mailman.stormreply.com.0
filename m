Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A84B57C50
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Sep 2025 15:06:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 754D7C3F931;
	Mon, 15 Sep 2025 13:06:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCB4FC36B3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 13:06:13 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FD0pa6013616;
 Mon, 15 Sep 2025 15:06:02 +0200
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013055.outbound.protection.outlook.com
 [40.107.162.55])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 495j644v57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 15:06:02 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmQCYr3EMf/BE+qsLl41lzTHINJ/r4CJNNh94SDBQig7SQwvV7ULMI7zzgcwIFZzkcnoEtlcnwuLuP8NfD1eXU/kViZouCdzohZjVsu6/l303mbruuvc5BYgZOD9YUJb0m1cgTeLHZQn6I40i1x2pajXSSQFakxrrBcVDL/+zAriCyvYP8a77SVzlss2bqLkV7HB+2oZm8nMKh2tB+rY6S6VeuXEM4lN2FqukCP6vGu+czBmGXOp4BRZfgjFvpyxYKGbMFnlhV/NlWVDv+H0lLv2/9ff67rBtBNv2pp/F/t+nHS0qP9LyCUd+yFUcZOP2gR58l9Ym/av0hhyKOGd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tja1suPk+7WZk6bcKbW6DEjuC5pLjwnaXhN6S/ZZAQg=;
 b=GPKwqoTd9Hwc7yqYAFLrYDrD53ifudYoO4Owh3bAGiuwtLqRg0QzZZGOm9uCngqm0SVgCg2stUGHNu1ga25QMTWrRZiQmiMsOl9FD+Fko6trWEAyMjrDAFYpMV36b58zgZ1Awaq5e8ZjSvaLZ1Z8S7+RU1XpFYJMm+FYr8XaJ91/4eUGIwVJ7VIN8Z1pWHThbFzQ/b3TXIl4oebHFG7HHvvcCaBV2uFPjdniIlQaqJ0yD19PhikvGZng3ebqRj+DRtvDA/WC+h2Mi/QiGflaSOzArgvYb1yk6HD4Su7vepp0/95Jj1Ze4ukC+INbCbjN5juxgXHF8Cpq8+4nAD+v3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tja1suPk+7WZk6bcKbW6DEjuC5pLjwnaXhN6S/ZZAQg=;
 b=fOoPaEs9/z+eZKL2Nv1FJHsgufSmUmPmbcHjTpkjQWu4/tXeV2TVVEpnPaHtdKAkeDWFUztFlO1xmeQs22xMp6lSTEzXwE9yJ5sO2dXulEAu9NZg0HONIXV5HXIw9LMNxzUtY4KFS4NwSfG69B770L4R1qt8CzcI0tOxJmVou9XLdBThfwO7D+HA73BHq9DD0zq7N7bPz7B71aa1x3dALhEBSoNBnQ/PcWUsJFP6IXwupidU9lx81AeCujVglLrp5lryLfV5saDe2REggEh5zipVfe0UoHLal4F1cdDko4oA2fFhHWRwH/vOJhrVp/RmD0RmQE8lC7NbDAqpqJ8TYg==
Received: from DU2P251CA0025.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::23)
 by GV1PR10MB8736.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 13:05:58 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::50) by DU2P251CA0025.outlook.office365.com
 (2603:10a6:10:230::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Mon,
 15 Sep 2025 13:05:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 15 Sep 2025 13:05:58 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 15:03:34 +0200
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 15:05:57 +0200
Message-ID: <4cd5e70d-875c-42da-859c-524ba439a171@foss.st.com>
Date: Mon, 15 Sep 2025 15:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-4-b42847884974@foss.st.com>
 <3b8a1653-9cf9-4107-b2a8-2c2f639a5ddb@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <3b8a1653-9cf9-4107-b2a8-2c2f639a5ddb@foss.st.com>
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|GV1PR10MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6f4a80-21be-4a07-b5b8-08ddf4589ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NS9jYUZ5L292Z3FiWnA5Nnlsb242NW5jcU9nZXlHVG14TnZYV0hwVXNQUGI1?=
 =?utf-8?B?Q1lRRGRTY0dPd1FuU0RYVVhDcVFNT3FEOXZKVkdKdDQzQVpjYUNPQml1T0xL?=
 =?utf-8?B?eGtyOXlyTkdGbHZyVWdhWkRhcnJNTkI1dnRGSGZhRzFFSGhKNEFpalJTU21V?=
 =?utf-8?B?YkxvdERkN2hIaGR4S0t4bVpWN05aWGJ5M0VGSk1PMmxraXNjREUyYno3S09m?=
 =?utf-8?B?T0RwV1AwRWhwcVNzMVk3djBleE53TnkvbE4rQ2lKT0hGcjVDSmRvRXRrUk9w?=
 =?utf-8?B?RnE1RERKeVFyanE0N2Flcm5OR1MwcWJoWWdBb3hKUGNabVN0aTIya3EvWWho?=
 =?utf-8?B?NFVJKzFDY3VxcTlxOFl3TU1IdW5hNEFWcGVqb2NjZ0xGRGFycWpsT1hMZjNs?=
 =?utf-8?B?ZXVDNEJHODBMYm96WVJxY1RTcU5KZ1ZNUEU3U2JrNk5QYUs5Y1R2a2VEaVNr?=
 =?utf-8?B?NnF2b3g1NERycmx1NFJ6RkNBaERXNWxKTHBFYzFteTlnckdCZWRJeTFZR3pV?=
 =?utf-8?B?R2N1dkUrWWpHcFhqSUZvTkVHclFhc1pmeXRpNDZXNDRFcDBwUk8reTZ0ZWJD?=
 =?utf-8?B?NmlEZVZDeGkwa0lwUWdWNGZSSGRtRFAxeUVqbDVZSGVmNnBKdlhYOGRTemVH?=
 =?utf-8?B?YVprdTIybzI4U0hvbTdNSUFlVDhyRGx5TXZ0NVY4WDVGaVYwVEsvVDlGRHBT?=
 =?utf-8?B?TENwdmdxNnVkZzl6N0tMU3NucHdWVDNralBQdW5Nc3lyS2srYVowcFBBeTla?=
 =?utf-8?B?Rll4VVpXYkMwamFieW5wU2puQk5DODQ1MEs1bjFURlJwNWd1WnZWcEtjUlJD?=
 =?utf-8?B?UEUyMVFUQ0xnNnpNME14bHE4K1FTUE1TT3RSRXlVMVJFR0JNd0R4SHk5L0dK?=
 =?utf-8?B?RW1rbXdRL25nejAxN3lMZlBMMXRPSHJjS2Zja3VvazJpNVBQaEhBbisveWJa?=
 =?utf-8?B?ek9BWUk0TzRCS2JsMnBjMWlBeVBLL081WitvWm1uRTRHaVFMVkRaamdTTlpE?=
 =?utf-8?B?VE1uVjc4d25DU2xsdDFwZ0U4Yjg2TUs5MmxPMWNEL2NLRnROUTF5NVg0Sjgw?=
 =?utf-8?B?eTFMS2k1dFBDMC80TUhVcVVLc0J3REdwM0JFTWNLODFoTzdJN0xUdlY0T2JT?=
 =?utf-8?B?bnBhU3B1STlrekRjSW1xdXVVMk5MWTAzbWN1QzhTTU1Ob21IWStBRjZNYm9u?=
 =?utf-8?B?NzZjZmJuZTF0VWF1YTM3MFQvd0FzTG9kUmduTmwvR2ZHUjIzMk5IWncyeVdw?=
 =?utf-8?B?OUoxVmhMMEIzSU1BWG0zMXpud0dtOXl5NHdwcVBhZHc5d1RGeGI5T3ZOQjVR?=
 =?utf-8?B?QXE3Z1IreXlndlBkaGU1SSs0eEhQbW5oRk45M3BZbUVMNHowZzZySE9MYzV1?=
 =?utf-8?B?YWQvdmtIc0ZaOEhncUxQb3RUU3kzTVUvUGJyQldGR2JrWURZODNUS1BmQ2Zi?=
 =?utf-8?B?eUJHTHBVV2w4dnVkUkJoY0xSaVZSeDB6QS9iemNVT2Y1cC9CcStCWEpQK3ND?=
 =?utf-8?B?QlA1VDZQSVRZMGRBb0FjcGtFL1hscDUzdzBDTmRWcFp0QTRvcUVXSWh5ZllC?=
 =?utf-8?B?R2lnRVlDT0VPNWVVb1k4K0FLVXcxd1pZV2RQbTJpYmIwOXRxcVY3Y3RCbSt6?=
 =?utf-8?B?VjI0STB3Q1ZTL3Fmc0JBTWRUNXFmYXBkaDBXNkU2SEc5bGphT1hjUDRQTVh4?=
 =?utf-8?B?VUFnaEt2U3lubkVaTnZHdFBMc0Q2NmNYMkFpdDQ3eFE1Y3N0VWQvS1o3RFVw?=
 =?utf-8?B?MnhvNnF2eGc5UENvVStqZm9scGJVQU5ac200ODRjSU50OGdPZHZacElUanAy?=
 =?utf-8?B?UzNWa3dDL1QvU2JuREJOR2tUM21sUE9oN3o3d1pHWnFUYmtON3drd0pHRm1a?=
 =?utf-8?B?TnkwRS9mSWxHSmFRcnRDbThxQzhya2oyeitaTGtYMDloYkZxRnVHV0Fma2F5?=
 =?utf-8?B?T244c21DUWIxNFR2NmJuVWRoYmxTMXphaVI2ZWppMzFENjRHaWhrVWRFSWZD?=
 =?utf-8?B?YUxKQVh3T29ybGJSUytvSSt6Q1kzRDFDbk9OKzhRN2JoZ0E0emRZMkVEOTdV?=
 =?utf-8?B?SHRCcjdYTjcraE9iNU5Xb1FCMkhHY2o0aTd1QT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 13:05:58.1613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6f4a80-21be-4a07-b5b8-08ddf4589ce2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8736
X-Proofpoint-ORIG-GUID: TEBnDd5DThwMRw_S16bFw3d9WB8Fgopi
X-Proofpoint-GUID: TEBnDd5DThwMRw_S16bFw3d9WB8Fgopi
X-Authority-Analysis: v=2.4 cv=Xq/6OUF9 c=1 sm=1 tr=0 ts=68c80f3a cx=c_pps
 a=KrdtjRokVkZpNyWqjvoQ6Q==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XKbaJabmtZkA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8
 a=8b9GpE9nAAAA:8 a=YKXoFr5iN8zHLnnkBlEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDIyNSBTYWx0ZWRfX2WxjqWBAJT7X
 E9Jb7LmOGd1mlRli/h4dt1xXvuQnuvqPR+Uc9meN5vQgu1BxGzzICPzn2ntvGgbvF8jvtQaOhiy
 Y485Ehi/6GRCyBZ/lO/2KLPcYv3/NI1Vwo+nH1nzYmyNcY6nWBtB0uCI7jNThr2FRLyyjWM4fwf
 cduXZHOl1Tgd1PLS4WFYi6tu0R6+lAa/rJbGQqMLv8ms3A15UQ9njgVh/nYvnLpfT/tmJMbBxR8
 YZP9ZEC/KkZThTtG4/G250lGW5vNMJZV6GAIkp/IvJhV80l8hzSvEL5JmxyrthUHgMl5SGfxglF
 X/meqvmWhqKzXX2fSdAo9ifqcuXewoddXvEXf71hugCb9M1L5WPx2OuGWp4BDAO3cGnignU5oDR
 enOC5kOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130225
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 4/7] video: stm32: ltdc: support new
 hardware version for STM32MP25 SoC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA5LzEyLzI1IDE4OjQxLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4KPiBPbiA5LzQvMjUg
MTQ6NTMsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IC4uLgoKPj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgdWRldmljZV9pZCBzdG0zMl9sdGRjX2lkc1tdID0gewo+PiAgCXsgLmNvbXBhdGli
bGUgPSAic3Qsc3RtMzItbHRkYyIgfSwKPj4gKwl7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAy
NTEtbHRkYyIgfSwKPj4gKwl7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAyNTUtbHRkYyIgfSwK
PiBpbiBWMSwgb25seSAic3Qsc3RtMzJtcDI1MS1sdGRjIiBjb21wYXRpYmxlIHdhcyBpbnRyb2R1
Y2VkLgo+IFdoeSBhcmUgeW91IGFkZGluZyAic3Qsc3RtMzJtcDI1NS1sdGRjIiBjb21wYXRpYmxl
ID8gCj4KPiBGb3IgbWUgb25seSAic3Qsc3RtMzItbHRkYyIgaXMgbmVlZGVkLCBjdXJyZW50bHks
IG5vdGhpbmcgaW4gZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMKPiBpcyBqdXN0aWZ5
aW5nIHRvIGFkZCAic3Qsc3RtMzJtcDI1MS1sdGRjIiBvciAic3Qsc3RtMzJtcDI1MS1sdGRjIiBu
ZXcgY29tcGF0aWJsZS4KPgo+IFBhdHJpY2UKCkhpIFBhdHJpY2UsCgpJdCBoYXMgYmVlbiBwb29y
bHkgZXhwbGFpbmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIuIEJldHdlZW4gdGhlIHYzIGFuZCB2NCB2
ZXJzaW9ucwpvZiB0aGUgTGludXggc2VyaWVzOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNTA4MjItZHJtLW1pc2MtbmV4dC12NS0wLTljODI1ZTI4ZjczM0Bmb3NzLnN0LmNvbS8KClNp
bmNlIFUtQm9vdCBpcyBiYXNlZCBvbiB0aGUgTGludXggZGV2aWNlLXRyZWUsIEkgZmlndXJlZCBp
dCBtaWdodCBmb2xsb3cgdGhlCmFkZGVkIGNvbXBhdGlibGUuCk5vdyB0aGUgcmVhc29uIHdoeSB0
aGUgInN0LHN0bTMybXAyNTUtbHRkYyIgaGFzIGJlZW4gYWRkZWQgaXMgYmVjYXVzZSBvbiB0aGUK
U1RNMzJNUDI1NSAoYW5kIGJpZ2dlcikgdGhlIExUREMgbmVlZHMgNCBjbG9ja3MsIHdoZXRoZXIg
b24gdGhlIFNUTTMyTVAyNTEgYW5kCnNtYWxsZXIgU29DcyBpdCBvbmx5IG5lZWRzIHR3by4gVGh1
cyB0aGUgdHdvIG5ldyBjb21wYXRpYmxlcy4gRnVydGhlcm1vcmUgdGhlcmUKaXMgZmVhdHVyZXMg
ZGVwZW5kaW5nIG9uIHRoZSBTb0MgdmVyc2lvbiB3aGljaCB3aWxsIGJlIGFkZGVkIGluIHRoZSBu
ZWFyIGZ1dHVyZS4KQmVzdCByZWdhcmRzLCBSYXBoYcOrbAo+Cj4+ICAJeyB9Cj4+ICB9Owo+PiAg
Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
