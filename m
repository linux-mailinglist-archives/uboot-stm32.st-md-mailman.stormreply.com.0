Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAB5C5E543
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:49:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48F4BC628DC;
	Fri, 14 Nov 2025 16:49:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0B33C628DC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:49:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGgd4x3043344; Fri, 14 Nov 2025 17:49:24 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013023.outbound.protection.outlook.com [52.101.72.23])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kktyk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:49:24 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPBSrFaoQrEcyIFZskuScpHJxTCeYejBNrZ2PuT37DWElXsJydqZmY6A1MR3IeXs2cBEKefHwQGYCsWhIQZsaURTfFcDNbM9xcDL6GIBvDVMt+bJBpNkfOrs10bhYqu1PaFrvg2a0O2SmHqmcYMryXPBearhHr5j18Wqi7Lq7Tf5j0dCc1y7nCiqF5nnrjU2FxyoYKrdwvEgknPEOxx//S5clh4t+9CTZqHVond9IwNe6TNJrIvDqXvyDVuoB0dAIeqtd2dvll7RGoFkqiSYoTnd5atk7kHkoY5LdSr6/Ddg8CUZKb7aNXbKN+ruohFQEqm0ntGslz9VlXe9HOB5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZj9iZaedmgLwIhHa82GtWsJ4r1JMZIeXajsGTokplc=;
 b=iA+QnF+xSsMe41BxmGatnnS9ntCCRMgqaUcJaGMESa1aCRn5Paz8eW615D1hy5bKM4OIK3Jd/BsypJNCI7ywjsl/KUFIDudGEN63Elo3ngXJNEok55crMsNIbHWUlAh62NAC9HqrP1qyKZSIwShcXL6yIKZYDuw8CV1wlYORqKsEMBZh68CLVzgUSf2S8PdO5s9sqB+jzLwL9BB1lv2QShe1Y6a5w4LHU503yzbbZGdANiyQUM52hUto+KfpEJVhJQo/erKNOs+GH9UxBzN807ibkxUPyFDNzPVOARCJtAgd+jW4g6I2GnoPsgglfMwpaJjohGLobFpre2v7MBZPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZj9iZaedmgLwIhHa82GtWsJ4r1JMZIeXajsGTokplc=;
 b=Pnk0UKKEah2hhtlESWGN4jwBnYAJ0wBmAdoIuoasEI6Nvv3fyhQsJYiqVNCeXGKEfswYT6NZ7qkZIWlFEcq5J+LflM3DPKPpT3fe8gF9QWhJu0VQjjfQtelwkj4bww3SltCzFIP7k0mLShtLu4MNQk5wyD5ogVFYiKUlxAr4cGRVbF56TncsbuhGdY4et4uog9sG6py/oIdrljzsF3K0/CH1GcT5BSRdLRmNbUAF2IGlw+hdxFEGwDzBPIRtwXEo/GIrfbpl3n0LPfRSfGaW0H72qqTb3do3OCPqvXlFkKW9lLoA2OVXYqppAOhw4t/aVAmIwdotV/Pr2ff5gRP+cg==
