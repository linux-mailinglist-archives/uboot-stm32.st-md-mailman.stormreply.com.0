Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F3B43626
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 10:43:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1FCBC3FAC9;
	Thu,  4 Sep 2025 08:43:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A659C3FAC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 08:43:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5847uNh9000507;
 Thu, 4 Sep 2025 10:43:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AgU3Y2TkR6HrngtmhzHC4IAOVsvdcpIlBoJiYdYviaE=; b=3aAm5bEj+lcgjopS
 GSDjk72C2pkpk+IM0HNpBnmtIvUQJr8jlu4CNsBEQVDoN66+x0/qqeoSQVjNEqPV
 MA7sCUW9yTCpE4P6gEb5FItVgr0p18YE/gssrBxw18MyPn5Q9sLOqpYxO07tQMMw
 QOJO6hLP7nRaS+FsbjV1ThYhUN+i+4vZ1ZL1A+ChlOmzflkdlAUCtDlj87U47Qd2
 WMwGfdW4AyzUEqcoxHfWkHCTP2GsB37V2DU1pRnxLIkyx7Lvjl5o2P7t9bnf3MMi
 LPHXUTJnaBoP6yMzxdxREa3vrhah+viakwxSR6tjFchqbFgIOvo/RenkW8pL01ht
 RcuUVA==
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxmyfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 10:43:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRpy02n54C0zBQYNSfyrnko0rdzNZRmhw4ohWwjH3Sk8gZPTDSUdol+6eSq4vuaKJEXoYo0vaYz2ryGsPwMzdPhMw9pNLg4SzDkwEQzBetRAJ3mpEqAmhCoQUnI1V/lrm5d6m3IORqoYiMNzpOQEk6FY/yUMYa0BO7hGic8kHDXgw27+hqDHiw2TbIsKYw2hrOMfm1WArU87bwNBY9xsh9yWuKBAkAlqOFT+weQJSWir9mQSdvcle8KVsrPJr5bTdgjPQ04+9JSPo7JSBu9NxGscE/tPRz1i7R+U/jE8Ie2Owe7BbxsBfcELnXGHnxgRG1TV+W53KFQrdCAa8iXIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgU3Y2TkR6HrngtmhzHC4IAOVsvdcpIlBoJiYdYviaE=;
 b=kSf+7Ayflmed5Dv5b6IHG5XlBsGDMbJJt15AHL9/jZHr6I8x1ZF6mN5g6h35lC0uW5iEDzrwXPg9EPekZep5YZG8bUxLRJCQeY3OVRM8Qee2F0Guzfnbb1eVwI5HDIOFaUv1Enf0MBW8khedHlq2jl/fBI2taLpd8Xobciw4eQ42NHo7ZOEnHKDroyhChdbJNRD/XCLIinL6w1PUzjG5BW/+3LEYg85YsImZxxJsOO9dHWGZrR0TAp6rkiEVS8tNOH5NK4OgRzPWpc/sUemNjf3iCfLodbZ++cbA/64+1+m0CNKx0u8yorS6piCVWj7YSe3Sdt2k8kFf0ah7il7eyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgU3Y2TkR6HrngtmhzHC4IAOVsvdcpIlBoJiYdYviaE=;
 b=UAlRyX48hkuUnMv1WMYz+4ZMMu0u6dlnaDyTAxt8roY9RORKOsuyKQD617IwRMl9C/lrrfAuV7C3TVwMco4axOacR+JZopHTqb0WuZw6TQhwtoGd/z8ANRyxWcTRG4UI/gtFTBck/FGnovvRPNpff9X90oTHor1e+M1yYnTKtKE=
