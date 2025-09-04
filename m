Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F7B43C1E
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 14:53:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1A59C3FAD1;
	Thu,  4 Sep 2025 12:53:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1DC0C3FAD2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:53:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584CPhOs022554;
 Thu, 4 Sep 2025 14:53:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Z2CCGkKdY4IOjID8SGwzGqSZRJGakY9/2i4YBlVSG00=; b=5xdGX8Fm7OOol1oW
 o5tWlJbnVsAcLsEDx4eQY1TIKA+XoScl6Ha5dLI+beEsDwNdKU07tmNhjsu35EoE
 YKVUokQC1Xfq5SbVnvyvlnnBaVV6XUDIQxYAyXNqY8USMyeSzVW3poWstGthWwR3
 VKbaB2iph4aU/VWtvbtEiYa6bZLAktnFlX0fvpq2IfRjkvvdRqOpoBNrIPqcBR69
 Ut2b4WKGuMjBzC463NCJ9tJG7fv5vw1+hrzvIgb3JIMpYWIOD4AqSGueinMzpdX7
 YsvBXewqGfpU2ISPFuG1Jmzm4JM7q/V7ZqyvUOy/NroySV0V/UY/knN5CtZ8Tnm9
 LMQPTA==
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7nj64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 14:53:18 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7pKYc0c1SGfyw5Uom8rnKTLErySduJgFeQMeZ4W2t+2UAHqzXnelpwHXYQZy/ZWhH9n35JAKy/JO/Qc27kI4eF4hkM66x/Ix9g44nElL/y7ISPhEGxc5qjbCoa3zsg2/L5HzZkxJQKGhzCS4f7WXTSDx7mrieVtpm99UWm5v/LbycqZU1kNP2LbukIU3GlnkCdsbZ699OSaab4TlWCCemhVmOZ/4ViLsQlCi3lVAbXS8Iq5mI9z6HwGg333fI8yU8PWtzruxKLl5bL8h3sqaYGs6MIn42qgs1eU2tl55ECeWHVEnPSsn93W+zbNT8Sc6egbasD1Xl6CicTfDHRqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2CCGkKdY4IOjID8SGwzGqSZRJGakY9/2i4YBlVSG00=;
 b=GiQtS4FuI/uaeJvXZi9SI5/iVs3+XqiR6ntP8XAUhNOASJVr7AwF3Bj0dh2EfQeXb/am0jWJ34UieRdDEOGG253DaxSGvDfoTcDT6TE8KqkIJqWkNEZ51muiE9SeXm7K0uH2sogJlC27Wy/J9kOklD+3LbCO3BOnlvcGXoxoUxWJM+5wuSjr/kuzKIJsp9lsGZMWKx1zEuBzALAQ88Ha7suI59rmdPNX/42piuama4/mUUV0PvF5k5u8YnOUCXiTcdCoNdxsVQCqLM5SZcW1GNjVdnS+5cIVMs0OVapDLWq55Leg2Y6h12s1B6Kb13rhrnb1pGfKz7tztJUh1b2ONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2CCGkKdY4IOjID8SGwzGqSZRJGakY9/2i4YBlVSG00=;
 b=jZ8fMCkD3vvu3oCKHVLZA8Lmy6QO71K4I06OTdAI+Vh7lJDGDCpkOEiKfLJbJRG9oXXXUNPEBvgvjq2F8PD6xw0IOq10C4PlTpESuH9zn3PMgcMMpED85C6julgL9r/Nf+sGGMLqmdmq/4auVAXiSYwuo45Vi6NOUn8opg1fSs4=
