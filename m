Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D704B80634
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Sep 2025 17:10:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EE6EC3F954;
	Wed, 17 Sep 2025 15:10:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0890AC3F93C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:10:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HF6NHg012826;
 Wed, 17 Sep 2025 17:10:19 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxkvbqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Sep 2025 17:10:18 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjaRQyWq+MRwgBUSmeM4Vf4Bp4Y5vEl9jqSsqkhvoM8+OCrV2YnPRAsor+x26C+5cQnToYz1Hg5XX0KMmQC4ugLLU0p1b9CLj72I2fNrv+TBvvHskC+gEaLATWbWelkz+q8aK8yIBAcnDiO9HoF2AdSmfkVEWJ6dhbJ8nZvI7ULwukyLG61/25Uy1JfG8+7ymnrJXkD+h/AnW1SZXXQVSynpqzLI9Rbjs1O87QCb9O0T7jhPzc2/R1CVY9o8G4PJBph1/Zn6InkQZ0WhxRMshXaUz2XzQzosuvXdxGnmbvBXDH96Dfpxm5/V3nbMTK8U8KnloGOV/AWoK/YVVL+CKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob+b2dXizG+13S3gouJATSfoI+e9tublbcK5dCkZJhA=;
 b=xR5nRhElaIYZ+Cr0iKzeM4Ys1jdKhU3b7IAn0wKOHtWMj2Qn1cce9dfhOeD4BSRm/KXinGxZwaEO1SNr6wKCOSllOz7/rg5VL31GS01NTjh7PALGdHTn2SmsGWm9lZyXVeUBLbQa8E7RyT9IsChSoes/hKGCDNyRGV8cxg6wGGvJUTOaGTBjvUqarWeJS5vrRp0M/zeE8PeZ9VKm/RwhYMNIP10hRiQMHZnIGFQ+Y+/ZlTDHFWqbXBq6dg2gRtodMnqeXyNA9adtF80Tk/oUp6pHPHV8igXC++4sW+b6iGswAll5vJJjNg52j9LPqWaIHsWXZMkeWF9+b3xEXcPPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob+b2dXizG+13S3gouJATSfoI+e9tublbcK5dCkZJhA=;
 b=Mry8R0QGfhhGZ9ADaIJg6QNyx8Ma+ty1uUuXGLGj2gkG42VQTalMqnqo2LZ4hB7GX2CnBAhM1krnY1bliTrCZr/KoKZBPoMIGlDBwEiIb//goVJ7oKnIAMj5odYE8wO5o33FunTgZ7Nmn+BcA1VlHl/rcCwjyrayoVwv5qBlYcBM5FjNe3SxOuY6B3pbjg5yDYmfkwoIQ3Kb1V4qdvcqOJ14F+5SkpR3RiDh0qx33mwENgo7ZWw9mSF9st61K/5c94kfkr56uuArmiTzecZjQojQLNnaYRzed8mj4Px9hQqbE0u49j4u+L5MdsLXizOXLLd9ZqKt68797fofl8TTEQ==
