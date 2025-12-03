Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE3C9F3B5
	for <lists+uboot-stm32@lfdr.de>; Wed, 03 Dec 2025 15:07:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BE10C5C842;
	Wed,  3 Dec 2025 14:07:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E231C5A4E0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Dec 2025 14:07:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B3Dt3Mr1916044; Wed, 3 Dec 2025 15:06:01 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4asrmvxw44-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 03 Dec 2025 15:06:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eecNoYBzuxjoD8NshwePuMg8q2NpLvwdVoIXwNSzt6Mo/FKza8VG1yh9ZngAn9iCO6fGpshGfrrqG13zxxqDB3QfH7XItFXJfnAfpmDpPer08UDrKge2IjGnRgcelbPfMRc0ZHnaClUbw/tKnZcz7TdDdXkHchVeTdXxk1MXrMQ3loML0gYIkNAjVmrYiDFR1R//kz0cKcrurX5i7vnpEVkYfoBF34Rnlv4SiF9tLsnt8lDuK22sneXTuyoczKNNuUDupzrOZjpLaRGfAT4c7S8h/MBOau2XY0fkidy2Uxuj0gZ0niSxBCjbwfWn7VeWhKz1RnZ8l/jjqpVRFr3DFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yji/PstSVP9Nl6O7ft+wU0tqgHm6xeiWPM1fdcMWcDI=;
 b=cDCVTXeWdyPD+P1Qpyvp70fa+91Xbx42EN2N+9CIjGm6o1/Zo5SC+JyNWlkQ0Km3b/yV2GCRiTERTvwKBtSXv96C0IcciK9K7Kcsp5m/4SsFBBMRoijzdONYP43o/79gAMhy0hYqRqAjZQDYcv8lyxiOf9EjVyCT9WxPEjUkARArjbzGBBeljnE6j/Ji3Wr1U2z75qVsmEgs2vRRdTpVP/eNxRph5SxEX9XwkK4/t87S0ZGr2UZNN6GbYQ/WrOUsaf54j1QTHqS3jrmMxuSE5DFjvOZ1vh0ZehlHsS4Ru+zUEFVPtoPWfU6xSF4vriAgbF+SJ5XrCm1cMKElJPCNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yji/PstSVP9Nl6O7ft+wU0tqgHm6xeiWPM1fdcMWcDI=;
 b=EGM93FR2G+/4GidTnbmHzTGrbPpCjXmDnjALF4WL2p7j7+AbG4+0Kd7+z57ahwEb0VGW5G8GlM24Py52gkNQvxXm1tZQGIDA843EVDfjJHx1LeScxb+WAHlHznqT5IEFUuNRjTqFpU9Pe/MJYjYXCI33CsX4J8vt2zkmkdpep4nOHOSWs+pvojhsi7zQScpymD8F1UXxUk3d6ct8aFulBXJkB5OiowOP/2Lxv0VMPqYIQcGv0KIgNo01exH26ZIBOk0WS6Rkt/FvmdOGUpZx1LX1LOD4O34Ul1JV4DxsD/N2rXDazNZo0qgCYbIZDFxZjE3NoT0CnjF+NAP51kGPKA==