Received: from AS9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::16)
 by GV1PR10MB5818.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 12:53:12 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:532:cafe::ef) by AS9P250CA0017.outlook.office365.com
 (2603:10a6:20b:532::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:53:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.0 via Frontend Transport; Thu, 4 Sep 2025 12:53:12 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:45:58 +0200
Received: from localhost (10.252.28.189) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:53:11 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 4 Sep 2025 14:53:05 +0200
MIME-Version: 1.0
Message-ID: <20250904-master-v3-1-b42847884974@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|GV1PR10MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6c7d2b-907e-4909-7f9c-08ddebb201c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VllIV1ZibDd1cm4wWnpLSytURmNDNFFhVXROZlJONmdDZDdmRGY4ZWNaaS9I?=
 =?utf-8?B?d056RGphQnFNVzdhTFdsWHljVXFSZzBnLzlwMkk4clNPMFZuOEVSMXRlcGoz?=
 =?utf-8?B?b3RKMDdOa3JIQmlXdTVObTJueDJIZ2dKOEROdjJ4OHNiQ09mV08xSW93TG1i?=
 =?utf-8?B?S09SV3FmUE14TXRwSFFER2N4a1FIdTk4ZlEvRWlZOS9KaXpYWWJzRTNmRk5v?=
 =?utf-8?B?S2pJQjBLelZ4THFLbCtUa3pwcDFLK3dLS1pQV29IUHhmSjlUNGRoRzAvQnAw?=
 =?utf-8?B?alRjVDNGM0s0SkJnVkppZVBRVk5yejBqTXY3QktJMEFnTk95bng0RFVpVThX?=
 =?utf-8?B?Z2xqbmJqdXN5WEZXK0ZuazVtNnVia0ZwU2ZkcEFyU2dNSDMyYkpYcnJ1RVRF?=
 =?utf-8?B?YjhwaHc5OG9vSWcvYWdXNVBTV0U1Qzl2L2dpN2hQbzdKbk50emdPMWFKTVI0?=
 =?utf-8?B?SjVIVFZ5SFZYT21yVzk3eXZxRU9RZ3J0enluOUhXaE5RbFNLU1MzcnkzTFhW?=
 =?utf-8?B?cDlQVndSaHNQZi9Jc1ZOSmVvL2lrb0ZlNHJnVmMxZDdCZDZEcmo4ZXpWaUJq?=
 =?utf-8?B?MDZMYTJXR3lqK0ZVQUhBcmJOZ3BqbFpBTmFpUzhRb0RBRkRqSGNsMlVkU2Zk?=
 =?utf-8?B?L1lrWmZoS3V5VXcxcVAwN1c0N0ZNSnU4bnZud2JneDRqcm90Y1NhV3Q4VFZv?=
 =?utf-8?B?NEIyVTRmU21KNW9vU0tYRzMzd3hJaHpsNkF1Zk4yVEV5VEt6bVM5RDNIRjFP?=
 =?utf-8?B?d25xeDY5RmEvbXFLekI3S2MvWERTdmVuZ3JjMHJ2SFAwTW1ydno0THF6MVhY?=
 =?utf-8?B?QTd5elZWRkRPVHZvcE42SjVDVXRiUEpzNzVldmg0a2hoeHFnSnlQT3ozR0JM?=
 =?utf-8?B?Wkx2TDA1Tkw5MDFQNUNOTXR1RGl5cmtpYXR6bFV1YnMrRE5CQ1luZU5DN1FO?=
 =?utf-8?B?V01pSjk4SVgzaHRmMnZBbjlRRHpjbGRuWDd6WnVJQTlrTTFXMkUvM1FZQ1Jt?=
 =?utf-8?B?SGZkRUdZQ24xMXk0NndubFpNS2c5bUk4b2pqTWtTbFdVYzBKS2FZRGtydFQ4?=
 =?utf-8?B?TmFIMmJpWlVDUnpvUlVEWE1EUW1SZkt6U1NzREFPc0NUM2tjR1d0VWlXbmNM?=
 =?utf-8?B?eHV3SzhZMjdmTVJIMjUvTWJmS1lHaXdpcDUyK00yQWJIWVhYYnN2aWl1c281?=
 =?utf-8?B?MTRJR3pCNjY1TmEzQlgyaVdmTU1MeWpKV2owUW5UOEtsMFBoYitxVmxiV3VN?=
 =?utf-8?B?b1BxMGhTYnJSUThLM2ZxTmpnQ2FsbUN3dU8wcjU4QWpiRHU4ZXhWd2hvaTZq?=
 =?utf-8?B?bGJyditPS0JuYmIyOTZyR3dtemwwVEF2alVtWGRiZzFEOC82S0N6Ry9VTnBz?=
 =?utf-8?B?bld2TnRaOCsvaEVFdDVTcDRQQVUzVTNPQTRsZ2t2SHg0eEhsRHlaMTlMMGV3?=
 =?utf-8?B?ZC8rNmxlemtZcStWTTBkcmx6bDBlK05NVTRFL1VFbmU3aTNBcUFUWnlDcDhH?=
 =?utf-8?B?YU5rQThvZkVBaW5pUG9wZGpIRXNCbXkyVHloTVdiUGhOdnlQNlJHdjFHUG5j?=
 =?utf-8?B?UVVvSFNmcXZUbzlsM1NMSEo2OHpWdmU0Z0s3YmorREwxSCt6ZCtxMWJaUENn?=
 =?utf-8?B?YUNYRVRJUFRIWjNsK2ZQUzIrd1F6YU9QOFZZTWtKYmxJVkpDYkxpNk1jMUc0?=
 =?utf-8?B?aWlRZkVTQ2tMQmNOM0grc1lXYllYcTNEUW0zZ3lTNzFQd0JxRzEyRFZPSTN6?=
 =?utf-8?B?TTJmaEtXTXVndEE2Y056eDJoS1E4d29qbktCM3Z0QVlRR2R4QStLZVdTLzMx?=
 =?utf-8?B?ZGF6YzFsSDlZeEdvVEN6SnhVTlhMOFZnQllZaTh1NmdpcnJteFBYZkYySGFW?=
 =?utf-8?B?ZE9hZ1JBb3FYNkdZWkk3dGZSUk1WMHZzaGFaREJDR0IvZE9YV1BGMTlRcnds?=
 =?utf-8?B?cUZSL2k2TXh4SFVwaTZJY3EwQjlhbUhaZGliSlpTM25tL2UzSkZQcllnV01M?=
 =?utf-8?B?WnRVbE4vblBJR1lUdzhIUm5MTlVlYVo3N1RNSmRkR2pMZkFqSmxVYjhRZFQx?=
 =?utf-8?B?OXNrSFNZWEEwUElMeTlva0lidExPeER5YU4vdz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:53:12.1652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6c7d2b-907e-4909-7f9c-08ddebb201c0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5818
X-Proofpoint-GUID: UbGCeeGbEBydbzD37fBHk0Sk59-BbDiZ
X-Proofpoint-ORIG-GUID: UbGCeeGbEBydbzD37fBHk0Sk59-BbDiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDIyMCBTYWx0ZWRfXzulTec2/rqvp
 NeXex60G9d3dNshUatZ2/MWHZa633M2bcyPgMZG7gmBELDuRwk/aNlc17uBtsjkOwS84vyU6upI
 VLt33AyrNtgMuTGaC+tVKj3VlPJEwFoX2HaNH6OQ5f1f9jUzkJ8lwihXja5qBEQznw8xFBDkRyn
 3WQsp8ZKG40zBV3vATfbdw6YYvjoRM8RC1UnfgmLzDvuhlENN+tZSuZubooahhd47U9BywmXPNX
 cmucUEchVW8DzMfyQgTJ5rZRPxlE758KKgzD/Ee4g0BCvILdSEAhvqGWCpbjjglNPUF8Z0+jo8y
 cu/5PxLAYNV4fmRTde0k7RhFpTljj+q6OqGQDP65XkKcW4Wxjo7tlzPNKugH24x12tbSIi0qbhK
 GiuDUkcq
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68b98bbe cx=c_pps
 a=hhoE5sGcTqdYlWoqLqUH9Q==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=QntWg-Jy-EcA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=Fcc0CzzUnuKL4wjLmeoA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
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
Subject: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
 ofnode_decode_display_timing
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

The "Display Timings" in panel-common.yaml can be provided by 2 properties
- panel-timing: when display panels are restricted to a single resolution
                the "panel-timing" node expresses the required timings.
- display-timings: several resolutions with different timings are supported
                   with several timing subnode of "display-timings" node

This patch update the parsing function to handle this 2 possibility
when index = 0.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/core/ofnode.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
index e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3214e7bd437739776362c2d22a3c9 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofnode parent, int index,
 	int ret = 0;
 
 	timings = ofnode_find_subnode(parent, "display-timings");
-	if (!ofnode_valid(timings))
-		return -EINVAL;
-
-	i = 0;
-	ofnode_for_each_subnode(node, timings) {
-		if (i++ == index)
-			break;
+	if (ofnode_valid(timings)) {
+		i = 0;
+		ofnode_for_each_subnode(node, timings) {
+			if (i++ == index)
+				break;
+		}
+	} else {
+		if (index != 0)
+			return -EINVAL;
+		node = ofnode_find_subnode(parent, "panel-timing");
 	}
 
 	if (!ofnode_valid(node))

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