Received: from DUZPR01CA0234.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::25) by DU0PR10MB9263.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:5c9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 15:10:17 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::72) by DUZPR01CA0234.outlook.office365.com
 (2603:10a6:10:4b4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 15:10:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 15:10:17 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 17:03:13 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 17:10:16 +0200
Message-ID: <fe11e5a1-a545-4575-8852-94b2b222f144@foss.st.com>
Date: Wed, 17 Sep 2025 17:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-4-b42847884974@foss.st.com>
 <3b8a1653-9cf9-4107-b2a8-2c2f639a5ddb@foss.st.com>
 <4cd5e70d-875c-42da-859c-524ba439a171@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <4cd5e70d-875c-42da-859c-524ba439a171@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|DU0PR10MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: 5477d822-a271-4a9d-ea17-08ddf5fc4fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ampraU1IT083Q3hWU205UjAyWjc2UnZnWitId0pUVVEwL3FLY3UyY2VJays5?=
 =?utf-8?B?VitDSjc4ZkNwNDRNczhxbEtXTHpjYUYrMkNIRzIvZkhDUnNUWVhhWFh2ODFP?=
 =?utf-8?B?VUZISkhFVm51aFowczRGbXhVR0twckZKYWhqc1c2TGU2dk8xSWJ1VlRMS3Yw?=
 =?utf-8?B?enI4RzVEY3MxN1JyOEVZWWFQYlU3T2EvMWxtVFVyWjhoY1BWY0dOYWEwUk5s?=
 =?utf-8?B?dk5XclM1dzF4djJ3RHZ5emhQZnlWTzcveGZycjI1VDJDNDZ6MnhST3I0TWlH?=
 =?utf-8?B?OUh2bHloejVLS0RrWVh2VS9pTDBqQUZRb1ZRZEM3Q1dET1BsWHovS0s1bjhE?=
 =?utf-8?B?c1ErMXBHU0lJTlcrTHQ3RVo5a2pBUk4xYTdHM25nUHBmMTl1M1grQ3hwWUhy?=
 =?utf-8?B?YzZWYk4xOXc4dmlLdkx0a21tUEpnbnU3aittVjVLbGVFRWtTQWdVblcybmg3?=
 =?utf-8?B?RXpzaUtxc0dyMmhYY2loQTgwVU5vQ1E2TTBrelJOa2JycUpzNlhHVVVaQ2g0?=
 =?utf-8?B?NkZJNTBmQ2d1ZFNkdmdNRFcvUEExeDArRFdKVDRCUEdNSFdrTW12bXdLUHZQ?=
 =?utf-8?B?emJZWEVCbkxLTjlURHBtOWJNaEtxSW92bGl2YzRSSE5wNHhjUFdJNmVOcFZy?=
 =?utf-8?B?WHZ5VVZLWnlXOXd1RU8zNXBzRWQwT0psQWRvL0svRGo0M0Zxa3A4blA0RVhi?=
 =?utf-8?B?SkxqRHlNdml5UmVDUkNBRUhOTE1nN0ZYOEhQdkFUU3dyR084M2hEcGVYY3Ro?=
 =?utf-8?B?TUY3M01EN2VScTNSMEZFd0Y1MHJOWC8zNHpqcXloZ2hTM012ampvL0FkUFdU?=
 =?utf-8?B?aEdueHJKS2NoKy9OZ1MwcWNYcm5ycTlJQi9hRm9pM0xmdStJWEdKVGp6eGo5?=
 =?utf-8?B?WTNzUzBsWSs4YWxibnd2cDlJdlRoQ0lHR1ViMEZHT0N2L2lQOTBTMTNKb0VH?=
 =?utf-8?B?WVJ4eGtKa1BYMElFSWY3a1ZXbHc2amw0MnRLcFVuVnRnUG5Xb0h0N3J1V0hM?=
 =?utf-8?B?Z29lcWx3TFpUdEk4elVqUUVHT2drS3ptdmNWUHZCQnYvTUYveGpIbHBSdVVm?=
 =?utf-8?B?cGZZM0hHbDBaMHFKSTc5QVdzMWthbzlqUHBaY3VCaTN6ZnVqeHBvRlZCenM0?=
 =?utf-8?B?aWxiZkkvSFBDVlJSdXVNK01YdCt3dk1KbkdPc1V6aG13UDg1RnpKTlJVZ2Fu?=
 =?utf-8?B?WldWamtDbEtScXB2RUZUa2s1TWFaZFVoMndrc2p5LzRGOHVOWmJYaGpJdFhw?=
 =?utf-8?B?bjM0ZlluQlZJUXk1VHczd0h5ZFR3cUpnRkUzNWE1dGJqU0VrNU8rQzQvV25O?=
 =?utf-8?B?UmlTbnhYTzYwR2Qvazdyb3k4Nkx0WGNnbTcvUjNRbUxEVTdxTTQ1UDd6MFNW?=
 =?utf-8?B?cWtYT0YvYTFnMFYxMWcyTU5MY0QxWGtISFhiLzYzZTU1QllDbE14ZnA5WnBt?=
 =?utf-8?B?QlprN1Y1SG13ZlErYXZNeHA4dDN4RGxneDc1YjdEeUxUSXhINWlZRXlEYzJs?=
 =?utf-8?B?ZUUzd2llZ1g4MnhHbDRYWUZheHdocHg1Qk16cnJVTXJYNXNnaHBYY2ZoSDNI?=
 =?utf-8?B?QnFwTmM3SDd3QzhZM2t1VUNrdVl5bEpFTmdiN0s3bFhtUEdYYnZmR01pU0hD?=
 =?utf-8?B?dzk4NXpoZ0k0SWxjM0IyMTQ3L1BRdnNQZTlQZ2hLbUZQMm8zZGVjUG5XbThm?=
 =?utf-8?B?aTRxU3hsZUY5VUg0eW41UWhWakROZTRWaVVVaGVwQXZQNkgwTmlVNmpoWG5x?=
 =?utf-8?B?ZHlVSnlLRUhqVUtIWk5zb1kwKzcyV29mb0ViYjdCWW9vRGM0K3ZnS3pBZUov?=
 =?utf-8?B?OWdZVXlUOTNoMUY1bDh4bXJzOG8rck9qaml0L0ljRjUrUDd6ZnJhbk1IeGJ4?=
 =?utf-8?B?K0Fsb1Q1c0cxTTF6SUx5cmJURk1FaStiUzZ5VUNzQmlUL2NoQXB5UXNEdjZi?=
 =?utf-8?B?SnlUTU9TWkMwek5FUGRlaWNNZ2l5b1lLMXNyOE5ES3c4MWlqNzdNSHY5TGNx?=
 =?utf-8?B?dm1iYldxRXBKdGxJbnRKUm5wNHN5cVRtekxjVm5BcVVUNlFGNEpzVm5zTnNJ?=
 =?utf-8?B?RlVTL2hJaVJHQ1lTcjFJSE4xSnV2cWM0RnR5dz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 15:10:17.3069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5477d822-a271-4a9d-ea17-08ddf5fc4fb4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB9263
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2qeTu8ZEPpVH
 ChXwgHNfRwB9B0sIPm4eDphCYsn8bSVKidcotkUfLg8I6KJbX/sIPphPbKyHC/YimNgCskCY1nv
 5Au9uvjauifssna7GeUGqVzLTR9eSxNTa+ZzQBkLR1918nD55Ii4ajvvKiDqqZJxgaf6/NV/HKf
 6JfwK2TUHjD7Mrsef9uiNWeYZU+ArUaYPNhdwGKXO6Q2R1cwvElGc47yF8rFOnR0GpN1SLJVdtb
 AAVqF00uuKJ1o//jBXxnjL8GI5K1DjSNcyhL08B79UNqRu/aP6xA5Uwh8oMDa8rJoLICqA4cco0
 vqRga+FKZX6SrfC/nAlo+ZVmRXJcGjzGwEw+aLQvCEM0ehg9d+47/NsKk8CoJWtYy6d3A1QIq2W
 6qBgnRfb
X-Authority-Analysis: v=2.4 cv=JYq8rVKV c=1 sm=1 tr=0 ts=68cacf5a cx=c_pps
 a=5ek8fjnuUT40V7IhO9r0iQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8
 a=8b9GpE9nAAAA:8 a=JKz4oodEM6ILdaL5j6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: nHdwtpAgE3dp9A3idHdDsbtVIrMR7kuR
X-Proofpoint-GUID: nHdwtpAgE3dp9A3idHdDsbtVIrMR7kuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

CgpPbiA5LzE1LzI1IDE1OjA1LCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+IAo+IAo+IE9u
IDkvMTIvMjUgMTg6NDEsIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPj4KPj4gT24gOS80LzI1IDE0
OjUzLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+Pj4gLi4uCj4gCj4+PiAgc3RhdGljIGNv
bnN0IHN0cnVjdCB1ZGV2aWNlX2lkIHN0bTMyX2x0ZGNfaWRzW10gPSB7Cj4+PiAgCXsgLmNvbXBh
dGlibGUgPSAic3Qsc3RtMzItbHRkYyIgfSwKPj4+ICsJeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0z
Mm1wMjUxLWx0ZGMiIH0sCj4+PiArCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1NS1sdGRj
IiB9LAo+PiBpbiBWMSwgb25seSAic3Qsc3RtMzJtcDI1MS1sdGRjIiBjb21wYXRpYmxlIHdhcyBp
bnRyb2R1Y2VkLgo+PiBXaHkgYXJlIHlvdSBhZGRpbmcgInN0LHN0bTMybXAyNTUtbHRkYyIgY29t
cGF0aWJsZSA/IAo+Pgo+PiBGb3IgbWUgb25seSAic3Qsc3RtMzItbHRkYyIgaXMgbmVlZGVkLCBj
dXJyZW50bHksIG5vdGhpbmcgaW4gZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMKPj4g
aXMganVzdGlmeWluZyB0byBhZGQgInN0LHN0bTMybXAyNTEtbHRkYyIgb3IgInN0LHN0bTMybXAy
NTEtbHRkYyIgbmV3IGNvbXBhdGlibGUuCj4+Cj4+IFBhdHJpY2UKPiAKPiBIaSBQYXRyaWNlLAo+
IAo+IEl0IGhhcyBiZWVuIHBvb3JseSBleHBsYWluZWQgaW4gdGhlIGNvdmVyIGxldHRlci4gQmV0
d2VlbiB0aGUgdjMgYW5kIHY0IHZlcnNpb25zCj4gb2YgdGhlIExpbnV4IHNlcmllczoKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA4MjItZHJtLW1pc2MtbmV4dC12NS0wLTljODI1
ZTI4ZjczM0Bmb3NzLnN0LmNvbS8KPiAKPiBTaW5jZSBVLUJvb3QgaXMgYmFzZWQgb24gdGhlIExp
bnV4IGRldmljZS10cmVlLCBJIGZpZ3VyZWQgaXQgbWlnaHQgZm9sbG93IHRoZQo+IGFkZGVkIGNv
bXBhdGlibGUuCj4gTm93IHRoZSByZWFzb24gd2h5IHRoZSAic3Qsc3RtMzJtcDI1NS1sdGRjIiBo
YXMgYmVlbiBhZGRlZCBpcyBiZWNhdXNlIG9uIHRoZQo+IFNUTTMyTVAyNTUgKGFuZCBiaWdnZXIp
IHRoZSBMVERDIG5lZWRzIDQgY2xvY2tzLCB3aGV0aGVyIG9uIHRoZSBTVE0zMk1QMjUxIGFuZAo+
IHNtYWxsZXIgU29DcyBpdCBvbmx5IG5lZWRzIHR3by4gVGh1cyB0aGUgdHdvIG5ldyBjb21wYXRp
Ymxlcy4gRnVydGhlcm1vcmUgdGhlcmUKPiBpcyBmZWF0dXJlcyBkZXBlbmRpbmcgb24gdGhlIFNv
QyB2ZXJzaW9uIHdoaWNoIHdpbGwgYmUgYWRkZWQgaW4gdGhlIG5lYXIgZnV0dXJlLgo+IEJlc3Qg
cmVnYXJkcywgUmFwaGHDq2wKPj4KPj4+ICAJeyB9Cj4+PiAgfTsKPj4+ICAKPj4+Cj4gCgpUaGFu
a3MgZm9yIGNsYXJpZmljYXRpb24KClJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
