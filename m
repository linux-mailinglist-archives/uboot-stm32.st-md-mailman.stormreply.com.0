Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC8C1ED35
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Oct 2025 08:43:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3137CC62D85;
	Thu, 30 Oct 2025 07:43:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDE62C62D84
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 07:43:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U7f2x51095146; Thu, 30 Oct 2025 08:43:41 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a4399r6yp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 08:43:41 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF4MadTmN7PZEqrTzgQKoKP0GsAIYu2m8XWz5Z7VsG71lMNiUE+GDLT8P+cqmTb/7aJBVfw0mrPyWZ9IyubgNQC92x4YP9F3Mp8wPxaIwDyIuAQIoHwImbYJ4yYBtysiVvwStqVoWQRmk5PMw5j6MQOAIl4LvMGiz0hgy6ibD9aiMLw2VqfOEiJ8wP4RlLYzVT/pyO9R2DRexRHQ4bZEit2pRSmTUU/fipO4cAzpsa9XFQtm9gjZaArOZB3Hb1ZajSSptfFUX4kd6FBh6Xet9Dbduek9J6bEd+okUTJsLZo62mxGDs+0zhibAtDOZEL1LZs+hReXa6J8LalhCX7+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6hqhR0Y9eIVb1d6Jwm6jcUkubcYdThIwhMd2OlW00k=;
 b=Zi0EJRTpIU5eUo4W+kDkH74PIwKlSmjc4JkFpi38HlUVlL06ih34cLuE86DNwl1XR3VSW3KF+1NfBo7nD3cGidfqprmEJJqN9++UqYURtCUmn4/087GnY2ad75ZVY94Q2XemGqdsgHG00rKrduG7DEeEvzYcdac1YJZ4gO4MCc2iUPbo1pJxPoVxXP/W+42PAiPiJKmG2+h1eepiP/T88agtTbwolc0grwztKLS9T3enng9VYj9CKQdzQV4n+rTX32Uyq7Ol8d2vTEejvjO2uukmik4FpAZ3D60rPhfOsvZKEeNC2lrQ9EyfzKhjXVKB4SstHm5Zof97JJ3lNf++6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6hqhR0Y9eIVb1d6Jwm6jcUkubcYdThIwhMd2OlW00k=;
 b=IacXDUFRlT+PThyXngd193I+R3CsOaViEWyMUW6dGdCAtw/Dl/vWvKZot+LVzdk5PgnkiJRVS7g+9KGCoywQCDG9uJMJmz9OgW0oCoOyJVHLU/R8VtFnjRXwhG5RphFdi4FBR26JU6pJg3FaL6M5B1+YshE8o5OOWvAPXgG77z71nw1fUx8ZX5H+MsWYMZ8bsK3ZFH1FNo5Jdnh9GQYFMDcD4hNuxGl5xb9xe/IBp65AJkypVunP8BD3dxGJm49PdUy6IXyNMJC7cjjJgwmLSFKRQRL4zA9ci+TH+tcGUrAgpsdkH0JHTMoB+zkisf+HpgMEw5XU1DlJmLCTZvnfzA==