Received: from DUZPR01CA0350.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::22) by PAWPR10MB7367.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:2ee::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 16:49:19 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::7a) by DUZPR01CA0350.outlook.office365.com
 (2603:10a6:10:4b8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:49:19 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:49:30 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:49:17 +0100
Message-ID: <29f8c9c9-1149-4974-a54d-c9ffc30f0e32@foss.st.com>
Date: Fri, 14 Nov 2025 17:49:17 +0100
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
 <20250904-master-v3-5-b42847884974@foss.st.com>
 <ac267663-0663-4ab4-8456-fb6256d001aa@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ac267663-0663-4ab4-8456-fb6256d001aa@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|PAWPR10MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: ff332a45-3e96-4d59-d657-08de239dc17a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmNIeVU3WmZ3bm9xS1AyUlBNNEcvZkJpaTBPVUNhaXZWVzFSOVBXSXM5bExV?=
 =?utf-8?B?eldFaDlOS24wTU14a1p0aUxzdHZNM2lJdE9YUnQyNGJmVVRKU25WQXUxYkZQ?=
 =?utf-8?B?bHNJaG1VaTFhSVJSS0pEVzUrZXh1MDhCTmViTE9LTmRBcEovUnJNVGl1Vnkx?=
 =?utf-8?B?TlNLS0RtTW9yYy9saUlvNVk4ek8xNkR4UW5MMDFPc2JWSVU2N05sSDVNNyts?=
 =?utf-8?B?OVNLVDhBMTh6THdLLytnT0FPZ0ZmRkpuRFRzamRNTFdiVXczNTFFZi9TNElj?=
 =?utf-8?B?bmhJSDJ6ZkIxMWM0RlJrb3U2ZjBnSUtTRCtYNnI3Q2FMMXZoZ0NoRlVvSVhT?=
 =?utf-8?B?T0VqZTRZV1ZPajVPb240K0lsd2hGRlZvc3o4UEF4aTZGRmZFb0hqVitOVW5w?=
 =?utf-8?B?akk0Q3FOREN0QmF1alVpN1ZSRThGREJTNVJwemlxcDBENkxKWnB3Y0NPcVd4?=
 =?utf-8?B?c0RwTWluNzhsQVZWYzlpSlVCVUQwZm0wQ1B3T082cXVTeDFUYkQ2UWljTTVp?=
 =?utf-8?B?NkJJd3hON2RtMTczWDFnb2ZVSWNVblorNS9IMUV1QzNmWWZvTHd4dzN3Z1BQ?=
 =?utf-8?B?cFVJeW5VK1Y1NjUvUjVhK3V0QXJPQ3RFT2UzbjM5dFlSdWh6N28xZnh6MG9s?=
 =?utf-8?B?Y1pMUkpoeXFxdkgzRCtPeFRXbVlqZndYMmMyMEl0SzBwOXRraDVVZ3hQcC9R?=
 =?utf-8?B?eG5VWTVjYXNOUDlYaVZHV0Q2SXhTcStRbVh4SHordmNFZmZWOVl0K2N5VFFk?=
 =?utf-8?B?ZGVsWWlHclQ1a0tneUNySGhpY05TRzZGNzRqTmtURkxpc3g0aS95Q25vaWJ4?=
 =?utf-8?B?KzdiRkFIZ0JSYkJ3Z1pBUi9WRjFIUC83ZVlERE1Sd3h1ZTdvOGpzbVk1aTdD?=
 =?utf-8?B?NlFYcHRTajY5WWhEUkVaUWZGdzUrb2t4WGJ2TU9DSTUrZVJCTlA2L084cUYz?=
 =?utf-8?B?ZG9WeE15OStUQ1BPeVdtbDR3dms1WWp1N3RmQ2ZjOXZReGtjRFJvbVNRTlZh?=
 =?utf-8?B?djZpOXNBVlNCSjNWbWdDZ2JsTUxQWTBpWHpQUXQ1djRKRFlMbUZjV2dmV3Br?=
 =?utf-8?B?ZFNFbUpNWXIyVkpqRWZRazF5TzBQSnlsTE1JWWo3TDhuY0RlTjIzK3lNRWRR?=
 =?utf-8?B?c2pYWEM0QW41WUxtT3JhRTBmUlBvalFLNGhOaDJsS3VuL0xTMnBiQWxOa25H?=
 =?utf-8?B?aEFPQTFnQlV4eWZERU5Jc0RlakFuWDNzRmVGbjRwQktUdEJtcnprQUFnNHZv?=
 =?utf-8?B?ZkxqbmhGMUk2eE5KczdiZDVSTDdzYmE1SVBRWVJ4ekR6TzkxdWg5eEVtb2tq?=
 =?utf-8?B?SlZ3WE85UWdKL2VNZTdDZFc2aWd4bldXb3E1Q1VyS1JWdzQvb1hWRkpDd1Bu?=
 =?utf-8?B?M0dRVlpSdFdZNEJYRmFmbjEycGQ0Z3ErSzFvQnQ5NXRlcDlmMllZczU2TXNS?=
 =?utf-8?B?ZWx3UGpIbU84TjhtZEJsa0gwamVYN3RvSnJLbmRqdFBlVklFYUpEbXhsRUhV?=
 =?utf-8?B?Y2p0dElML2FmN05CSWpTQ3pYS0NWVXh6aGhCanpMRzdXNHpaMHVHWFJWVWQr?=
 =?utf-8?B?RThjajdLb2dZWkJzVGo1WitMVGE4Y3dtMjBrbU5Eb0taZ29jaVg0NXhIRkhj?=
 =?utf-8?B?TC9GdUI5dXlDZGJWMEtMc0tjMTZvUzdDbEZwQzNZc09EWWo1UTA4WFBTcUpr?=
 =?utf-8?B?YWFmZk1WTnpVRktQbDV6dC9mWEEzMHhFM0s3VHBrV3RSV3JFS0txV3VpYUg0?=
 =?utf-8?B?VlJrc0F0eWM4ZU1ER3MvdHZvazRTZEhETHJMbTRtY0tGMDFjQjJMOGpaZG9m?=
 =?utf-8?B?TGVGcS92Ylh3ZC9Dczh2N0hacnZkUUZsZFBYaUpzRkhtUDVNNThpV3VyRE1P?=
 =?utf-8?B?RnA0a2w0aFlqenBzRXNuVmZNdndOUExPRi9JNnlOVGFBc28ySGJmK0lucUtz?=
 =?utf-8?B?UGVoaktKaFp1cHJ6R3NKZmJkMlcxYkpUQWxDT3ltQzVsc1NITDJ1VzRiZWdI?=
 =?utf-8?B?RDh5SzJEZXVuZmxkbGlVcXNyV05LcVFIazNSMVkzRVJyUS8xZFRXRkFEUGsr?=
 =?utf-8?B?anpJRWhHTGZsVG9ZMXFzbmlMWDFnbnFRc1RNbzIzNisvcUxNRGdkYitYQW1y?=
 =?utf-8?Q?gDBxjb6GDfE82TJAFXv6TMoT3?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:49:19.4918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff332a45-3e96-4d59-d657-08de239dc17a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7367
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzNSBTYWx0ZWRfX+dZkUbM/G4Yz
 ngrbG8NO6KVg5yaHKWurKIuqXPMJ+gKpNBUxE6cFDJubrOK38Az8PGB4lXU/5v7UP87lQWw/iE1
 Eb3nDCph0vi2TLl3guVFygJqFkjGXxwuP4qel9NEYLdrNuTga1PQkaMgHssW/u0K4nDBL4Yy/QS
 46dJpZSH3QDPh+uKlsg5Ci352CfmbcluUEOPJD/x1YpdkzJOjU/WkKbwn/PjzxVZSkCFPrB1Fto
 dCyF1ivn0tpToJbIgUhpoQ+FTdE3i9nciwfANIEYACwRYKpV3UdAOarxBfu1yudb9mF/pvbfzdO
 /eQyuHx0b86PKLdIiS0uzADvDNK8/8dtyCEnT2+2SC9bhBgLyRIz4YnfE251bgZ5JtiZti8hABq
 KBIJjOT+TOGitfrK2n9F174t+zTMRQ==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=69175d94 cx=c_pps
 a=guev5NpOtKZLIFWBmHTLzw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=kHEJ6T4nsVNC8KP5Z3wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: EdkW-IkVVQ33I7D1_JyqTZUqNvyFSNCe
X-Proofpoint-GUID: EdkW-IkVVQ33I7D1_JyqTZUqNvyFSNCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140135
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMC8zMC8yNSAwODo0MywgWWFubmljayBGRVJUUkUgd3JvdGU6Cj4gSGkgUmFwaGFlbCwK
PiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBBY2tlZC1ieTogWWFubmljayBGZXJ0cmU8
eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gCj4gTGUgMDQvMDkvMjAyNSDDoCAxNDo1Mywg
UmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+PiBJbml0aWFsbHkgdGhlcmUgd2FzIG9u
bHkgb25lIERTSSBicmlkZ2Ugd2l0aCBvbmUgcGFuZWwgYXR0YWNoZWQgdG8gdGhpcwo+PiBkZXZp
Y2UuIFRoaXMgZXhwbGFpbmVkIHRoZSBjYWxsIHRvIHVjbGFzc19maXJzdF9kZXZpY2VfZXJyKFVD
TEFTU19QQU5FTCwKPj4gLi4uKSB3aGljaCB3b3JrZWQgZmluZSBhdCB0aGUgdGltZS4KPj4KPj4g
Tm93IHRoYXQgbXVsdGlwbGUgYnJpZGdlcyBhbmQgcGFuZWxzLCB3aXRoIGRpZmZlcmVudCB0ZWNo
bm9sb2dpZXMsIGNhbgo+PiBiZSBwbHVnZ2VkIG9udG8gdGhlIGJvYXJkIHRoaXMgd2F5IHRvIGdl
dCB0aGUgcGFuZWwgZGV2aWNlIGlzIG91dGRhdGVkLgo+Pgo+PiBUaGUgbG9va3VwIGlzIGRvbmUg
aXMgdHdvIHN0ZXBzLiBGaXJzdCB3ZSBjaXJjbGUgdGhyb3VnaCB0aGUKPj4gVUNMQVNTX1ZJREVP
X0JSSURHRSwgYW5kIG9uY2Ugd2UgZ2V0IG9uZSwgd2Ugc2VhcmNoIHRocm91Z2ggaXRzCj4+IGVu
ZHBvaW50cyB1bnRpbCB3ZSBnZXQgYSBVQ0xBU1NfUEFORUwgZGV2aWNlIGF2YWlsYWJsZS4KPj4K
Pj4gQWNrZWQtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBv
dUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvdmlkZW8vc3RtMzIvc3RtMzJfbHRk
Yy5jIHwgMTM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMgYi9kcml2ZXJzL3Zp
ZGVvL3N0bTMyL3N0bTMyX2x0ZGMuYwo+PiBpbmRleCBlZmU5YTAwOTk2ZWNhMDMwMWQyYTJiODIw
NzRiYTk2OTBhOTY3YTczLi44MzRiZmI2MjVkMmQzNGE0NGJkOGVkZmYxYzkyYWY2ZGVjMzQ0YzIw
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2x0ZGMuYwo+PiArKysg
Yi9kcml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2x0ZGMuYwo+PiBAQCAtMTcsNiArMTcsNyBAQAo+
PiDCoCAjaW5jbHVkZSA8dmlkZW9fYnJpZGdlLmg+Cj4+IMKgICNpbmNsdWRlIDxhc20vaW8uaD4K
Pj4gwqAgI2luY2x1ZGUgPGRtL2RldmljZS1pbnRlcm5hbC5oPgo+PiArI2luY2x1ZGUgPGRtL3Vj
bGFzcy1pbnRlcm5hbC5oPgo+PiDCoCAjaW5jbHVkZSA8ZG0vZGV2aWNlX2NvbXBhdC5oPgo+PiDC
oCAjaW5jbHVkZSA8bGludXgvYml0b3BzLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9wcmludGsu
aD4KPj4gQEAgLTQ5NSw2ICs0OTYsMTAxIEBAIHN0YXRpYyB2b2lkIHN0bTMyX2x0ZGNfc2V0X2xh
eWVyMShzdHJ1Y3Qgc3RtMzJfbHRkY19wcml2ICpwcml2LCB1bG9uZyBmYl9hZGRyKQo+PiDCoMKg
wqDCoMKgIHNldGJpdHNfbGUzMihwcml2LT5yZWdzICsgTFREQ19MMUNSLCBMWENSX0xFTik7Cj4+
IMKgIH0KPj4gwqAgK3N0YXRpYyBpbnQgc3RtMzJfbHRkY19nZXRfcmVtb3RlX2RldmljZShzdHJ1
Y3QgdWRldmljZSAqZGV2LCBvZm5vZGUgZXBfbm9kZSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGVudW0gdWNsYXNzX2lkIGlkLCBzdHJ1Y3QgdWRldmljZSAqKnJl
bW90ZV9kZXYpCj4+ICt7Cj4+ICvCoMKgwqAgdTMyIHJlbW90ZV9waGFuZGxlOwo+PiArwqDCoMKg
IG9mbm9kZSByZW1vdGU7Cj4+ICvCoMKgwqAgaW50IHJldCA9IDA7Cj4+ICsKPj4gK8KgwqDCoCBy
ZXQgPSBvZm5vZGVfcmVhZF91MzIoZXBfbm9kZSwgInJlbW90ZS1lbmRwb2ludCIsICZyZW1vdGVf
cGhhbmRsZSk7Cj4+ICvCoMKgwqAgaWYgKHJldCkgewo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2Vy
cihkZXYsICIlcyglcyk6IENvdWxkIG5vdCBmaW5kIHJlbW90ZS1lbmRwb2ludCBwcm9wZXJ0eVxu
IiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19mdW5jX18sIGRldl9yZWFkX25hbWUoZGV2
KSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiArwqDCoMKgIH0KPj4gKwo+PiAr
wqDCoMKgIHJlbW90ZSA9IG9mbm9kZV9nZXRfYnlfcGhhbmRsZShyZW1vdGVfcGhhbmRsZSk7Cj4+
ICvCoMKgwqAgaWYgKCFvZm5vZGVfdmFsaWQocmVtb3RlKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUlOVkFMOwo+PiArCj4+ICvCoMKgwqAgd2hpbGUgKG9mbm9kZV92YWxpZChyZW1vdGUp
KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZW1vdGUgPSBvZm5vZGVfZ2V0X3BhcmVudChyZW1vdGUp
Owo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFvZm5vZGVfdmFsaWQocmVtb3RlKSkgewo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKGRldiwgIiVzKCVzKTogbm8gdWNsYXNzX2lkICVk
IGZvciByZW1vdGUtZW5kcG9pbnRcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgX19mdW5jX18sIGRldl9yZWFkX25hbWUoZGV2KSwgaWQpOwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb250aW51ZTsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0ID0gdWNsYXNzX2ZpbmRfZGV2aWNlX2J5X29mbm9kZShpZCwgcmVtb3RlLCByZW1v
dGVfZGV2KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICgqcmVtb3RlX2RldiAmJiAhcmV0KSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHVjbGFzc19nZXRfZGV2aWNlX2J5X29mbm9k
ZShpZCwgcmVtb3RlLCByZW1vdGVfZGV2KTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKGRldiwgIiVz
KCVzKTogZmFpbGVkIHRvIGdldCByZW1vdGUgZGV2aWNlICVzXG4iLAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19mdW5jX18sIGRldl9yZWFkX25hbWUoZGV2KSwg
ZGV2X3JlYWRfbmFtZSgqcmVtb3RlX2RldikpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBi
cmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqAg
cmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBzdG0zMl9sdGRjX2dldF9wYW5l
bChzdHJ1Y3QgdWRldmljZSAqZGV2LCBzdHJ1Y3QgdWRldmljZSAqKnBhbmVsKQo+PiArewo+PiAr
wqDCoMKgIG9mbm9kZSBlcF9ub2RlLCBub2RlLCBwb3J0czsKPj4gK8KgwqDCoCBpbnQgcmV0ID0g
MDsKPj4gKwo+PiArwqDCoMKgIGlmICghZGV2KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
SU5WQUw7Cj4+ICsKPj4gK8KgwqDCoCBwb3J0cyA9IG9mbm9kZV9maW5kX3N1Ym5vZGUoZGV2X29m
bm9kZShkZXYpLCAicG9ydHMiKTsKPj4gK8KgwqDCoCBpZiAoIW9mbm9kZV92YWxpZChwb3J0cykp
IHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiUmVtb3RlIGJyaWRnZSBzdWJub2Rl
XG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqAgfQo+PiArCj4+
ICvCoMKgwqAgZm9yIChub2RlID0gb2Zub2RlX2ZpcnN0X3N1Ym5vZGUocG9ydHMpOwo+PiArwqDC
oMKgwqDCoMKgwqDCoCBvZm5vZGVfdmFsaWQobm9kZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgIG5v
ZGUgPSBkZXZfcmVhZF9uZXh0X3N1Ym5vZGUobm9kZSkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGVw
X25vZGUgPSBvZm5vZGVfZmlyc3Rfc3Vibm9kZShub2RlKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICghb2Zub2RlX3ZhbGlkKGVwX25vZGUpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250
aW51ZTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3RtMzJfbHRkY19nZXRfcmVtb3Rl
X2RldmljZShkZXYsIGVwX25vZGUsIFVDTEFTU19QQU5FTCwgcGFuZWwpOwo+PiArwqDCoMKgIH0K
Pj4gKwo+PiArwqDCoMKgIC8qIFNhbml0eSBjaGVjaywgd2UgY2FuIGdldCBvdXQgb2YgdGhlIGxv
b3Agd2l0aG91dCBoYXZpbmcgYSBjbGVhbiBvZm5vZGUgKi8KPj4gK8KgwqDCoCBpZiAoISgqcGFu
ZWwpKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTlZBTDsKPj4gK8KgwqDCoCBlbHNlCj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoIW9mbm9kZV92YWxpZChkZXZfb2Zub2RlKCpwYW5lbCkpKQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUlOVkFMOwo+PiArCj4+ICvCoMKgwqAg
cmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBzdG0zMl9sdGRjX2Rpc3BsYXlf
aW5pdChzdHJ1Y3QgdWRldmljZSAqZGV2LCBvZm5vZGUgKmVwX25vZGUsCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHVkZXZpY2UgKipwYW5lbCwgc3RydWN0
IHVkZXZpY2UgKipicmlkZ2UpCj4+ICt7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDC
oMKgIGlmICgqcGFuZWwpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gKwo+
PiArwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19WSURFT19CUklER0UpKSB7Cj4+ICvCoMKg
wqDCoMKgwqDCoCByZXQgPSBzdG0zMl9sdGRjX2dldF9yZW1vdGVfZGV2aWNlKGRldiwgKmVwX25v
ZGUsIFVDTEFTU19WSURFT19CUklER0UsIGJyaWRnZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
cmV0KQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiArCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXQgPSBzdG0zMl9sdGRjX2dldF9wYW5lbCgqYnJpZGdlLCBwYW5lbCk7Cj4+
ICvCoMKgwqAgfSBlbHNlIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qIG5vIGJyaWRnZSwgc2VhcmNo
IGEgcGFuZWwgZnJvbSBkaXNwbGF5IGNvbnRyb2xsZXIgbm9kZSAqLwo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0ID0gc3RtMzJfbHRkY19nZXRfcmVtb3RlX2RldmljZShkZXYsICplcF9ub2RlLCBVQ0xB
U1NfUEFORUwsIHBhbmVsKTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gcmV0
Owo+PiArfQo+PiArCj4+IMKgICNpZiBJU19FTkFCTEVEKENPTkZJR19UQVJHRVRfU1RNMzJGNDY5
X0RJU0NPVkVSWSkKPj4gwqAgc3RhdGljIGludCBzdG0zMl9sdGRjX2FsbG9jX2ZiKHN0cnVjdCB1
ZGV2aWNlICpkZXYpCj4+IMKgIHsKPj4gQEAgLTUzMiw2ICs2MjgsNyBAQCBzdGF0aWMgaW50IHN0
bTMyX2x0ZGNfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZGlzcGxheV90aW1pbmcgdGltaW5nczsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgY2xrIHBjbGssIGJj
bGs7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHJlc2V0X2N0bCByc3Q7Cj4+ICvCoMKgwqAgb2Zub2Rl
IG5vZGUsIHBvcnQ7Cj4+IMKgwqDCoMKgwqAgdWxvbmcgcmF0ZTsKPj4gwqDCoMKgwqDCoCBpbnQg
cmV0Owo+PiDCoCBAQCAtNTY4LDcgKzY2NSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHRkY19wcm9i
ZShzdHJ1Y3QgdWRldmljZSAqZGV2KQo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoCBw
cml2LT5od192ZXJzaW9uID0gcmVhZGwocHJpdi0+cmVncyArIExURENfSURSKTsKPj4gLcKgwqDC
oCBkZWJ1ZygiJXM6IExUREMgaGFyZHdhcmUgMHgleFxuIiwgX19mdW5jX18sIHByaXYtPmh3X3Zl
cnNpb24pOwo+PiArwqDCoMKgIGRldl9kYmcoZGV2LCAiJXM6IExUREMgaGFyZHdhcmUgMHgleFxu
IiwgX19mdW5jX18sIHByaXYtPmh3X3ZlcnNpb24pOwo+PiDCoCDCoMKgwqDCoMKgIHN3aXRjaCAo
cHJpdi0+aHdfdmVyc2lvbikgewo+PiDCoMKgwqDCoMKgIGNhc2UgSFdWRVJfMTAyMDA6Cj4+IEBA
IC01ODksMTMgKzY4NiwzNSBAQCBzdGF0aWMgaW50IHN0bTMyX2x0ZGNfcHJvYmUoc3RydWN0IHVk
ZXZpY2UgKmRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOwo+PiDCoMKg
wqDCoMKgIH0KPj4gwqAgLcKgwqDCoCByZXQgPSB1Y2xhc3NfZmlyc3RfZGV2aWNlX2VycihVQ0xB
U1NfUEFORUwsICZwYW5lbCk7Cj4+IC3CoMKgwqAgaWYgKHJldCkgewo+PiAtwqDCoMKgwqDCoMKg
wqAgaWYgKHJldCAhPSAtRU5PREVWKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJy
KGRldiwgInBhbmVsIGRldmljZSBlcnJvciAlZFxuIiwgcmV0KTsKPj4gLcKgwqDCoMKgwqDCoMKg
IHJldHVybiByZXQ7Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogVHJ5IGFsbCB0aGUgcG9y
dHMgdW50aWwgb25lIHdvcmtpbmcuCj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqIFRoaXMg
aXMgZG9uZSBpbiB0d28gdGltZXMuIEZpcnN0IGlzIGNoZWNrcyBmb3IgdGhlCj4+ICvCoMKgwqDC
oCAqIFVDTEFTU19WSURFT19CUklER0UgYXZhaWxhYmxlLCBhbmQgdGhlbiBmb3IgdGhpcyBicmlk
Z2UKPj4gK8KgwqDCoMKgICogaXQgc2NhbnMgZm9yIGEgVUNMQVNTX1BBTkVMLgo+PiArwqDCoMKg
wqAgKi8KPj4gKwo+PiArwqDCoMKgIHBvcnQgPSBkZXZfcmVhZF9zdWJub2RlKGRldiwgInBvcnQi
KTsKPj4gK8KgwqDCoCBpZiAoIW9mbm9kZV92YWxpZChwb3J0KSkgewo+PiArwqDCoMKgwqDCoMKg
wqAgZGV2X2VycihkZXYsICIlcyglcyk6ICdwb3J0JyBzdWJub2RlIG5vdCBmb3VuZFxuIiwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19mdW5jX18sIGRldl9yZWFkX25hbWUoZGV2KSk7Cj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgICvC
oMKgwqAgZm9yIChub2RlID0gb2Zub2RlX2ZpcnN0X3N1Ym5vZGUocG9ydCk7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgIG9mbm9kZV92YWxpZChub2RlKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqAgbm9kZSA9
IGRldl9yZWFkX25leHRfc3Vibm9kZShub2RlKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0g
c3RtMzJfbHRkY19kaXNwbGF5X2luaXQoZGV2LCAmbm9kZSwgJnBhbmVsLCAmYnJpZGdlKTsKPj4g
K8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9k
YmcoZGV2LCAiRGV2aWNlIGZhaWxlZCByZXQ9JWRcbiIsIHJldCk7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBlbHNlCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgIH0KPj4g
Kwo+PiArwqDCoMKgIC8qIFNhbml0eSBjaGVjayAqLwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiArCj4+IMKgwqDCoMKgwqAgcmV0ID0gcGFuZWxf
Z2V0X2Rpc3BsYXlfdGltaW5nKHBhbmVsLCAmdGltaW5ncyk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJl
dCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gb2Zub2RlX2RlY29kZV9kaXNwbGF5X3Rp
bWluZyhkZXZfb2Zub2RlKHBhbmVsKSwKPj4gQEAgLTYyNCwxMSArNzQzLDYgQEAgc3RhdGljIGlu
dCBzdG0zMl9sdGRjX3Byb2JlKHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4+IMKgwqDCoMKgwqAgcmVz
ZXRfZGVhc3NlcnQoJnJzdCk7Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklH
X1ZJREVPX0JSSURHRSkpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IHVjbGFzc19nZXRfZGV2
aWNlKFVDTEFTU19WSURFT19CUklER0UsIDAsICZicmlkZ2UpOwo+PiAtwqDCoMKgwqDCoMKgwqAg
aWYgKHJldCkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2RiZyhkZXYsCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIk5vIHZpZGVvIGJyaWRnZSwgb3Igbm8gYmFja2xp
Z2h0IG9uIGJyaWRnZVxuIik7Cj4+IC0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChicmlkZ2Up
IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gdmlkZW9fYnJpZGdlX2F0dGFj
aChicmlkZ2UpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+CkFw
cGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