Received: from AM0PR02CA0193.eurprd02.prod.outlook.com (2603:10a6:20b:28e::30)
 by VI1PR10MB3647.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:140::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 08:43:05 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::c3) by AM0PR02CA0193.outlook.office365.com
 (2603:10a6:20b:28e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 08:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 08:43:05 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 10:40:43 +0200
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 10:43:01 +0200
Message-ID: <613bfa1e-6a86-4268-bcbf-9ca0da8bd38a@foss.st.com>
Date: Thu, 4 Sep 2025 10:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yannick FERTRE <yannick.fertre@foss.st.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
 <20250903-master-v2-1-5cdf73bff42c@foss.st.com>
 <bd1f00f3-5221-4825-b793-5bf3682e4108@foss.st.com>
Content-Language: en-US
In-Reply-To: <bd1f00f3-5221-4825-b793-5bf3682e4108@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|VI1PR10MB3647:EE_
X-MS-Office365-Filtering-Correlation-Id: 509f2cd9-8796-4fdd-9a2f-08ddeb8f10d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aE5taFphTUNFVTNsdVFFYXA0M01ZTnpWejMrVjhjeUljaEMzRnRpR0lnNmg1?=
 =?utf-8?B?OEFHd0pFNnFmSlJXdTk5dksxV3BuaFQ3Ti8xbEVzczBQSXhVVVlUMjYvRXYv?=
 =?utf-8?B?TDRoYitYMThTV01MQTJoaGtDTVl1VVBsZkR6V0x0NEVGL200VWFNUHBXcXd0?=
 =?utf-8?B?LzdLZlNreTk0YmEwVGlTT0tSRUJJMEN4d0ZEQ1JEYVVHM0NEdFhMYk1CSi9n?=
 =?utf-8?B?Y0dObXA4VDJLZ3BCZGx4dVdCRllrSFdSdmxNZ0tWTnp3eE1zZjdKTk04R2pE?=
 =?utf-8?B?aWVUU2pEYTlTR2hBbnV2TUE5VTBzS2tMMGFXbndtVnA3OUgwWUR6SXF2RHJ0?=
 =?utf-8?B?OEFYQndrelRHRnowOEJndks4NTBiWmVFZzJCWFFjYXk3ek85RGJTVWtaZEN1?=
 =?utf-8?B?QUVTTS9JV2lsdTJzN1RPK2YwUTJ2OVRyTEZQNHV3RTd1Zm9yU2J2T2ZKNGJT?=
 =?utf-8?B?SjVvR3h1MkNkVmVISXp4bytNT3NPMWIrOTFxY1BzcW1HRkZINU4wYUdYU09a?=
 =?utf-8?B?VkVXOG4xWmc4c1FWK2ZLMHAwUjFIeitSMVY0WXFtYlBnTnJhdldOM1Z1WXNR?=
 =?utf-8?B?VmtySTVXejBLVlo4Y2pDbWsxOW1tdWZ1RSswSWwzdHYvYkNvNlVjTnZ4M0pT?=
 =?utf-8?B?YkpISzVMYk5xUkJTTmQxdVJvSjVqckIycTB4VnNMSThXdmRRT2U0d2VzQ0hw?=
 =?utf-8?B?WlEwSlZvU1hqNW5SOGRUNmZYOW5RN2ZsdEE2Nm5xTnRiK0xyWDRuMlk0dmdU?=
 =?utf-8?B?S1pwZmxFNDV4Ui9jUSt3UkUyVmd5dFJGcDE3UzVMR2JIYlFMNFRCMExiMEhT?=
 =?utf-8?B?bmhYcDhZT0ZYM1kwZkJFUCtvWm85Qi9xWVZqakloYjkrTGE5MjR5UHlRWUF1?=
 =?utf-8?B?QzBocWwvbmpJNnZlVmFERjdza1M4LzBoWHdDN1pITEVURWhMdGdYM3hIdnd1?=
 =?utf-8?B?MXRuZlFKcTRxSExTUllndXo3UVhJQUI1dkFUazJaVjVYcmtnRHdOQ2Z0b3pX?=
 =?utf-8?B?T2d3SXhnTDIrMG9CUWNqR00xZ29hbG80MjFMbFRRR21wbTJpSXlzSDBQWXk2?=
 =?utf-8?B?SExJQ1dTaC9NNGdlSlVvN3Z4TFF0eFVabnNYRzVrYThheGxWMGVzYVJEWTZE?=
 =?utf-8?B?TU9wS25vRnFZQlFNcHYzSmc5dXB3UFd3Mk91TytvdnNuT2Qvamt4VjRhcEVa?=
 =?utf-8?B?LzRiMVpUdzJzSHREMDhSbUI3SytVemlLeUsrWU5BY1ZOVXRMTW5KRkVvTUMz?=
 =?utf-8?B?QjV1bjJDOXBtZDA1OHVkRVNLZ29MMnYzQzJOMllKUWtpQUZCb29qT0VOMjBj?=
 =?utf-8?B?b2NTU3Bad1FObVVGQnpaNmRvbzNEODdOcmp1azZsWlBvQ1VKSDdMMVZBNnUr?=
 =?utf-8?B?VkpKMDViZlo4cmlobk15OUh6LzBmZ2Z1aXZ5YXZGRUZtbDdyZGpQZ2crK3hp?=
 =?utf-8?B?SStCeWkxeDFQbUVTSGw3UWFNZWhZTXZoRjNZQ2ZiSFY3ajBWWGdwVUhZZjBO?=
 =?utf-8?B?RFJZMlExRE9aUExZYndRR3cyTlZ6UEtoN0dtd2lHMU9zSzcvMktnZThtVC9Z?=
 =?utf-8?B?ZE9Wb0Y4WkREYnpadTNWNEdhQ0k4SnVmeWxOelBrMkpnNERZM0pxTERRVThw?=
 =?utf-8?B?ekc3N0FkVU0veVhSQ3ROb1pwTFpteGhvdGdEUFR5M0p6L0JPYmdrbzByU2FV?=
 =?utf-8?B?NUxCUnE4NTJ1a0pWRUxPbWlBb0k2d0p4bnpudXkxS3RRRGpWOWhUV21kTDhp?=
 =?utf-8?B?MGlkWHpQdVNSNnlqK2E0T25BNnJHbWJIRHF6NHlFaFRNRm0yY0JYemdjRnhJ?=
 =?utf-8?B?d1pyaTB3MWlYMFZnbHJhUSt0Y255alVZTDVFVFJQNWtwcnpZaTA2VTRNVFd1?=
 =?utf-8?B?TWV2MEhacy9Hc284VVBmbzM2eFZNcXZ4enljbFB2WUFqM2p2VGVtS1E1YXRw?=
 =?utf-8?B?VUsyY0RxR2tWTnFuanVQLzNLcFBmMEZhUi9lYlY0MXRrc1N3UDNuMWkrNjNs?=
 =?utf-8?B?clBDN1VuNUk3YmZXVjROUWlqc2IzNUxLWGhrMTFFUTdyTVZ4K1JzQVJkWi9Y?=
 =?utf-8?B?MnlZc1NOR0w0RlNSNWJXbUtXVzJFeFFZUnNoQT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 08:43:05.1061 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 509f2cd9-8796-4fdd-9a2f-08ddeb8f10d8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3647
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNSBTYWx0ZWRfX71022aTg44R6
 n5u1uMsclegwkckW57EEfoGcJXg9iLQStXsdS5gUfJUVZpENNG5hr2+2/HcWPs0ag4QIOTtaINx
 6WtCbvMAO+Ux1PWxyPVUmu1d+ZJBB2e2U5k4he1BHrKje0UFoU9mn0M5J2kMbBKtUTpk/cfFM8S
 4pAyEg71aYwiurz+lutVKxM3H7YZHhv1/jPUp8vbTvjtG5aF5V/wDmhefzqjbmRU9Cu7+dyIVh5
 S6ywqDtthL3Hhm4Qdde+FlFcQiIgWT1h7TH/tx+eFdl4IWg6soewrxKzx/jGVOogjFkrU2nPwVC
 DILOt2YmSf/ssc1RcLLnbw89wIXseEfZVFYWMK1a2ruh/Tn1OlHfb4c8zFWs9iV30k4QAM3aNys
 C58b4WaM
X-Authority-Analysis: v=2.4 cv=dqLbC0g4 c=1 sm=1 tr=0 ts=68b9511c cx=c_pps
 a=aLbkpYKFGIFmC0qGMhqYnw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=P2A4Zi-lJHsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=hFSHfaqsZySKDyy9tMUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: OeWYzXZ3_bXfUdDYAbY-yPMkOL8FrlnN
X-Proofpoint-GUID: OeWYzXZ3_bXfUdDYAbY-yPMkOL8FrlnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300025
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 1/7] ofnode: support panel-timings in
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

