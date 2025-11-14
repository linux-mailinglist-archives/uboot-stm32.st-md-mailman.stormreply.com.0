Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 760C1C5E540
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:49:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA23C628DB;
	Fri, 14 Nov 2025 16:49:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78DD2C628DA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:49:27 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGGcVa2538308; Fri, 14 Nov 2025 17:49:12 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ae4y8rt0k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:49:12 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snXtLAUj4/I10kr6juD+qs4D828Sur2jj0Z05Yac5wk4wTMP2VzFhRIW/uTRUbOa9JGwYRCTS5Xv9ZABq1QT/82twW2fODQzB3Sdm22/omq5jwNwqasUEfgiuTvdpK2seU6NB7SNvmjY4D0Up/Ks6lyQO5XpiP37+gG/Uvw94UXg5ywkvE04uLjfyRwgsoZv90KTn6L0ktquLUZ+L6yQ4ITcGXdTnw5hIR1p5luT/4DWir1uPAGxua04Ceg3yP3+AjLFWQjYeUzE81nq0dvDKYVek5j/YlDihAyj2y4MRxqtYurP1yqA8jPCrhe3iu3hx6kheSxPl8PLGyT3rIGbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BCPxpreS8t4T8A5x6+qbBDy2WSmIW0DEQ1pHEkfUgE=;
 b=UqjWvY95eIISEh3PtLN+18S8mOTsEDoyunKOz19eVK9VokyVlqEerxLNiMBWmzYrEXQ+YYownkG+FMVJaeMcN+hm+nZrHUzL8qu6Sf5we6ZKYDgZGrQsWgdt0DUVskKYZRp8zbyZOmacLrLae4rUVscuYrLokRh36V0CA7VnRGdL1+MZCGR9+gdb94YUIrV18KIUyM+NpfWsetHo5HBPO6TsBJIAC5hjpaxxkYaUrFZN027ebcSPzPpRw+wdZpIHWIMp4viK+hujR8JXTQ3OLVLvyCUEOhDT0aKy9rk+wTa/VZmCXZLe0ssAKnMkvZvi1v7XvjM90jH6gz2WFc3FBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BCPxpreS8t4T8A5x6+qbBDy2WSmIW0DEQ1pHEkfUgE=;
 b=m8n8Y/OliyM/bSdKBRQtj3GC3o/BkdpcUtzUYZOLbWQ9Q2inlczdAlNCuGQUwE/BkO/M035S4nz5UhSrJS6PB6vwKnrSTk1YPTyJbmYCakEMffJxzrpgzWcSuCaFsQpifwQ7L+EOkoyV/sjhzmNI4130Lm7GhzcNxGirOtsM9vwSRbOoVlqN2E21K4jT9P2rxOAKMZxs8DXw73fwb2rHEhQ3MJgTGN63VDCpQxDQ+BtQ9zqOXz5TQlY3XWRT3rhMQqL3mfzyXYueteYl1nyZ7/nlezhXgaSnWtoV5L4vI9T18tE9kXykKQ/gPQqTMr0d6PO2jdnnAZ8306Sy+G2qjw==