Received: from PAZP264CA0157.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::12)
 by AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 07:43:38 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:102:1f9:cafe::6f) by PAZP264CA0157.outlook.office365.com
 (2603:10a6:102:1f9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 07:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 07:43:38 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:41:21 +0100
Received: from [10.252.23.232] (10.252.23.232) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:43:35 +0100
Message-ID: <ac267663-0663-4ab4-8456-fb6256d001aa@foss.st.com>
Date: Thu, 30 Oct 2025 08:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-5-b42847884974@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250904-master-v3-5-b42847884974@foss.st.com>
X-Originating-IP: [10.252.23.232]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F98:EE_|AS8PR10MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 242748ae-bb9f-4dc6-a46a-08de17880a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXRiY0ZtU1B4N3RISjR2N3VxTEwrekg1OHU2bjA2aDBVU21qU1JWZm50RGpr?=
 =?utf-8?B?RnVVOERWMStFYUduYXhKb2Uybzh4Zkp2RHhlN0FIZld1WEVBb0IxbFZlQVUr?=
 =?utf-8?B?ampCN1dkOENhd0NPMEFTd1Jmb3NVWmZWeTNrRVlqZjlBSGlCVCtWZWJDYUQw?=
 =?utf-8?B?RGdLb2ttSlNkWXZtbzhmREVzOTZMdUpub3RKa2JOWGdWdll2NlZ5M1VvWE1K?=
 =?utf-8?B?ekJOdkpHTGVKSVUyZTQyQXNNS0ZkZERvR1Qyd3daems1WTlWNlRWOGlKa0p0?=
 =?utf-8?B?L094YlZZdnlDN1M5b3VMZ0MyNTgvODdrci94WGFVeDg5ZHlpNnZCVG9paXl4?=
 =?utf-8?B?MGxQT1ZkTXo5cUxqck81aXhOdVVyV1lzVmw3NU1BQlR2UTdFMEtIaE96U2V2?=
 =?utf-8?B?VVYvS1ZodWtTUVEvdjRPdlc1TWNPTGgyT1hBTVVibWpPVDBKcjhleWJjNGpJ?=
 =?utf-8?B?MXRlaEJqank5dnlNQ1ZhOGtOTEVMUGRieXl5Ym0xOFBWVkxZUlpUQ21jR3ZU?=
 =?utf-8?B?WlBJWWg4eWtGc2tsUnc1bnBWQlMyZjFqQksrc2Q1VSt3bmFlSnN3eEkxTVcy?=
 =?utf-8?B?TndubGs3blVoeEFNaVhWTDhpblJNTkJGZ2VPWXkvMUFFQTVGaG5XUy9ON29t?=
 =?utf-8?B?QW9ibndleVdObGhXWmovdU9mTFVjMjFxWXNZNFplRXpDdlFEeDJlZTdrU2ha?=
 =?utf-8?B?ekJGUU9yajNLK1VPY1EwRnBGWVFFQWFYeU9DdnBZQXd4UWFBWGVuaEFkbCt0?=
 =?utf-8?B?Y01Bd3JtbUt4RHZLdC96K2o1bEg5NDBET1BuZlRtVk5JUC9BMGlkWGMrb3E0?=
 =?utf-8?B?TWU4UVZ0d1NhMnZicVpNaVRzWjNPeTBqQ1d4QzE0NFo2aHFIdVA1cnhJNDBN?=
 =?utf-8?B?aXZscGh4ODNNTW1PaFZwSnBhTzVEMmQxaFlnWkFxRHNtb2lRQ1lJejFnRzkw?=
 =?utf-8?B?ZGRCd2I1MXgyU1RzK2xxbjRwVWllT1hXWlVSUTA2QXF1M0I3OG1NT24zaUhW?=
 =?utf-8?B?bzJVSEtTZ1JmUE9xOVUxdE5MY0tkZ3Q5cktRQUhJdkxVc0M4YUxCWVpaWkNW?=
 =?utf-8?B?UDI4dmpXWEJMMDZwdGxIVzc1NVEyNll0TThSd20vbFp0Y0FxTG10K0RrUi9E?=
 =?utf-8?B?d1Y1ZXd0R0ptQ0t5YlA2NGlUbUtTb1VDK2tuOUZkWTR3dEJlVW1tLzNBOVhO?=
 =?utf-8?B?QmpwNG1IdzhPbVlTcFR1b0ZmbzB4L04rMjF6elBjMEsxTUNNc0M1VlhNZXh0?=
 =?utf-8?B?TE0zU1pFM29ZT3Y4Nzl5MWxSV2pqNWZqekxrVUduWW9Nejd0Y2N4Zjh2UFdH?=
 =?utf-8?B?YzFJaVI3Yjd6RTA3bWM3a3F2Ylo1eitOdkdHOGJEV1ZhSUVSaTFmaWRFcTdE?=
 =?utf-8?B?RkpnVkFKVUVtVFR2cm5EekYvN2xGUW5DY0hSZ1R5bUZ1ZzF4QVNiMmVaNU1n?=
 =?utf-8?B?RUpua3lRQVhQVEtaN25GZkxmY0tudDd2RlVKeEtQc2tpSTJlRldiS2liemVs?=
 =?utf-8?B?UzFTTzZJd2NERExsNW16aEIzN0NFUkZiNVV6cU05cTVTUzJBR3I1emVuQlZH?=
 =?utf-8?B?VzZwRkRwRjZ4K1hCNnQwbjU3MnpFcFlOYWJmcDZKNkhraytkYWNyR0Erbyt3?=
 =?utf-8?B?TjA0dzNENDRKeVl3TDJYRERaOGN4QmN0Z0hNRmsxcjlNUjVZcUI0cHI3YUZj?=
 =?utf-8?B?Q25NbjMwVExsaEozK2VLNEdicXgxNmNYVlg4ZnRhR3RiTnMrRHJTNHMwN2pZ?=
 =?utf-8?B?MUdOdlpHT3J5VkFyQmthSWVsY2RORzduOGtSYThZZ01PTkhpbFVsZHd6OTBL?=
 =?utf-8?B?d1E3bVZxbS95Y2ZvME94MmJzRU12N0huN1FkeUZCcC9wOVBVZ0dpVnVlYlJF?=
 =?utf-8?B?M3QwNFB4WHNRRGZIdlJ4RmNvWldUN0xSS3FoVDJsbnpUaWFaL0VFY0tYYjRI?=
 =?utf-8?B?S1YxYzZ5U1NTREVrVDV3SXJ5K0d0VmxmRml6RzlyYyt2VXMzUGxGd3RKd296?=
 =?utf-8?B?Y2k5Z2MzM3NxbXQrVmdUaFR0dEU1aDhCdEdOeGFDWEJKVVR2cDRQb2dpN1dR?=
 =?utf-8?B?clM1NHNKamo0bjBndnFXeDZKWmcxTmNnREJTTFBPcGtTRjVFKysxOWVMU2Ez?=
 =?utf-8?Q?Pm7Eg7QWrQifS0ahzIFrYMUa3?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 07:43:38.6016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 242748ae-bb9f-4dc6-a46a-08de17880a2c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7427
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=6903172d cx=c_pps
 a=sGfeb9PwuAfiW5dbaiAd6A==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ttam_Flv6DUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=941mOKHnnHugEBzshyIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: NPDCKVaarpBn-AnCQxMAelHBaIlp2sCn
X-Proofpoint-GUID: NPDCKVaarpBn-AnCQxMAelHBaIlp2sCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MSBTYWx0ZWRfXzNVB+WYOsbIO
 OAioJWHROQDydYAJ7yeTdo7XC0WiPY6ymO4if3Ju4W/gV6YWoQjDe8hwQ49bH0Nrsa9KEPQrq3m
 +ApPaNgVaBnwTMNfnS664maQpePaelQJTwVtKPt4iGEe79trIvHdp8OsBvOdyfAiztDfAQyojsc
 zxZdCAMntDcPE7uybw911NUGRQNRD6FeskEID1K8yoAzi7hTU/jYjtiC6g9yZz8rnyC7VGibL4n
 SY86sLLb2FlN6VYdHnBxdiuAOjKJ5FpAY4Ey1Kx0qa37BWeJZxbGHjZerbrzlaKXnzzq1a5sXBr
 SIWXrgKf1Y3H+mznkawVynEJrQlYFDskzPzZoK/SwJ2BDDuWArFV0Zgyor2a94MGRy6ei+iYHJf
 gK+/tmNNMlcCBo8jB+hB5Vk/2drTNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300061
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 5/7] video: stm32: ltdc: properly
 search the first available panel
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKTGUgMDQvMDkvMjAyNSDDoCAxNDo1Mywg
UmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IEluaXRpYWxseSB0aGVyZSB3YXMgb25s
eSBvbmUgRFNJIGJyaWRnZSB3aXRoIG9uZSBwYW5lbCBhdHRhY2hlZCB0byB0aGlzCj4gZGV2aWNl
LiBUaGlzIGV4cGxhaW5lZCB0aGUgY2FsbCB0byB1Y2xhc3NfZmlyc3RfZGV2aWNlX2VycihVQ0xB
U1NfUEFORUwsCj4gLi4uKSB3aGljaCB3b3JrZWQgZmluZSBhdCB0aGUgdGltZS4KPgo+IE5vdyB0
aGF0IG11bHRpcGxlIGJyaWRnZXMgYW5kIHBhbmVscywgd2l0aCBkaWZmZXJlbnQgdGVjaG5vbG9n
aWVzLCBjYW4KPiBiZSBwbHVnZ2VkIG9udG8gdGhlIGJvYXJkIHRoaXMgd2F5IHRvIGdldCB0aGUg
cGFuZWwgZGV2aWNlIGlzIG91dGRhdGVkLgo+Cj4gVGhlIGxvb2t1cCBpcyBkb25lIGlzIHR3byBz
dGVwcy4gRmlyc3Qgd2UgY2lyY2xlIHRocm91Z2ggdGhlCj4gVUNMQVNTX1ZJREVPX0JSSURHRSwg
YW5kIG9uY2Ugd2UgZ2V0IG9uZSwgd2Ugc2VhcmNoIHRocm91Z2ggaXRzCj4gZW5kcG9pbnRzIHVu
dGlsIHdlIGdldCBhIFVDTEFTU19QQU5FTCBkZXZpY2UgYXZhaWxhYmxlLgo+Cj4gQWNrZWQtYnk6
IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMgfCAxMzYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTI1
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vc3RtMzIvc3RtMzJfbHRkYy5jIGIvZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRj
LmMKPiBpbmRleCBlZmU5YTAwOTk2ZWNhMDMwMWQyYTJiODIwNzRiYTk2OTBhOTY3YTczLi44MzRi
ZmI2MjVkMmQzNGE0NGJkOGVkZmYxYzkyYWY2ZGVjMzQ0YzIwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdmlkZW8vc3RtMzIvc3RtMzJfbHRkYy5jCj4gKysrIGIvZHJpdmVycy92aWRlby9zdG0zMi9z
dG0zMl9sdGRjLmMKPiBAQCAtMTcsNiArMTcsNyBAQAo+ICAgI2luY2x1ZGUgPHZpZGVvX2JyaWRn
ZS5oPgo+ICAgI2luY2x1ZGUgPGFzbS9pby5oPgo+ICAgI2luY2x1ZGUgPGRtL2RldmljZS1pbnRl
cm5hbC5oPgo+ICsjaW5jbHVkZSA8ZG0vdWNsYXNzLWludGVybmFsLmg+Cj4gICAjaW5jbHVkZSA8
ZG0vZGV2aWNlX2NvbXBhdC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3ByaW50ay5oPgo+IEBAIC00OTUsNiArNDk2LDEwMSBAQCBzdGF0aWMgdm9p
ZCBzdG0zMl9sdGRjX3NldF9sYXllcjEoc3RydWN0IHN0bTMyX2x0ZGNfcHJpdiAqcHJpdiwgdWxv
bmcgZmJfYWRkcikKPiAgIAlzZXRiaXRzX2xlMzIocHJpdi0+cmVncyArIExURENfTDFDUiwgTFhD
Ul9MRU4pOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBpbnQgc3RtMzJfbHRkY19nZXRfcmVtb3RlX2Rl
dmljZShzdHJ1Y3QgdWRldmljZSAqZGV2LCBvZm5vZGUgZXBfbm9kZSwKPiArCQkJCQllbnVtIHVj
bGFzc19pZCBpZCwgc3RydWN0IHVkZXZpY2UgKipyZW1vdGVfZGV2KQo+ICt7Cj4gKwl1MzIgcmVt
b3RlX3BoYW5kbGU7Cj4gKwlvZm5vZGUgcmVtb3RlOwo+ICsJaW50IHJldCA9IDA7Cj4gKwo+ICsJ
cmV0ID0gb2Zub2RlX3JlYWRfdTMyKGVwX25vZGUsICJyZW1vdGUtZW5kcG9pbnQiLCAmcmVtb3Rl
X3BoYW5kbGUpOwo+ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIoZGV2LCAiJXMoJXMpOiBDb3Vs
ZCBub3QgZmluZCByZW1vdGUtZW5kcG9pbnQgcHJvcGVydHlcbiIsCj4gKwkJCV9fZnVuY19fLCBk
ZXZfcmVhZF9uYW1lKGRldikpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJcmVtb3Rl
ID0gb2Zub2RlX2dldF9ieV9waGFuZGxlKHJlbW90ZV9waGFuZGxlKTsKPiArCWlmICghb2Zub2Rl
X3ZhbGlkKHJlbW90ZSkpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJd2hpbGUgKG9mbm9k
ZV92YWxpZChyZW1vdGUpKSB7Cj4gKwkJcmVtb3RlID0gb2Zub2RlX2dldF9wYXJlbnQocmVtb3Rl
KTsKPiArCQlpZiAoIW9mbm9kZV92YWxpZChyZW1vdGUpKSB7Cj4gKwkJCWRldl9kYmcoZGV2LCAi
JXMoJXMpOiBubyB1Y2xhc3NfaWQgJWQgZm9yIHJlbW90ZS1lbmRwb2ludFxuIiwKPiArCQkJCV9f
ZnVuY19fLCBkZXZfcmVhZF9uYW1lKGRldiksIGlkKTsKPiArCQkJY29udGludWU7Cj4gKwkJfQo+
ICsKPiArCQlyZXQgPSB1Y2xhc3NfZmluZF9kZXZpY2VfYnlfb2Zub2RlKGlkLCByZW1vdGUsIHJl
bW90ZV9kZXYpOwo+ICsJCWlmICgqcmVtb3RlX2RldiAmJiAhcmV0KSB7Cj4gKwkJCXJldCA9IHVj
bGFzc19nZXRfZGV2aWNlX2J5X29mbm9kZShpZCwgcmVtb3RlLCByZW1vdGVfZGV2KTsKPiArCQkJ
aWYgKHJldCkKPiArCQkJCWRldl9kYmcoZGV2LCAiJXMoJXMpOiBmYWlsZWQgdG8gZ2V0IHJlbW90
ZSBkZXZpY2UgJXNcbiIsCj4gKwkJCQkJX19mdW5jX18sIGRldl9yZWFkX25hbWUoZGV2KSwgZGV2
X3JlYWRfbmFtZSgqcmVtb3RlX2RldikpOwo+ICsJCQlicmVhazsKPiArCQl9Cj4gKwl9Owo+ICsK
PiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc3RtMzJfbHRkY19nZXRfcGFu
ZWwoc3RydWN0IHVkZXZpY2UgKmRldiwgc3RydWN0IHVkZXZpY2UgKipwYW5lbCkKPiArewo+ICsJ
b2Zub2RlIGVwX25vZGUsIG5vZGUsIHBvcnRzOwo+ICsJaW50IHJldCA9IDA7Cj4gKwo+ICsJaWYg
KCFkZXYpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJcG9ydHMgPSBvZm5vZGVfZmluZF9z
dWJub2RlKGRldl9vZm5vZGUoZGV2KSwgInBvcnRzIik7Cj4gKwlpZiAoIW9mbm9kZV92YWxpZChw
b3J0cykpIHsKPiArCQlkZXZfZXJyKGRldiwgIlJlbW90ZSBicmlkZ2Ugc3Vibm9kZVxuIik7Cj4g
KwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gKwlmb3IgKG5vZGUgPSBvZm5vZGVfZmlyc3Rfc3Vi
bm9kZShwb3J0cyk7Cj4gKwkgICAgIG9mbm9kZV92YWxpZChub2RlKTsKPiArCSAgICAgbm9kZSA9
IGRldl9yZWFkX25leHRfc3Vibm9kZShub2RlKSkgewo+ICsJCWVwX25vZGUgPSBvZm5vZGVfZmly
c3Rfc3Vibm9kZShub2RlKTsKPiArCQlpZiAoIW9mbm9kZV92YWxpZChlcF9ub2RlKSkKPiArCQkJ
Y29udGludWU7Cj4gKwo+ICsJCXJldCA9IHN0bTMyX2x0ZGNfZ2V0X3JlbW90ZV9kZXZpY2UoZGV2
LCBlcF9ub2RlLCBVQ0xBU1NfUEFORUwsIHBhbmVsKTsKPiArCX0KPiArCj4gKwkvKiBTYW5pdHkg
Y2hlY2ssIHdlIGNhbiBnZXQgb3V0IG9mIHRoZSBsb29wIHdpdGhvdXQgaGF2aW5nIGEgY2xlYW4g
b2Zub2RlICovCj4gKwlpZiAoISgqcGFuZWwpKQo+ICsJCXJldCA9IC1FSU5WQUw7Cj4gKwllbHNl
Cj4gKwkJaWYgKCFvZm5vZGVfdmFsaWQoZGV2X29mbm9kZSgqcGFuZWwpKSkKPiArCQkJcmV0ID0g
LUVJTlZBTDsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHN0bTMy
X2x0ZGNfZGlzcGxheV9pbml0KHN0cnVjdCB1ZGV2aWNlICpkZXYsIG9mbm9kZSAqZXBfbm9kZSwK
PiArCQkJCSAgIHN0cnVjdCB1ZGV2aWNlICoqcGFuZWwsIHN0cnVjdCB1ZGV2aWNlICoqYnJpZGdl
KQo+ICt7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCWlmICgqcGFuZWwpCj4gKwkJcmV0dXJuIC1FSU5W
QUw7Cj4gKwo+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX1ZJREVPX0JSSURHRSkpIHsKPiArCQly
ZXQgPSBzdG0zMl9sdGRjX2dldF9yZW1vdGVfZGV2aWNlKGRldiwgKmVwX25vZGUsIFVDTEFTU19W
SURFT19CUklER0UsIGJyaWRnZSk7Cj4gKwkJaWYgKHJldCkKPiArCQkJcmV0dXJuIHJldDsKPiAr
Cj4gKwkJcmV0ID0gc3RtMzJfbHRkY19nZXRfcGFuZWwoKmJyaWRnZSwgcGFuZWwpOwo+ICsJfSBl
bHNlIHsKPiArCQkvKiBubyBicmlkZ2UsIHNlYXJjaCBhIHBhbmVsIGZyb20gZGlzcGxheSBjb250
cm9sbGVyIG5vZGUgKi8KPiArCQlyZXQgPSBzdG0zMl9sdGRjX2dldF9yZW1vdGVfZGV2aWNlKGRl
diwgKmVwX25vZGUsIFVDTEFTU19QQU5FTCwgcGFuZWwpOwo+ICsJfQo+ICsKPiArCXJldHVybiBy
ZXQ7Cj4gK30KPiArCj4gICAjaWYgSVNfRU5BQkxFRChDT05GSUdfVEFSR0VUX1NUTTMyRjQ2OV9E
SVNDT1ZFUlkpCj4gICBzdGF0aWMgaW50IHN0bTMyX2x0ZGNfYWxsb2NfZmIoc3RydWN0IHVkZXZp
Y2UgKmRldikKPiAgIHsKPiBAQCAtNTMyLDYgKzYyOCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHRk
Y19wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQo+ICAgCXN0cnVjdCBkaXNwbGF5X3RpbWluZyB0
aW1pbmdzOwo+ICAgCXN0cnVjdCBjbGsgcGNsaywgYmNsazsKPiAgIAlzdHJ1Y3QgcmVzZXRfY3Rs
IHJzdDsKPiArCW9mbm9kZSBub2RlLCBwb3J0Owo+ICAgCXVsb25nIHJhdGU7Cj4gICAJaW50IHJl
dDsKPiAgIAo+IEBAIC01NjgsNyArNjY1LDcgQEAgc3RhdGljIGludCBzdG0zMl9sdGRjX3Byb2Jl
KHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gICAJfQo+ICAgCj4gICAJcHJpdi0+aHdfdmVyc2lvbiA9
IHJlYWRsKHByaXYtPnJlZ3MgKyBMVERDX0lEUik7Cj4gLQlkZWJ1ZygiJXM6IExUREMgaGFyZHdh
cmUgMHgleFxuIiwgX19mdW5jX18sIHByaXYtPmh3X3ZlcnNpb24pOwo+ICsJZGV2X2RiZyhkZXYs
ICIlczogTFREQyBoYXJkd2FyZSAweCV4XG4iLCBfX2Z1bmNfXywgcHJpdi0+aHdfdmVyc2lvbik7
Cj4gICAKPiAgIAlzd2l0Y2ggKHByaXYtPmh3X3ZlcnNpb24pIHsKPiAgIAljYXNlIEhXVkVSXzEw
MjAwOgo+IEBAIC01ODksMTMgKzY4NiwzNSBAQCBzdGF0aWMgaW50IHN0bTMyX2x0ZGNfcHJvYmUo
c3RydWN0IHVkZXZpY2UgKmRldikKPiAgIAkJcmV0dXJuIC1FTk9ERVY7Cj4gICAJfQo+ICAgCj4g
LQlyZXQgPSB1Y2xhc3NfZmlyc3RfZGV2aWNlX2VycihVQ0xBU1NfUEFORUwsICZwYW5lbCk7Cj4g
LQlpZiAocmV0KSB7Cj4gLQkJaWYgKHJldCAhPSAtRU5PREVWKQo+IC0JCQlkZXZfZXJyKGRldiwg
InBhbmVsIGRldmljZSBlcnJvciAlZFxuIiwgcmV0KTsKPiAtCQlyZXR1cm4gcmV0Owo+ICsJLyoK
PiArCSAqIFRyeSBhbGwgdGhlIHBvcnRzIHVudGlsIG9uZSB3b3JraW5nLgo+ICsJICoKPiArCSAq
IFRoaXMgaXMgZG9uZSBpbiB0d28gdGltZXMuIEZpcnN0IGlzIGNoZWNrcyBmb3IgdGhlCj4gKwkg
KiBVQ0xBU1NfVklERU9fQlJJREdFIGF2YWlsYWJsZSwgYW5kIHRoZW4gZm9yIHRoaXMgYnJpZGdl
Cj4gKwkgKiBpdCBzY2FucyBmb3IgYSBVQ0xBU1NfUEFORUwuCj4gKwkgKi8KPiArCj4gKwlwb3J0
ID0gZGV2X3JlYWRfc3Vibm9kZShkZXYsICJwb3J0Iik7Cj4gKwlpZiAoIW9mbm9kZV92YWxpZChw
b3J0KSkgewo+ICsJCWRldl9lcnIoZGV2LCAiJXMoJXMpOiAncG9ydCcgc3Vibm9kZSBub3QgZm91
bmRcbiIsCj4gKwkJCV9fZnVuY19fLCBkZXZfcmVhZF9uYW1lKGRldikpOwo+ICsJCXJldHVybiAt
RUlOVkFMOwo+ICAgCX0KPiAgIAo+ICsJZm9yIChub2RlID0gb2Zub2RlX2ZpcnN0X3N1Ym5vZGUo
cG9ydCk7Cj4gKwkgICAgIG9mbm9kZV92YWxpZChub2RlKTsKPiArCSAgICAgbm9kZSA9IGRldl9y
ZWFkX25leHRfc3Vibm9kZShub2RlKSkgewo+ICsJCXJldCA9IHN0bTMyX2x0ZGNfZGlzcGxheV9p
bml0KGRldiwgJm5vZGUsICZwYW5lbCwgJmJyaWRnZSk7Cj4gKwkJaWYgKHJldCkKPiArCQkJZGV2
X2RiZyhkZXYsICJEZXZpY2UgZmFpbGVkIHJldD0lZFxuIiwgcmV0KTsKPiArCQllbHNlCj4gKwkJ
CWJyZWFrOwo+ICsJfQo+ICsKPiArCS8qIFNhbml0eSBjaGVjayAqLwo+ICsJaWYgKHJldCkKPiAr
CQlyZXR1cm4gcmV0Owo+ICsKPiAgIAlyZXQgPSBwYW5lbF9nZXRfZGlzcGxheV90aW1pbmcocGFu
ZWwsICZ0aW1pbmdzKTsKPiAgIAlpZiAocmV0KSB7Cj4gICAJCXJldCA9IG9mbm9kZV9kZWNvZGVf
ZGlzcGxheV90aW1pbmcoZGV2X29mbm9kZShwYW5lbCksCj4gQEAgLTYyNCwxMSArNzQzLDYgQEAg
c3RhdGljIGludCBzdG0zMl9sdGRjX3Byb2JlKHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gICAJcmVz
ZXRfZGVhc3NlcnQoJnJzdCk7Cj4gICAKPiAgIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfVklERU9f
QlJJREdFKSkgewo+IC0JCXJldCA9IHVjbGFzc19nZXRfZGV2aWNlKFVDTEFTU19WSURFT19CUklE
R0UsIDAsICZicmlkZ2UpOwo+IC0JCWlmIChyZXQpCj4gLQkJCWRldl9kYmcoZGV2LAo+IC0JCQkJ
Ik5vIHZpZGVvIGJyaWRnZSwgb3Igbm8gYmFja2xpZ2h0IG9uIGJyaWRnZVxuIik7Cj4gLQo+ICAg
CQlpZiAoYnJpZGdlKSB7Cj4gICAJCQlyZXQgPSB2aWRlb19icmlkZ2VfYXR0YWNoKGJyaWRnZSk7
Cj4gICAJCQlpZiAocmV0KSB7Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