U29ycnksIGJhZMKgIGFuc3dlciBvbiB0aGlzIHBhdGNoOgoKUmV2aWV3ZWQtYnk6IFlhbm5pY2sg
RmVydHJlPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKCkxlIDA0LzA5LzIwMjUgw6AgMDg6
NTksIFlhbm5pY2sgRkVSVFJFIGEgw6ljcml0wqA6Cj4gSGkgUmFwaGFlbCwKPgo+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoLgo+Cj4gQWNrZWQtYnk6IFlhbm5pY2sgRmVydHJlPHlhbm5pY2suZmVydHJl
QGZvc3Muc3QuY29tPgo+Cj4gTGUgMDMvMDkvMjAyNSDDoCAxNDoyNSwgUmFwaGFlbCBHYWxsYWlz
LVBvdSBhIMOpY3JpdMKgOgo+PiBUaGUgIkRpc3BsYXkgVGltaW5ncyIgaW4gcGFuZWwtY29tbW9u
LnlhbWwgY2FuIGJlIHByb3ZpZGVkIGJ5IDIgCj4+IHByb3BlcnRpZXMKPj4gLSBwYW5lbC10aW1p
bmc6IHdoZW4gZGlzcGxheSBwYW5lbHMgYXJlIHJlc3RyaWN0ZWQgdG8gYSBzaW5nbGUgCj4+IHJl
c29sdXRpb24KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGhlICJwYW5lbC10
aW1pbmciIG5vZGUgZXhwcmVzc2VzIHRoZSByZXF1aXJlZCB0aW1pbmdzLgo+PiAtIGRpc3BsYXkt
dGltaW5nczogc2V2ZXJhbCByZXNvbHV0aW9ucyB3aXRoIGRpZmZlcmVudCB0aW1pbmdzIGFyZSAK
Pj4gc3VwcG9ydGVkCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdp
dGggc2V2ZXJhbCB0aW1pbmcgc3Vibm9kZSBvZiAiZGlzcGxheS10aW1pbmdzIiAKPj4gbm9kZQo+
Pgo+PiBUaGlzIHBhdGNoIHVwZGF0ZSB0aGUgcGFyc2luZyBmdW5jdGlvbiB0byBoYW5kbGUgdGhp
cyAyIHBvc3NpYmlsaXR5Cj4+IHdoZW4gaW5kZXggPSAwLgo+Pgo+PiBSZXZpZXdlZC1ieTogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+
Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2NvcmUvb2Zub2RlLmMgfCAxNyArKysrKysrKysrLS0tLS0t
LQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY29yZS9vZm5vZGUuYyBiL2RyaXZlcnMvY29yZS9v
Zm5vZGUuYwo+PiBpbmRleCAKPj4gZTA0MGUzZjI4MDZmZmU3NGM1OGRjZDgyZjM2MzA3MzUxYWNk
NWE5OS4uNWE3MjFiNDZlNWEzMjE0ZTdiZDQzNzczOTc3NjM2MmMyZDIyYTNjOSAKPj4gMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvY29yZS9vZm5vZGUuYwo+PiArKysgYi9kcml2ZXJzL2NvcmUvb2Zu
b2RlLmMKPj4gQEAgLTEyMjEsMTMgKzEyMjEsMTYgQEAgaW50IG9mbm9kZV9kZWNvZGVfZGlzcGxh
eV90aW1pbmcob2Zub2RlIAo+PiBwYXJlbnQsIGludCBpbmRleCwKPj4gwqDCoMKgwqDCoCBpbnQg
cmV0ID0gMDsKPj4gwqAgwqDCoMKgwqDCoCB0aW1pbmdzID0gb2Zub2RlX2ZpbmRfc3Vibm9kZShw
YXJlbnQsICJkaXNwbGF5LXRpbWluZ3MiKTsKPj4gLcKgwqDCoCBpZiAoIW9mbm9kZV92YWxpZCh0
aW1pbmdzKSkKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiAtCj4+IC3CoMKg
wqAgaSA9IDA7Cj4+IC3CoMKgwqAgb2Zub2RlX2Zvcl9lYWNoX3N1Ym5vZGUobm9kZSwgdGltaW5n
cykgewo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGkrKyA9PSBpbmRleCkKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqAgaWYgKG9mbm9kZV92YWxpZCh0aW1pbmdzKSkg
ewo+PiArwqDCoMKgwqDCoMKgwqAgaSA9IDA7Cj4+ICvCoMKgwqDCoMKgwqDCoCBvZm5vZGVfZm9y
X2VhY2hfc3Vibm9kZShub2RlLCB0aW1pbmdzKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmIChpKysgPT0gaW5kZXgpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJl
YWs7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4gK8KgwqDCoMKg
wqDCoMKgIGlmIChpbmRleCAhPSAwKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVJTlZBTDsKPj4gK8KgwqDCoMKgwqDCoMKgIG5vZGUgPSBvZm5vZGVfZmluZF9zdWJub2RlKHBh
cmVudCwgInBhbmVsLXRpbWluZyIpOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoCBp
ZiAoIW9mbm9kZV92YWxpZChub2RlKSkKPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