Received: from DU2PR04CA0337.eurprd04.prod.outlook.com (2603:10a6:10:2b4::35)
 by DU4PR10MB8542.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:566::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:05:58 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::85) by DU2PR04CA0337.outlook.office365.com
 (2603:10a6:10:2b4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 14:05:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 14:05:57 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:06:34 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 15:05:56 +0100
Message-ID: <4ecb9533-1def-44bb-9401-d1cc2cb52e7e@foss.st.com>
Date: Wed, 3 Dec 2025 15:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
 <20251114154259.4035206-3-patrice.chotard@foss.st.com>
 <4a71038b-ce5b-4119-9493-4e33642a8528@mailbox.org>
 <71047e69-164e-4c65-9eb7-587de4f147ff@foss.st.com>
 <d90e6eca-2b3d-4274-8738-b2eb49f1e722@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <d90e6eca-2b3d-4274-8738-b2eb49f1e722@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|DU4PR10MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: e885c725-aabc-462c-2e29-08de3275152c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T24zT0puRFVub1NhWFg5STJQeUpsanpuTTFJZGFReWgxY0VnV1Y4elVzZ1NM?=
 =?utf-8?B?REpXTXZwNk1BRmREVzYvNWkvanNpeUZEMStxVDZDcHA3cHRCek93V0pvMzFW?=
 =?utf-8?B?cXpLNDV6WWdyajFxL0dnUHR0Q2Z5cklaQkZwcTBnMEVxTXF1TU1LbnZwYXdh?=
 =?utf-8?B?clAxeGhMZENyMWNMamUxWXYwNmpZMXN2WFNTbXEvL2paNDA4WEo5YlRyR012?=
 =?utf-8?B?L1NNaE9VNVMzcDlEUEQrN2pzZUt2WFNkeGdTTTdhQnlyUE9YckdZSG9CazFl?=
 =?utf-8?B?S1kvSnZSZlljcyt4VHJGODZHdzNhaDNrditmd0NhVVJNc05FMzZnd092cVU4?=
 =?utf-8?B?V296RlRYUmdyN1ZCTjhZaE1Jamx3eWNnVEg1bkpFSTNuUDZzRzVzWTVSeDA2?=
 =?utf-8?B?TURQbVNXQjFpQzV5SndKajIzaVZvdnVzMzV0MFhzbHFBU1FBK2xpMDN2eW5j?=
 =?utf-8?B?emRCMEFyK1lWM1ZYVHVIb2FmK01vRFZWdDM5aUtzcmg4MWVkQ0FHWUNCQTRr?=
 =?utf-8?B?NEV3L1BzT2NNRnRNaHMrQ0tOYm5qWjhkaEljTDk3RDdqWFlDT3ZCWGtWV1BV?=
 =?utf-8?B?ZzRzNmRYSjQ5dkV4TFRjRnJ6a3YzVFdwa3J1aS9yalEyejRoSW1OK1lqbCsw?=
 =?utf-8?B?cit4RS9EOFlaOVg2TUZyeWRtMCtaWW1YbnkyRUxTTDIzVGlCV2dmS0xrSE9V?=
 =?utf-8?B?dnhuUEZjc0s1YlB3Qm4xT2M3V2w4aDJSUjZWSmd5QzJhRkZEK1pDWVR6UUJE?=
 =?utf-8?B?MzViRnZuQjkxSE96c3lhcFgrSlNnWEFndWtKVlh2aGJuSDBYUWtPemlhUnhI?=
 =?utf-8?B?Y3lRdlMyQi9ZMEh3dUtVZWxvd2d0amEweG9wa29MbXdUcis2NmplTklZMnJH?=
 =?utf-8?B?dksySHFtNVhPMGZteUt3V09XWDRhRVJFa0hqMWRPSUtza2VrWE5LS1pyeHA0?=
 =?utf-8?B?Ti82TXpreEJZUHo5MkdvYTR6b2ZhMVcxRWZPMjU1QmRWbDZxV1dVcWxjRGhD?=
 =?utf-8?B?c1dmdi9JSWtZTnNYZDJQZVhsZGZ0WlRyRmtnQTlEbDJOMmNna3ZSMlcyKzgv?=
 =?utf-8?B?S1BFZWNPWkVQVWRuQmF6VTVCMWhzS0RuTW1EQzdlSkE5Q0QxNXlmZzFURWhB?=
 =?utf-8?B?WXRVa1dYM3dkYytveUtOQzQzMWtXdElNNFUySmkxcDRSZ2NZcG1JbnFLRW83?=
 =?utf-8?B?SUs0MzBVMHY2YnltZWtMU1lLNkF3QXQvL3pKcENHTWF5OWN6dXFJZENpYnk0?=
 =?utf-8?B?SVpiYmNiVGwwNmpGK211bDZTeEl3bTVYWm1WWCtsV2hUWDRDM2F6TU5MNXhS?=
 =?utf-8?B?TVNYekY3V0t1OFdnaDVvZUYwcEprckxuVHoyWjQ1RHpsL2UzRHEvUmYwUndS?=
 =?utf-8?B?VHJLbmtnVEo3eXl4bjJveTFTb0tsRlRtS1VhL3BRdGpuL1NodXJwK0RsOU93?=
 =?utf-8?B?Mmg2TWJzWHRJcFlsT1NHd2QxK0RSMURMUFRrazVFd2J3Yndjck9TaE4vOVUr?=
 =?utf-8?B?WHdZTjhqaWtaQlJqaXIzbnM1T0dSemYzYXdVb0hNdDA0Q2Erais3UXY2OWdL?=
 =?utf-8?B?eTlaRHphOW1ncVgyN2lvQzJFOXBIRFF6cDUxblJSS2lydUhtUkZlc3dKd0RP?=
 =?utf-8?B?aWh1RS9reTVqYno5QzVncEdQZnZiQzd2K2lhZ2FHOGo0UVRZUXpMNU84ZDhU?=
 =?utf-8?B?ZFQ4bGRRQUVDZHBMWXN5M3Z6Qk9KYXVDY3BaSVMrRlcrZTJuMkNBbnZRSjBv?=
 =?utf-8?B?bnJXQVJRZ2IxQ3pvNzBtRG43aHVLL3FheTVBci9xZ0srWWdJY2lRbDZkbDlP?=
 =?utf-8?B?QjV3OGhXK0N1a21ObVVXWXNKTDFsU3JTNE9xZnMxbERMa3dtNXpYME9OY2Yw?=
 =?utf-8?B?amZ4TC9LUWRGWkhMeThZMGorV2p5d3B5R0F3WVBXa0MvaVpJNk5TUVE1N0hK?=
 =?utf-8?B?dXF5Nk1qa2ZkTFQrS1lOZG0zRWx2RjlrcUFndTBpT3dVNkYxb1RkTURYQ1du?=
 =?utf-8?B?NWc0eHRaalBmRlkrSWt6bGIwRlhVeTNtdldQMWhXQXVHcFZmOC9qQkxWNm5S?=
 =?utf-8?B?dzNPN3pGMHRmSTJhbXdDMFlwVjdkblFIK0NjZ3F5V2dwb1E4Sm9qMlJvTWdo?=
 =?utf-8?Q?KpYY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:05:57.9797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e885c725-aabc-462c-2e29-08de3275152c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8542
X-Authority-Analysis: v=2.4 cv=e8YLiKp/ c=1 sm=1 tr=0 ts=693043c9 cx=c_pps
 a=QwrbhXh03MhuZ2mRWfjA2w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wZF5xgHrhGkYw9plCIAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0OlS7QaojibFqLQ1vxM5tng_dJr_XiYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExMiBTYWx0ZWRfX8Fb1XHFq+EcB
 ox4dQt7zhMoLrjWvLnqO4keH3CmTfsB59jeWT5xv0Bh1uSJWffE468KWd6oawMSs5IHmhv4vLNd
 CqTrb/CNcePXl/DtxOBMT1dPcEcXCuueNv9+fPDFPSRofEwX54VOUpYbmWTXs8qk4dXTeIAvjtf
 W92fl1xRWL2xbt5FT0utA+VAjo/u/n2qSFhn7WKouQPkYBnp8K461LxceYEFIzCalh6yGcWhLbV
 PQcGVFIhWna+s0KG5DfrXdtxcZwQKWv/Tgv4exFvzJNQERsXdjctIW9Cz29rRtWdT+jdySUQ47G
 7ynhyV0/i7A+cI4Yj/NDrb5tT8qDWR/Q9YRJkaENCgTM5oEjYt6ua3uA5R1gN5SRtYBH/mCVl8X
 66qH7eeiEumEtOjDQ58tY/20FrzmkA==
X-Proofpoint-GUID: 0OlS7QaojibFqLQ1vxM5tng_dJr_XiYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030112
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Leo Yu-Chi
 Liang <ycliang@andestech.com>, Vinh
 Nguyen <vinh.nguyen.xz@renesas.com>, Alice Guo <alice.guo@nxp.com>,
 Kamlesh Gurudasani <kamlesh@ti.com>,
 Casey Connolly <casey.connolly@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 "u-boot@dh-electronics.com" <u-boot@dh-electronics.com>,
 Michal Simek <michal.simek@amd.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [Uboot-stm32] [PATCH 2/6] clk: scmi: Force call of
 scmi_clk_get_attribute() during probe
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

CgpPbiAxMS8yMC8yNSAyMTozOCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTEvMTcvMjUgNToz
NiBQTSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IEhlbGxvIFBhdHJpY2UsCj4gCj4+IE9u
IDExLzE1LzI1IDAwOjA4LCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDExLzE0LzI1IDQ6NDEg
UE0sIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4+PiBTaW5jZSBjb21taXQgZmRiMWJmZmUyODI3
ICgiY2xrOiBzY21pOiBQb3N0cG9uZSBjbG9jayBuYW1lIHJlc29sdXRpb24iKSwKPj4+PiBhbGwg
Y2xvY2tzIHdoaWNoIGFyZSBwYXJlbnQgY2xvY2tzIGFyZSBuYW1lICJzY21pLSV6dSIgd2hpY2gK
Pj4+PiBsZWFkcyB0byBlcnJvciBkdXJpbmcgdGhlaXIgY2hpbGRyZW4gY2xvY2tzIHJlZ2lzdHJh
dGlvbi4KPj4+Pgo+Pj4+IEluIG9yZGVyIHRvIG5vdCBjYW5jZWwgYm9vdCB0aW1lIG9wdGltaXph
dGlvbiBkb25lIGluCj4+Pj4gY29tbWl0IDM1NDdlMzE1YzE4OCAoImNsazogc2NtaTogRGVmZXIg
aXNzdWUgb2YgU0NNSV9DTE9DS19BVFRSSUJVVEVTIiksCj4+Pj4gY2hvaWNlIGhhcyBiZWVuIGRv
bmUgdG8gcmUtaW50cm9kdWNlIHNjbWlfY2xrX2dldF9hdHRyaWJ1dGUoKSBjYWxsCj4+Pj4gZHVy
aW5nIHNjbWlfY2xrX3Byb2JlKCkgdW5kZXIgbmV3IENMS19TQ01JX0ZPUkNFX0FUVFJJQlVURSBm
bGFnLgo+Pj4+Cj4+Pj4gVGhpcyByZXN0b3JlcyBib290IG9uIHN0bTMybXAxMyBhbmQgc3RtMzJt
cDIgZmFtaWx5IGJvYXJkcy4KPj4+Pgo+Pj4+IEZpeGVzOiBmZGIxYmZmZTI4MjcgKCJjbGs6IHNj
bWk6IFBvc3Rwb25lIGNsb2NrIG5hbWUgcmVzb2x1dGlvbiIpCj4+PiBTQ01JIHNwZWMgc2F5cyB0
aGF0IGNsb2NrIElEcyBoYXZlIHRvIGJlIG1vbm90b25pYyBhbmQgaW5jcmVtZW50aW5nLCB3aXRo
b3V0IGdhcHMgLiBUaGlzIGRyaXZlciByZWdpc3RlcnMgYWxsIFNDTUkgY2xvY2sgZm9yIHlvdSBl
eGFjdGx5IHRoaXMgd2F5LiBXaGF0IGV4YWN0bHkgaXMgdGhlIHByb2JsZW0gb24gU1RNMzIgPyBB
cmUgeW91IG1heWJlIG1pc3Npbmcgc29tZSByZXBhcmVudGluZyBzb21ld2hlcmUgZWxzZSA/IE1h
eWJlIHRoZSBjbG9jayBwYXJlbnQgcmVzb2x1dGlvbiBzaG91bGQgaGFwcGVuIHdoZW4gdGhlIGNs
b2NrIGFyZSBmaXJzdCB1c2VkLCBqdXN0IGxpa2UgYXR0cmlidXRlcyBhcmUgbm93IHJlc29sdmVk
IHdoZW4gdGhlIGNsb2NrIGFyZSBmaXJzdCB1c2VkID8KPj4KPj4gSGkgTWFyZWsKPj4KPj4gSW5p
dGlhbGx5LCBvbiBTVE0zMiB3ZSBmaXJzdCByZWdpc3RlcmVkIFNDTUkgY2xvY2tzIHdpdGggdGhl
aXIgcmVhbCBuYW1lcyBhbmQgdGhlbiB3ZSByZWdpc3RlcmVkIGFsbCBSQ0MgY2xvY2tzCj4+IGlu
IHN0bTMyX3JjY19pbml0KCkuIEZvciBtb3N0IG9mIHRoZXNlIGxhdHRlciBjbG9ja3MsIHRoZWly
IHBhcmVudCBhcmUgU0NNSSBjbG9ja3MuCj4+Cj4+IEFmdGVyIGNvbW1pdCBmZGIxYmZmZTI4Mjcg
KCJjbGs6IHNjbWk6IFBvc3Rwb25lIGNsb2NrIG5hbWUgcmVzb2x1dGlvbiIpLCB0aGUgbmFtZSBv
ZiB0aGVzZSBTQ01JICJwYXJlbnQiIGNsb2Nrcwo+PiBiZWNhbWVzICJzY21pLSV6dSIgd2hpY2gg
bWFrZXMgY2xrX3JlZ2lzdGVyKCkgZmFpbGVkIGFzIHdlIHN0aWxsIHRyeSB0byByZWdpc3RlciBS
Q0MgY2xvY2tzIHVzaW5nIHRoZWlyIHBhcmVudCdzICJyZWFsIG5hbWVzIi4KPj4KPj4gRm9yIGV4
YW1wbGU6IGZvciBTVE0zMk1QMTMsIGNsb2NrICJja19oc2UiIGJlY2FtZXMgInNjbWktMCIsIHNv
IGFsbCBjbG9ja3Mgd2hpY2ggYXJlICJja19oc2UiJ3MgY2hpbGQgY2FuJ3QgYmUgcmVnaXN0ZXJl
ZC4KPiAKPiBJIGRvbid0IHRoaW5rIGFueSBjbG9jayBkcml2ZXIgY2FuIGRlcGVuZCBvbiBTQ01J
IGNsb2NrIHNob3J0bmFtZXMgZm9yIGNsb2NrIGxvb2sgdXAsIGJlY2F1c2UgdGhlIFNDTUkgY2xv
Y2sgc2hvcnRuYW1lcyBhcmUgYW4gb3B0aW9uYWwgaGludC4KPiAKPiBJbnN0ZWFkLCBpZiBzb21l
IGNsb2NrIHJlZ2lzdGVyZWQgaW4gdGhpcyBSQ0MgZHJpdmVyIGhhdmUgU0NNSSBwYXJlbnQgY2xv
Y2ssIHRob3NlIFNDTUkgcGFyZW50IGNsb2NrIGhhdmUgdG8gYmUgcmVmZXJyZWQgdG8gYnkgU0NN
SSBjbG9jayB1ZGV2aWNlIGFuZCBtYXRjaGluZyBjbG9jayBpZGVudGlmaWVyIChpbiB0aGlzIGNh
c2UsIEkgYXNzdW1lIHRoYXQgd291bGQgYmUgU0NNSSBjbG9jayBJRCkuCj4gCj4gVGhlIHJlbGF0
aW9uc2hpcCBiZXR3ZWVuIHRoaXMgUkNDIGNsb2NrIGFuZCBTQ01JIHBhcmVudCBjbG9jayBjYW4g
bGlrZWx5IGJlIGRlc2NyaWJlZCBpbiBEVCB1c2luZyAnY2xvY2tzID0gPCZzY21pX2NsayBOPicg
LCB3aGljaCB5b3UgYWxyZWFkeSBoYXZlIGluIHN0bTMybXAxMzEuZHRzaToKPiAKPiDCoDc4OMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1l
cyA9ICJoc2UiLCAiaHNpIiwgImNzaSIsICJsc2UiLCAibHNpIjsKPiDCoDc4OcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JnNjbWlfY2xr
IENLX1NDTUlfSFNFPiwKPiDCoDc5MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnNjbWlfY2xrIENLX1NDTUlfSFNJPiwK
PiDCoDc5McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA8JnNjbWlfY2xrIENLX1NDTUlfQ1NJPiwKPiDCoDc5MsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8JnNjbWlfY2xrIENLX1NDTUlfTFNFPiwKPiDCoDc5M8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnNjbWlfY2xrIENL
X1NDTUlfTFNJPjsKPiAKPiBDYW4geW91IHVzZSB0aGF0IGZvciB0aGUgcGFyZW50IGxvb2t1cCBh
bmQgc2ltcGx5IGlnbm9yZSB0aGUgc2hvcnRuYW1lcz8KCkhpIE1hcmVrCgpJIHJld29ya2VkIGRy
aXZlcnMvY2xrL2Nsay1zdG0zMi1jb3JlLmMsIGNsay1zdG0zMm1wMTMuYyBhbmQgY2xrLXN0bTMy
bXAyNS5jIGFuZCBmb3VuZCAKb25lIGFkZGl0aW9uYWwgaXNzdWUgaW4gZHJpdmVycy9jbGsvY2xr
X3NjbWkuYy4KClRoZSBzZXJpZSB3aWxsIGJlIHNvb24gc3VibWl0dGVkIG9uIG1haWxpbmcgbGlz
dC4KClRoYW5rcwpQYXRyaWNlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
