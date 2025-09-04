Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1EB43C1D
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 14:53:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C9EC36B1F;
	Thu,  4 Sep 2025 12:53:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2183C3FAD1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:53:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584CPbtP022527;
 Thu, 4 Sep 2025 14:53:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 2v0z4VxZUDgC1rJndYI7/I7rru1E6dKsv2/LXAcFRqY=; b=YDRdZHNCFVmGh86h
 SGJbcdwCpMQobYaCa9XrU7ELNU1JBvrCwWf0NQnHanCDHNuLGWUU8hB0P+ie2/dh
 X+pa+QivhDyInu2RnmusPsHHFfMLcQWfUIrgFgDR8kTvOvaXJGlj63eWIWo3RqBL
 Wt+GSBXFcVgJJA67sbhEGp5wwM9Bzsh861lNuLBEuTGO2PDi6JhB1UQw/Cr6h7nO
 eg1dbg54NdLXLbIcU+sFcpo4/AkPZP8gcuHFNf6xycf793xLdR/cMbmX/gLJkNEv
 MLFOkexyr4LIdMN8o3tlvPLV25Do3S8LG68dAqF5YNQNnFGqAZh4pzHRadAjtU7T
 RujdhA==
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013028.outbound.protection.outlook.com
 [40.107.162.28])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7nj65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 14:53:18 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVHmZ2AclGari9t5xk2iBhbeaIuGNHxAJYYETPCqg6q3zoRAw9LoWcQTS44zdVHk75gFEmP15p4clAfdAJi/VOcZEfUqS+LTYCtdL4BQl1L6iYv5RtsiB1NO5oDMvZXvsWg5GNO76XqAG+iZwP5Gh+eZTEenwYCRn2c0V+D1GCbnKLAgmT8guH0c2Q3F+2zAJFokNZLcnCjDjmzjQE6YyPkHpRco+eerbWZYPJdeKgR2E2s24eH9iHcpJBbVhAIwO3gXjTpyizmy5MwH3yF9EmRHQnnAQum02UckYloRxoLvAoq5X1uEhkuWBUfEIjtVnuGS3ip1elJrDziZOvvPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2v0z4VxZUDgC1rJndYI7/I7rru1E6dKsv2/LXAcFRqY=;
 b=GrLlT56vG3Uxt0KN5qM2We8q7TrPLClaZg0sdCGL5UkqxcnoIvQTXOf2ftI9GxEY7qNdRzcS0T5TehvIoKmHtoEnqdB90S7TukoNzxfEuS+8906n9L8Z/Wx0Nsbnmd8zyKs3taCM4Fl1Dk0aAIcdWxRZNsewNPXqKU+7sTD5DtarjCsl/6T+aMcISkyGi7A9ElDa5ww0cslo0Z19FLNTfZRMYawHWwuPCdnzZsRLiuvxfeTWng8cgVuYj7eHTGVIpnBN7e4lMORl1PDjv4eE8TLg+5KSZo/966mahMt/e1HTK3QIb6ZNKkoaCjVmTesVVjDuyMeiLfZ7akkCKCBWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v0z4VxZUDgC1rJndYI7/I7rru1E6dKsv2/LXAcFRqY=;
 b=FlPJh+ixPO0X1ZePiSqD9yIAdoehBoslNH38gFg4753TkPZy6FpmHepGt4ZV1Ygn3d0ombz/4zssB3GX8o8ZsadDuA0pugyg6Aoq5yNzmiYmiM1FBGNCVRuos3g5ST/3m4bM649E28FCL71DFtax9Xpv6p6pfq1bcq5zrPMOPfs=