Received: from DUZPR01CA0211.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::24) by PAWPR10MB8115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:384::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:49:08 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::9d) by DUZPR01CA0211.outlook.office365.com
 (2603:10a6:10:4b4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:49:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:49:08 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:49:18 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:49:07 +0100
Message-ID: <f36e491d-7c23-4dd9-b2f4-48b5803e515d@foss.st.com>
Date: Fri, 14 Nov 2025 17:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yannick FERTRE <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-4-b42847884974@foss.st.com>
 <218de19e-6145-4207-bfb9-72ff5ae9c050@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <218de19e-6145-4207-bfb9-72ff5ae9c050@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|PAWPR10MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf24eef-92e4-4f42-361f-08de239dbae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDEzcXlOZG9jbkJWVTdrOTNJRWROYlAwMlZYMUlXcVZiZkFNMGs5bzc1TVVL?=
 =?utf-8?B?RmpjOFNYTDMvaFZMQjJpUS9uS1ZaY3ZvYXllY0k0T3ZDMWhDRG1mMjl5d2kz?=
 =?utf-8?B?MW05SXJ6cU5icGUwT3N4RENobEtSTVFzekhXNDdsYTlFQkUxMCtoZWlUWDFV?=
 =?utf-8?B?dUk4RjdyOEtmL0FKeXNZYzZqdEFTR3o2ZVorMGVKRTQ4UmJ0M0dpRVlTYVhF?=
 =?utf-8?B?UWpycFR3bnBCQ2FveHFLZnNjeS9JM2YxTFVLcTloN3JOVzR6M0RBZUJLeklE?=
 =?utf-8?B?WDAybUNuUVhJTlQ0TzBXTWlUU0hnUCt3MGppcTY2ZkFCTXdGeWxEZzZrSmI5?=
 =?utf-8?B?OWJLbHVTSTd1TVVrS2NTZko3eXNkZ3ROaThBdFAwckhWbGdoaHhDbVVRejZ1?=
 =?utf-8?B?VjQ0VTc5OGp2WjNJSm9taGZuNnJnNktwMWZZeGVkWVlhVzN1azlGTDBTWDJF?=
 =?utf-8?B?bnd2RlZnbEV5V1NEWkVIMVBZODljRUswQXhQZ2F0bGQ1dm44STNWNSsxaEdl?=
 =?utf-8?B?blZubmpRZmNpcnFsUFAyT3VkbEJSUUVPTmI1UHRrSzJSUEdaclVFRUc0VVlC?=
 =?utf-8?B?d1VHZ2lkc1g3ekhKLzVYeWRyamJobkpSVDBTL1dKUnptUkRqaHFzZnRJYWtW?=
 =?utf-8?B?cXNTNSsrUnJPSURJZU94VHJDV3VlUHM3Y0tTUTczUHVQM25vTVNwVEVGVE5Y?=
 =?utf-8?B?OFBqM0NrMGZyUWhudlExanhxSU5jNytybkgzcmdSWDRaalUybXV5eTdUWmND?=
 =?utf-8?B?NjRNNi84ZzRBV3JHc1Y1WU02ay9uNGdDSTJpQ3ZGdnF4SFRUeFcrN3BuVFc2?=
 =?utf-8?B?ODhJbGk5aUxGbnJwR3RJVUszSk51cXcweC9zQ3V3KytuT0w5bzVNY3ZGRVdw?=
 =?utf-8?B?QWJrbUhXT0lWZTJjWU1nN1g4dno1RVY2MXlHWXUrWTFxaW9uSnY0UnBlV2pu?=
 =?utf-8?B?R2U2K0piZkZUbkt5SFk1c2ExMlc5bkhVeC9zMWpoT0xSUXdGUFREcVhCWU9m?=
 =?utf-8?B?d3I4U2dQMkh0WmoweEQzNDZXSmNXS2ZlRmp1S1JKTEMrNDVNN1dJTllTeG1M?=
 =?utf-8?B?OEEvU2FjR0xDcVhOSWlERGVyL0cwWVE2QUgzaTRIY2UrQWFSWWczV2FnMGVY?=
 =?utf-8?B?UmRWMjVnQ01RTnA4RGpUa1l2dGMveHNQRGZRWDdpczRnSzBPUEJ4RnlpT1Zy?=
 =?utf-8?B?MHNteGliZFkzazVYUFQzVHMzWWRzY1Z0ZVJURmxXTDB0UUtwR3Q2dWszWFVP?=
 =?utf-8?B?M1g1NDQvRkVDc2x3dVFhek12dTBZUWRiUjJ0M3YwQVVEVGs4OWlvUkdoZ09Q?=
 =?utf-8?B?c1dUNEU2citudE1FQXFVWEZuNE93VkMwblJxUGxBZCsvY0xZa0ZNbC9XN2J3?=
 =?utf-8?B?bU5FSVVXdnprVUJWNTlXckRxU0lCOVg2blU4MHA4Szk1b3F3RjMxMzkycmV1?=
 =?utf-8?B?R1l6M2tYczVUUHQ5VjRMZDRrOFk5YWlmTWxMb043L1UrRmFLZFc2T0NZcUxN?=
 =?utf-8?B?ck5XSnFQZDlnUTZnWjRzdzl6R0N5VkdNQmxXZ2lRN29jcythZitKOWN1eXo4?=
 =?utf-8?B?ZHBSbWhFZnJQQ2JvSm4xamMrRm9jTnJMTUVzUm1JT3pUdTkyaXhva2E5dnNW?=
 =?utf-8?B?M3h4bFhEbVpCNUZoVy91WmlHZnRWTkJVcnVnbTlaOGdkSGx6T2Yvd3VCTUdS?=
 =?utf-8?B?eWhSRHgvU05TSGhWVWhTN3dnRlJ2V21IT0dUYjJQdFQzWDh6NGxmRllLcXc1?=
 =?utf-8?B?OGNxdHRFcjZiU1FpR2hsMkVpVmxzZzhlSDhIMnczUDJDdExEZjMvazlvTXNP?=
 =?utf-8?B?djF0c3JNLytzdDIxWlRyWVpicUFCQlJSeXd0c0Z1SFlxSjFOKy8ycEF4VzB3?=
 =?utf-8?B?NGVPbEZWSmJJZG96NEdEd2lhcGxlMFhxMUNkcmFtR1pGeHdTSEZYQ1Q4L0ZS?=
 =?utf-8?B?eUJOZWxDNUJPeFdFMVN1OFVEVFhxeVB3bFYwck1Hd3JMY2NKMGJ2dTBzL0Nl?=
 =?utf-8?B?NWFWaGRTVDNjQ3FXaTZ6bXArMVhnRVBKdnh2elZMWFdtZDFUOVBUZ3BQZUhE?=
 =?utf-8?B?Nkxsa3RHZGwxc2luQXphaXk5Y21Xc1VPWnkzRVg2VURmU3I3elp5NldNZTE0?=
 =?utf-8?Q?TgFQrpvOb7HL53lQcTgLgMjSr?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:49:08.4275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf24eef-92e4-4f42-361f-08de239dbae1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8115
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNSBTYWx0ZWRfXxEfaXkXNvvMO
 mccMGXYlGQGYMbG6P1qbDjFfTI3w7Ms4JoKpyMtvFhccZvdJv0ZhkgULn8ToWk/vBJSPFETrsaM
 g2cGxSpuNyVdRJzSIFd3QWXsSU3iQDoLoduSbIdG/pI9hfBH22v7Th4pYFsbj5OY/mvBV1Hcz0z
 t1BKv7qe71pynV4XXteCC/E5H/rVwUhYj/xUIGsVPQYBkW3gbCJ+lmUH/MdlTkhCCkS4zpmnV72
 CfVbUECRuNMBdFYSG9G4zv1EcCR5jSHyFABPsjNuddd/8axzKobX18rUdufdUxJwP010vVxVh3I
 zlN0hzat1/b0AZ6rJJhI8FXm9kT1OTTHDEj/Vx09xZotxBEAnhHiYcHak+7c3aL/ERMOoULcOfk
 waW9SUN3tKGu6B5E1+1rk4ISHEZe5A==
X-Authority-Analysis: v=2.4 cv=ZOraWH7b c=1 sm=1 tr=0 ts=69175d88 cx=c_pps
 a=KGNGHRCrBgxyWJT5PB+uzg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=sQ2N2CjvYcEZTW8wtjoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Fq1b2uV96Vow4BkBnMEn1nWKvAKyA6Oo
X-Proofpoint-GUID: Fq1b2uV96Vow4BkBnMEn1nWKvAKyA6Oo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140135
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

CgpPbiAxMC8zMC8yNSAwODo0MywgWWFubmljayBGRVJUUkUgd3JvdGU6Cj4gSGkgUmFwaGFlbCwK
PiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBBY2tlZC1ieTogWWFubmljayBGZXJ0cmU8
eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gCj4gTGUgMDQvMDkvMjAyNSDDoCAxNDo1Mywg
UmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+PiBTVE0zMk1QMiBTb0NzIGZlYXR1cmUg
YSBuZXcgdmVyc2lvbiBvZiB0aGUgTFREQyBJUC7CoCBUaGlzIG5ldyB2ZXJzaW9uCj4+IGZlYXR1
cmVzIGEgYnVzIGNsb2NrLCBhcyB3ZWxsIGFzIGEgMTUwTUh6IHBhZCBmcmVxdWVuY3kuwqAgQWRk
IGl0cwo+PiBjb21wYXRpYmxlIHRvIHRoZSBsaXN0IG9mIGRldmljZSB0byBwcm9iZSBhbmQgaGFu
ZGxlIHF1aXJrcy7CoCBUaGUgbmV3Cj4+IGhhcmR3YXJlIHZlcnNpb24gZmVhdHVyZXMgYSBidXMg
Y2xvY2suCj4+Cj4+IFJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFy
ZEBmb3NzLnN0LmNvbT4KPj4gQWNrZWQtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRy
ZUBmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFw
aGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvdmlkZW8v
c3RtMzIvc3RtMzJfbHRkYy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vc3RtMzIvc3RtMzJfbHRkYy5jIGIvZHJpdmVycy92aWRlby9z
dG0zMi9zdG0zMl9sdGRjLmMKPj4gaW5kZXggMGEwNjJjODkzOWRiZTQ5YjExYWE1MGY1Y2E5NzAx
YmRiZTVjNWIwYi4uZWZlOWEwMDk5NmVjYTAzMDFkMmEyYjgyMDc0YmE5NjkwYTk2N2E3MyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMKPj4gKysrIGIvZHJp
dmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMKPj4gQEAgLTI2Miw2ICsyNjIsNyBAQCBzdGF0
aWMgY29uc3QgdTMyIGxheWVyX3JlZ3NfYTJbXSA9IHsKPj4gwqAgI2RlZmluZSBIV1ZFUl8xMDMw
MCAweDAxMDMwMAo+PiDCoCAjZGVmaW5lIEhXVkVSXzIwMTAxIDB4MDIwMTAxCj4+IMKgICNkZWZp
bmUgSFdWRVJfNDAxMDAgMHgwNDAxMDAKPj4gKyNkZWZpbmUgSFdWRVJfNDAxMDEgMHgwNDAxMDEK
Pj4gwqAgwqAgZW51bSBzdG0zMl9sdGRjX3BpeF9mbXQgewo+PiDCoMKgwqDCoMKgIFBGX0FSR0I4
ODg4ID0gMCzCoMKgwqAgLyogQVJHQiBbMzIgYml0c10gKi8KPj4gQEAgLTUyOSw3ICs1MzAsNyBA
QCBzdGF0aWMgaW50IHN0bTMyX2x0ZGNfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKPj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgdWRldmljZSAqYnJpZGdlID0gTlVMTDsKPj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgdWRldmljZSAqcGFuZWwgPSBOVUxMOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkaXNwbGF5X3Rp
bWluZyB0aW1pbmdzOwo+PiAtwqDCoMKgIHN0cnVjdCBjbGsgcGNsazsKPj4gK8KgwqDCoCBzdHJ1
Y3QgY2xrIHBjbGssIGJjbGs7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHJlc2V0X2N0bCByc3Q7Cj4+
IMKgwqDCoMKgwqAgdWxvbmcgcmF0ZTsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiBAQCAtNTQw
LDcgKzU0MSwyMSBAQCBzdGF0aWMgaW50IHN0bTMyX2x0ZGNfcHJvYmUoc3RydWN0IHVkZXZpY2Ug
KmRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiDCoMKgwqDCoMKg
IH0KPj4gwqAgLcKgwqDCoCByZXQgPSBjbGtfZ2V0X2J5X2luZGV4KGRldiwgMCwgJnBjbGspOwo+
PiArwqDCoMKgIHJldCA9IGNsa19nZXRfYnlfbmFtZShkZXYsICJidXMiLCAmYmNsayk7Cj4+ICvC
oMKgwqAgaWYgKHJldCkgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCAhPSAtRU5PREFUQSkg
ewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgImJ1cyBjbG9jayBnZXQg
ZXJyb3IgJWRcbiIsIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7
Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldCA9IGNsa19lbmFibGUoJmJjbGspOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkg
ewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgImJ1cyBjbG9jayBlbmFi
bGUgZXJyb3IgJWRcbiIsIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBy
ZXQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0
ID0gY2xrX2dldF9ieV9uYW1lKGRldiwgImxjZCIsICZwY2xrKTsKPj4gwqDCoMKgwqDCoCBpZiAo
cmV0KSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgInBlcmlwaGVyYWwgY2xv
Y2sgZ2V0IGVycm9yICVkXG4iLCByZXQpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4gQEAgLTU2Niw2ICs1ODEsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2x0ZGNfcHJvYmUoc3Ry
dWN0IHVkZXZpY2UgKmRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByaXYtPnBpeF9mbXRfaHcg
PSBwaXhfZm10X2ExOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDCoMKgwqAg
Y2FzZSBIV1ZFUl80MDEwMDoKPj4gK8KgwqDCoCBjYXNlIEhXVkVSXzQwMTAxOgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcHJpdi0+bGF5ZXJfcmVncyA9IGxheWVyX3JlZ3NfYTI7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBwcml2LT5waXhfZm10X2h3ID0gcGl4X2ZtdF9hMjsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+PiBAQCAtNjg4LDYgKzcwNCw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHRk
Y19iaW5kKHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4+IMKgIMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
dWRldmljZV9pZCBzdG0zMl9sdGRjX2lkc1tdID0gewo+PiDCoMKgwqDCoMKgIHsgLmNvbXBhdGli
bGUgPSAic3Qsc3RtMzItbHRkYyIgfSwKPj4gK8KgwqDCoCB7IC5jb21wYXRpYmxlID0gInN0LHN0
bTMybXAyNTEtbHRkYyIgfSwKPj4gK8KgwqDCoCB7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAy
NTUtbHRkYyIgfSwKPj4gwqDCoMKgwqDCoCB7IH0KPj4gwqAgfTsKPj4gwqAKQXBwbGllZCB0byB1
LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