Received: from AS4P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::14)
 by DU0PR10MB7358.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:446::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 12:53:16 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::13) by AS4P251CA0014.outlook.office365.com
 (2603:10a6:20b:5d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.0 via Frontend Transport; Thu, 4 Sep 2025 12:53:15 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:46:02 +0200
Received: from localhost (10.252.28.189) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:53:15 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 4 Sep 2025 14:53:09 +0200
MIME-Version: 1.0
Message-ID: <20250904-master-v3-5-b42847884974@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
In-Reply-To: <20250904-master-v3-0-b42847884974@foss.st.com>
To: Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.28.189]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|DU0PR10MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fa99b7-090c-4c14-c96a-08ddebb203fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDZvUXdVU2dpRUtyekdVWXk4TVZQenlRbi9rYXYzVnI3VnFzbFZCclMwRFhv?=
 =?utf-8?B?WlRkZ09WSUlZdlhQNWYyNWR3VGdmZk1NVlFMZ2dXUE1veGwzWElQUXkrMnVu?=
 =?utf-8?B?dmRzMmlrY1c4RkZ2YmpxVFIzbldxa3lWSkpnTVdWeUtreUJ2UWM4bXhoL0ti?=
 =?utf-8?B?YjJFdS8zWHJzOVQyeUoxTGdQT1poZTF0WmRKaWFhRlBBS1lyU0ZKMmVMYkRj?=
 =?utf-8?B?T2xvcXJRYVlkaHNpb2kvLzhRb3B1eUtKQitSb3NPcjBPVnlHTTk5aDhqTEpN?=
 =?utf-8?B?UktZL2kwWldnelU1aUdTV05qd1hndlFSSlBFcFNORmQwWEdPY21MUWNNYjBa?=
 =?utf-8?B?UkFsTDVpUWREZDlJakYvN0pMWjVhWnVtZXBpTkZMalh0ZmdiR0ZtdHE3bTJR?=
 =?utf-8?B?QVVKRFcrNm5VaDg1eGtLL3ZlK2VZYktzbkhFQUFaZjZ3a1FsMWtpYjFXUjVt?=
 =?utf-8?B?YzVyb2I3YVNTSmdRWVQ2WWV4YkdQOHMzTmh2dkorT1MySkw2ekJYMWRaUHI1?=
 =?utf-8?B?VThqTjVhbi9LdFB5M3VXK1N2Mkl0OXZibnFRMnBFNGxYaGVRNEVZNlJQV1RU?=
 =?utf-8?B?elF3aWtUTENtakp4SVBXT204UlV5ODdZQlNueC80ZlRzVDJ0dTA0cmtIREtV?=
 =?utf-8?B?bVJ4cysyenFiV0xTZTdITk1nNUVZTkNVcVBXUHF4YTlBK3hZdkR0T2lxWkhM?=
 =?utf-8?B?bko1bk9DVmdTZEFyRzNCU2lwRTFDNXA2SzVYQTFSNWp1UHN4YTlhN3dDRlB5?=
 =?utf-8?B?RUd5ZVZPeEovUllXalY0RWxEOUJkYjJ6U2FGaHo0UWVBUzN0MzJsTk4wUEY4?=
 =?utf-8?B?ZFJWK2xBOEQzL0orYUxpMWxEZExITVozZGdCeDRNZFlyL01SNVlzc1lZcmZX?=
 =?utf-8?B?NktLSkJLd0E0UTMxb2VMZ1VUVmtsM0k1M1I3NStnSXJURElTM2doaDVGYS83?=
 =?utf-8?B?TnpEK2xDS01sMURxTFpMRXNySWo4U1loZVFSeHM3NzcrZTlKVnZKcmhyN0ly?=
 =?utf-8?B?eVBxRXZIZXR3VktRbnY3UDdMYXpod05YQ1FaVlVIaDZacjJhQXJNa3FadkIv?=
 =?utf-8?B?MDlZWUg2UVhqNTZoZjRtVWZxU0ZGRjIycHh5czJUK3l6K2VoKzZ6ZXltRGQ0?=
 =?utf-8?B?RHBFZi9JV2JpQThOQkFKNDg2d3Ezbm5vU09oRjNrS2pFcjhQYmo5bTk2N1ha?=
 =?utf-8?B?akRwdVhLRjNmUkxUMEhFZEo5WWNoWS8yRUFYYXZXYTZNVHlldjFaeHF4b0ZT?=
 =?utf-8?B?bGpNc0o3anFVMVBGMWtndDNsT2pIaDlxTE12Mzl1Y2dPVmJZN2ljajRMZkhx?=
 =?utf-8?B?SjA5M2srTGNwdm5Gcmg5ODBQRHJNSDY5V3ZZdWVDZFpzRjE4Q2JpSmFKNlMx?=
 =?utf-8?B?MVhIakkyeFI4R1FVaDdhV1J5dEozNTFrRUxKeStmeHJYYjIxT2pyK3dLeU4r?=
 =?utf-8?B?TUJ0RUhEdEh0Z25uYlRjQkdYa3c5KzdMVGh4NlhFeDRYZXdyaERzRkIraFF4?=
 =?utf-8?B?SnF3bXNFRkxKTjhib3dBaWxGOVVDamVMeWpmcjZtOGJ6Nkc0RlVPcUczenpt?=
 =?utf-8?B?ZCsrelpPS1AvU0V4ZkdidGk4b2tPbERvREJkZy83UUtqSmpoVldKcFZqVmpx?=
 =?utf-8?B?ZjIvU2hCYnJrMUJlTHBKcXFiSkkyR2JtamxhclIvTWtOb0JyT21MeFIzV1J2?=
 =?utf-8?B?MXNYamZHRmYxeXVSdkNCVmZ6OWRkVm56a2pTbEpOaUtlQ2xDL3c2ZVRvOTFv?=
 =?utf-8?B?d0J1ZDcxRk1UekcyRDVXUkRkaU5PYmg5M0xjSEdNamNKZnVjdWxGSzFtOEZq?=
 =?utf-8?B?NFNyWTJSRzBxMm5UbFRGS1NSc3ROVnk2SjdZcy9CRkhIL0l6VWhUMURqVUN4?=
 =?utf-8?B?NVlLdE9RaUtjYllSdDJRNEs4eGxBVW1CcHAyVWJjSHlLT3h2aFF1Q0I3NHZv?=
 =?utf-8?B?KzRWUTFEUkRCYXZQSU9SRW5ES2ZOWGt6c1hRVjRCZ2kwRXBtNjRTOHRBS0xI?=
 =?utf-8?B?ME1VQ3ROclBRT29WQW9BeUFMWmJFYU9rL3Z2bkd3ejZROWxLbDJQeWZYZlht?=
 =?utf-8?B?VW5sZFdaQ3dNZzE3KzhVUFdac0lWOE5EdGVLQT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:53:15.9189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fa99b7-090c-4c14-c96a-08ddebb203fd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7358
X-Proofpoint-GUID: gh2ntQaYLV6Q4VDrb3DQXheGi5zyFYd_
X-Proofpoint-ORIG-GUID: gh2ntQaYLV6Q4VDrb3DQXheGi5zyFYd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDIyMCBTYWx0ZWRfX0G2QMWU39J//
 vtD5XIPtVHDsvyUsVOC/OICWKy+mZ+89te5rKy8uOPbDKzcZExrkpbN+5R3BAxKJ7hkn3F3sZyW
 inRLOmxkLu7RAdNHqs35IU04U5K/FGU4Dy69kpYrFlhPDK8tIcCSlvaX+FvKPiRvXJ5w+XVcbde
 bHbfHHYSuciuJYPzdtcUC2YQzuicoqi7FaKkC8t19wKc0N/B9WCKQJUBnT9OZxr+C+jpr+/USCa
 M0/Wxwk06V83Zht9QS2ee9jXD+N8yftSAqWr5jlXikCRh6pee45asujEcv6fKNRGQUX+GEPvUZ2
 ookmZN/DWKHdQtasP6RLqPzSqNaGFnsU+3h6qeM4OtJXovYjdmCBU8ul/5AjKttIHgjeQqezUbj
 eAlXU07u
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68b98bbe cx=c_pps
 a=qHk899AXNzPTrpkaOO72ZA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=QntWg-Jy-EcA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=0ich2gbuCCvMhWHFW0wA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290220
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v3 5/7] video: stm32: ltdc: properly search
 the first available panel
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

Initially there was only one DSI bridge with one panel attached to this
device. This explained the call to uclass_first_device_err(UCLASS_PANEL,
...) which worked fine at the time.

Now that multiple bridges and panels, with different technologies, can
be plugged onto the board this way to get the panel device is outdated.

The lookup is done is two steps. First we circle through the
UCLASS_VIDEO_BRIDGE, and once we get one, we search through its
endpoints until we get a UCLASS_PANEL device available.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/video/stm32/stm32_ltdc.c | 136 +++++++++++++++++++++++++++++++++++----
 1 file changed, 125 insertions(+), 11 deletions(-)

diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index efe9a00996eca0301d2a2b82074ba9690a967a73..834bfb625d2d34a44bd8edff1c92af6dec344c20 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -17,6 +17,7 @@
 #include <video_bridge.h>
 #include <asm/io.h>
 #include <dm/device-internal.h>
+#include <dm/uclass-internal.h>
 #include <dm/device_compat.h>
 #include <linux/bitops.h>
 #include <linux/printk.h>
@@ -495,6 +496,101 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
 	setbits_le32(priv->regs + LTDC_L1CR, LXCR_LEN);
 }
 
+static int stm32_ltdc_get_remote_device(struct udevice *dev, ofnode ep_node,
+					enum uclass_id id, struct udevice **remote_dev)
+{
+	u32 remote_phandle;
+	ofnode remote;
+	int ret = 0;
+
+	ret = ofnode_read_u32(ep_node, "remote-endpoint", &remote_phandle);
+	if (ret) {
+		dev_err(dev, "%s(%s): Could not find remote-endpoint property\n",
+			__func__, dev_read_name(dev));
+		return ret;
+	}
+
+	remote = ofnode_get_by_phandle(remote_phandle);
+	if (!ofnode_valid(remote))
+		return -EINVAL;
+
+	while (ofnode_valid(remote)) {
+		remote = ofnode_get_parent(remote);
+		if (!ofnode_valid(remote)) {
+			dev_dbg(dev, "%s(%s): no uclass_id %d for remote-endpoint\n",
+				__func__, dev_read_name(dev), id);
+			continue;
+		}
+
+		ret = uclass_find_device_by_ofnode(id, remote, remote_dev);
+		if (*remote_dev && !ret) {
+			ret = uclass_get_device_by_ofnode(id, remote, remote_dev);
+			if (ret)
+				dev_dbg(dev, "%s(%s): failed to get remote device %s\n",
+					__func__, dev_read_name(dev), dev_read_name(*remote_dev));
+			break;
+		}
+	};
+
+	return ret;
+}
+
+static int stm32_ltdc_get_panel(struct udevice *dev, struct udevice **panel)
+{
+	ofnode ep_node, node, ports;
+	int ret = 0;
+
+	if (!dev)
+		return -EINVAL;
+
+	ports = ofnode_find_subnode(dev_ofnode(dev), "ports");
+	if (!ofnode_valid(ports)) {
+		dev_err(dev, "Remote bridge subnode\n");
+		return ret;
+	}
+
+	for (node = ofnode_first_subnode(ports);
+	     ofnode_valid(node);
+	     node = dev_read_next_subnode(node)) {
+		ep_node = ofnode_first_subnode(node);
+		if (!ofnode_valid(ep_node))
+			continue;
+
+		ret = stm32_ltdc_get_remote_device(dev, ep_node, UCLASS_PANEL, panel);
+	}
+
+	/* Sanity check, we can get out of the loop without having a clean ofnode */
+	if (!(*panel))
+		ret = -EINVAL;
+	else
+		if (!ofnode_valid(dev_ofnode(*panel)))
+			ret = -EINVAL;
+
+	return ret;
+}
+
+static int stm32_ltdc_display_init(struct udevice *dev, ofnode *ep_node,
+				   struct udevice **panel, struct udevice **bridge)
+{
+	int ret;
+
+	if (*panel)
+		return -EINVAL;
+
+	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
+		ret = stm32_ltdc_get_remote_device(dev, *ep_node, UCLASS_VIDEO_BRIDGE, bridge);
+		if (ret)
+			return ret;
+
+		ret = stm32_ltdc_get_panel(*bridge, panel);
+	} else {
+		/* no bridge, search a panel from display controller node */
+		ret = stm32_ltdc_get_remote_device(dev, *ep_node, UCLASS_PANEL, panel);
+	}
+
+	return ret;
+}
+
 #if IS_ENABLED(CONFIG_TARGET_STM32F469_DISCOVERY)
 static int stm32_ltdc_alloc_fb(struct udevice *dev)
 {
@@ -532,6 +628,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	struct display_timing timings;
 	struct clk pclk, bclk;
 	struct reset_ctl rst;
+	ofnode node, port;
 	ulong rate;
 	int ret;
 
@@ -568,7 +665,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	}
 
 	priv->hw_version = readl(priv->regs + LTDC_IDR);
-	debug("%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
+	dev_dbg(dev, "%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
 
 	switch (priv->hw_version) {
 	case HWVER_10200:
@@ -589,13 +686,35 @@ static int stm32_ltdc_probe(struct udevice *dev)
 		return -ENODEV;
 	}
 
-	ret = uclass_first_device_err(UCLASS_PANEL, &panel);
-	if (ret) {
-		if (ret != -ENODEV)
-			dev_err(dev, "panel device error %d\n", ret);
-		return ret;
+	/*
+	 * Try all the ports until one working.
+	 *
+	 * This is done in two times. First is checks for the
+	 * UCLASS_VIDEO_BRIDGE available, and then for this bridge
+	 * it scans for a UCLASS_PANEL.
+	 */
+
+	port = dev_read_subnode(dev, "port");
+	if (!ofnode_valid(port)) {
+		dev_err(dev, "%s(%s): 'port' subnode not found\n",
+			__func__, dev_read_name(dev));
+		return -EINVAL;
 	}
 
+	for (node = ofnode_first_subnode(port);
+	     ofnode_valid(node);
+	     node = dev_read_next_subnode(node)) {
+		ret = stm32_ltdc_display_init(dev, &node, &panel, &bridge);
+		if (ret)
+			dev_dbg(dev, "Device failed ret=%d\n", ret);
+		else
+			break;
+	}
+
+	/* Sanity check */
+	if (ret)
+		return ret;
+
 	ret = panel_get_display_timing(panel, &timings);
 	if (ret) {
 		ret = ofnode_decode_display_timing(dev_ofnode(panel),
@@ -624,11 +743,6 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	reset_deassert(&rst);
 
 	if (IS_ENABLED(CONFIG_VIDEO_BRIDGE)) {
-		ret = uclass_get_device(UCLASS_VIDEO_BRIDGE, 0, &bridge);
-		if (ret)
-			dev_dbg(dev,
-				"No video bridge, or no backlight on bridge\n");
-
 		if (bridge) {
 			ret = video_bridge_attach(bridge);
 			if (ret) {

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
