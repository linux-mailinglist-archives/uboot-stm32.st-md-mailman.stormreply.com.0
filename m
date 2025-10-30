Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72769C1ECB4
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Oct 2025 08:35:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86663C62D85;
	Thu, 30 Oct 2025 07:35:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D32B7C62D81
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 07:35:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U7Vs2v1277789; Thu, 30 Oct 2025 08:35:39 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013062.outbound.protection.outlook.com
 [52.101.83.62])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a3be3nst9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 08:35:39 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/Jnoa04y+ggFDmBeNPPNrJeuhncPuRrt7RH//95/tUXgv6WOXxYpweCL6X8DnT+KLz80sDGIstUuCshh0O6VSvRX/2y7PaLb7xIDX2T5aOZEeLDuSpWo9rVGrFzohx79FiZz5PeiEslI2W8puT2c6z2BNNd/3ENoVTpb8L7kAmIidGK9b+PEwylVAyTU1ay9rfJZ2pB+ithfmCHAIyaREt5bOaEaxjiQRaayJ1g8EzelZpYBPr2k6vA270vwGnsKe+Ytpq3tigu8mn0WY+Oqdjgj+JwRyk06GYCp9FqZTyPDEWjyIW6l+tcZikSIa86qVCa7sky5wumvHVfJAk65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cX0/EoG5v5xbMcDcgUtVpW6lAVD8yEZfimwyhP4dpZ4=;
 b=ZRnqbyrsditKZFv8k23W9c+P3ZMDwj50PUF5OHnUwGyd/7NRolszY+ps/jj+EjYQIXPdouQ7OGzPAThZaBRjVmB0ofTygvX6qcKZ8UrQH4Bh4TCtX4ufKmsI8BmDWsQCFMl3Lp6A8r4GTzQ0kqmJk9I1c8qbCBXwMT2hyQpAVULBnvds74amOET5DpBQzLRO1d2OaCLbH05Vl1LLh+NyJzASxksDefFSXL5ZuUgobkkpowxMu627d4axo+UKO7BbLIEJpqLclmvcsG1GE4xmPxSp2fTtB1XYhfKe8oVWZ1wv7M/aZfuFeKuTJ0sn9H9EMfX/O6V3tjSAF9S6ay9sYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cX0/EoG5v5xbMcDcgUtVpW6lAVD8yEZfimwyhP4dpZ4=;
 b=Ku2Te2s2PGB+NjfQiT0URXUqmd+dQIPMdxWFpsP4LzU/9mFIaHDhpD0g7umYKIP0QRmeStwWDuNCrLiPWqOF6Mf2Ln6Y58pzeezvuBmmGKO2gFw5tY/G+5EYn9PknNviNmik9A+i2PQ9LVBFzynigWCQP8kB8g8KNrqGNNELTiZaophwzquuGWBvOCa0EBKjiCwZu8Bb10jFl3CZchamlmGa9sU6ivt5PpOwH7PIJcmohEHZ6CJLW06u5gF23xgTZPUMXZaMpCsKaNCbdtt4ljgmxpHRD193ItFes7TGn+sW/NDHw0wcLUuIN78bLfmocmhOOwm7PzbtDMDF3Q1akg==
Received: from DU2PR04CA0182.eurprd04.prod.outlook.com (2603:10a6:10:28d::7)
 by DBAPR10MB4010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 07:35:36 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::f4) by DU2PR04CA0182.outlook.office365.com
 (2603:10a6:10:28d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Thu,
 30 Oct 2025 07:35:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 07:35:36 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:33:20 +0100
Received: from [10.252.10.82] (10.252.10.82) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:35:34 +0100
Message-ID: <216e13a1-7843-4349-9266-a2b0e901a085@foss.st.com>
Date: Thu, 30 Oct 2025 08:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250904-master-v3-1-b42847884974@foss.st.com>
X-Originating-IP: [10.252.10.82]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|DBAPR10MB4010:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe213e1-5c16-49a9-6779-08de1786eaaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3prRnZWbko2Y3lWYUNSeUJ2Zk56KzhyWXd4MDV2ZTRtYWxZckFKMURDalhE?=
 =?utf-8?B?YUFPV1grem9UbDl1VmI5bEk4TTlld0Z1dG5iTjJpdVBkNlF4aDh6UCtlNS9N?=
 =?utf-8?B?bllDT3pIK254VU9LWmNZTnVWSndDd2pNQXZoMU5QUXJhR3RuakdhT0pyb3kv?=
 =?utf-8?B?MUk5Q1dtNjkwV3prL0pyR0tzTUtwMzRzV0dPcDNlQ2tRVFdzWlBBZFZOQWJZ?=
 =?utf-8?B?VzFER1BOQmdxUVZwZVNYdkJtMW9lWDZYZTF1dWdGZStSNFhpRlozQ0UvMWx4?=
 =?utf-8?B?TkJXeVdPcUhrYnZkRC83WjZvSzgrdFJRMHZrK2xtZzJEQzNXNElxWFJ1OGlu?=
 =?utf-8?B?bDl1bGJ6ZS9yd1pjSXkyK2U1aHlSS0xtRmdVLzJHeUpOYmNBcWZMWVA3SHMw?=
 =?utf-8?B?MUdGVUYyaEM4YVMzQS9NTzY3WHIrYUFGQkZpT1NDTGRUNmR4bW92cE5SWVho?=
 =?utf-8?B?bmwrbzVKRkJsanBIZm5saWRxNzJjS0xteHpEVFhOdDFCUzR4ZEdkWXVaSGxp?=
 =?utf-8?B?NFZPRzBtTWNJcnNxSG5XelN1cklST2VoVm1RYmxwNFROMWZKb0hhR1lkZlgy?=
 =?utf-8?B?RHoyQmhQVnNxT0NVVWo4ZkNSZG1ySFFVbXhXZ2RzbUt2K1FsZk9jc0RsRXk4?=
 =?utf-8?B?b3NHTmJoU1dIcTN6eWdhZjBKQ2g5emFnR2YzN2twNUtSdEJxRDBuRFAwakV3?=
 =?utf-8?B?dWVxS2I1NU9zaU9JUHJLMDhIY2hVN0NHcVlhMVQ2a1VGWkJIVWttYnNvdDdV?=
 =?utf-8?B?UHVSbG9uTFVHbEJLMWtEVlcvTWhmZUpOSUpyWFBiQm5TMWNzWEN3NGxkTW11?=
 =?utf-8?B?cXBoV2k2YzFqUTRFZUg1K3plMm1CWHJYeis0dUltcG5nUzBmSHZjcTQrTHN0?=
 =?utf-8?B?eGRIcENqZnErZ2RpaHh0UjN2TTN3dExaRHM1RkZCWCtHVzRtdXFHUWwwakxX?=
 =?utf-8?B?cFV4Y3JBejBvOE00UndSQnVHMUZ3elNTNnNKWnlsYzl1dEtYVUxmU01MazV6?=
 =?utf-8?B?TlVuWUxiNlpPSmNVemJ2L0doWlFqYnBORUYyaURCU2FsK21WVW9QaXgxVWVq?=
 =?utf-8?B?SEdLcmZaTyswTU1yenRoa1c5RDYzc0ZidXBNMnlWcjkvWVNRRmdPU1BpVE8y?=
 =?utf-8?B?T0xNclppRE1MM0lQMlJRcE9aY0FQZXNScitrNDlEWUxDZ1dPZ1hLOXFlcitK?=
 =?utf-8?B?dkZJKzhaQ1VYMER3amlxazhCWW41SDlnaXlRZjdmYXpQS01WTEJiVngxU28v?=
 =?utf-8?B?UzhKVXlZUkVBY2VCMkhYY3dNL2RLQVdHa0hwVkMxVnAzZlhYdTVNSGp3aTl1?=
 =?utf-8?B?UGUvZFdxbmNidzltcUxqVWVseG1hZzJQeTMwMXFuNHh2L2g0ZHhqRGF0VzFi?=
 =?utf-8?B?MnlTcFNzS1JpQzUvRHl1bHhRRWxpZVRCUXY1UjlUMnUvVFNUVFlTRGlqWFBD?=
 =?utf-8?B?UVlpN1VCSE5jNCt4T091VFpITG5WekllR3R2NG9KdFdaS29uV0FscGs2QSt6?=
 =?utf-8?B?TmJkNVlsb3dkTkJ1U21LSzQrSUdYanltQllXd2FwRWRCeFNuQVVGa1BVczRx?=
 =?utf-8?B?OG0rTmlCd0tTUEhvMCtDMWsyQlhHcEhrR293Ly9iN2FvMWhtUTl3VWhwcUVY?=
 =?utf-8?B?VHlSb0JIQ2JCZWZqQ25wcDg2US9jajNZcmlTSVhjU0RHSE1Xbm4rRlROZHJ6?=
 =?utf-8?B?TkZzeWIzQjF1VDlzLzEzNDFjQ3VjK2ZETDg0Q2RFUTNTbnpCS3BnelMvSmxV?=
 =?utf-8?B?dXo2NUZpYzlvS3JtODdoa2xPcWZQYXBXL0gwcnl2aDNRZC8wRGZObXUrTENB?=
 =?utf-8?B?Wkp4ekROcmRBWjVpS2JHbnhncnZVRE9yTHgzWlM1Z2RQTzYvY0R5NGJDMC9K?=
 =?utf-8?B?b1l0a0IrYU5CV3RXM1cweWJ4cE5OU2UvRTF2citYVDI4SmNSMng1YTJBbFNq?=
 =?utf-8?B?YkovWmxLU1dxYUIvTmtkdXpHVENBTnk5cmNIcERtVWxnRTEzK2dUM3llc0ZR?=
 =?utf-8?B?TERwelBZYUN5cTN5TmlWQk1qOXBGNEF3Y29SaTd2MkNOZ0ZNVmozMXdCaDJN?=
 =?utf-8?B?bHFGREU0cVBjaG9aL3IzR0cxQzZob3NCL3ZxLzkrWlg2MHdFeWdxL1JvNkhV?=
 =?utf-8?Q?xcuuyheA8mVH48qcIGXhP5rTW?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 07:35:36.1940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe213e1-5c16-49a9-6779-08de1786eaaa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4010
X-Authority-Analysis: v=2.4 cv=JMU2csKb c=1 sm=1 tr=0 ts=6903154b cx=c_pps
 a=RtmOKfXeDbbZjWwzFrWVdg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=oAfE_gMxGAYA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=5-UEqyCUgD__VgFuBE0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: iTeX2i4-0xUePe6yd8lgOU2v4HVN41Mi
X-Proofpoint-GUID: iTeX2i4-0xUePe6yd8lgOU2v4HVN41Mi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MSBTYWx0ZWRfXwknwAj0G1gbX
 MgYw4mxnUsQ4KA7yBzlRYoTICwdZigeUR9s3JPVAbPndyVbjn1ej6K2SVs/v4VG3k9eZxWAyDzV
 tic06Ge6BiDjUQVofotYolrA41P3Gp7O5DpNmYgJoq9dE8EhPdismjUGejh/5l8a+XYFqtp5fOd
 ZbvzrGKxWaK6Ru+4ZoSC5U4PVvApxsgAEZeLlh4Sp21oKN7rUZxqA6DBd95JAoO8OzaFDUJPQze
 g1zRYpUcHD47zDVRxB9YHJ5MNdx47ee0gGGBDKonuUR29hvVn52zgQrhJN7kQcnvYe8j8BfHppL
 qYUygQ6s04GyByldSiupwoG5RvqejgguYC/expaIybFGJR0BrNicnWwz4UVrExSaSSUe3KLp7tG
 CbES8HTCAA930i8CIcY21P4xPIKyrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1011
 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300061
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKUmV2aWV3ZWQtYnk6IFlhbm5pY2sg
RmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkxlIDA0LzA5LzIwMjUgw6AgMTQ6
NTMsIFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBUaGUgIkRpc3BsYXkgVGltaW5n
cyIgaW4gcGFuZWwtY29tbW9uLnlhbWwgY2FuIGJlIHByb3ZpZGVkIGJ5IDIgcHJvcGVydGllcwo+
IC0gcGFuZWwtdGltaW5nOiB3aGVuIGRpc3BsYXkgcGFuZWxzIGFyZSByZXN0cmljdGVkIHRvIGEg
c2luZ2xlIHJlc29sdXRpb24KPiAgICAgICAgICAgICAgICAgIHRoZSAicGFuZWwtdGltaW5nIiBu
b2RlIGV4cHJlc3NlcyB0aGUgcmVxdWlyZWQgdGltaW5ncy4KPiAtIGRpc3BsYXktdGltaW5nczog
c2V2ZXJhbCByZXNvbHV0aW9ucyB3aXRoIGRpZmZlcmVudCB0aW1pbmdzIGFyZSBzdXBwb3J0ZWQK
PiAgICAgICAgICAgICAgICAgICAgIHdpdGggc2V2ZXJhbCB0aW1pbmcgc3Vibm9kZSBvZiAiZGlz
cGxheS10aW1pbmdzIiBub2RlCj4KPiBUaGlzIHBhdGNoIHVwZGF0ZSB0aGUgcGFyc2luZyBmdW5j
dGlvbiB0byBoYW5kbGUgdGhpcyAyIHBvc3NpYmlsaXR5Cj4gd2hlbiBpbmRleCA9IDAuCj4KPiBS
ZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMt
cG91QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9jb3JlL29mbm9kZS5jIHwgMTcgKysr
KysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY29yZS9vZm5vZGUuYyBiL2RyaXZl
cnMvY29yZS9vZm5vZGUuYwo+IGluZGV4IGUwNDBlM2YyODA2ZmZlNzRjNThkY2Q4MmYzNjMwNzM1
MWFjZDVhOTkuLjVhNzIxYjQ2ZTVhMzIxNGU3YmQ0Mzc3Mzk3NzYzNjJjMmQyMmEzYzkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9jb3JlL29mbm9kZS5jCj4gKysrIGIvZHJpdmVycy9jb3JlL29mbm9k
ZS5jCj4gQEAgLTEyMjEsMTMgKzEyMjEsMTYgQEAgaW50IG9mbm9kZV9kZWNvZGVfZGlzcGxheV90
aW1pbmcob2Zub2RlIHBhcmVudCwgaW50IGluZGV4LAo+ICAgCWludCByZXQgPSAwOwo+ICAgCj4g
ICAJdGltaW5ncyA9IG9mbm9kZV9maW5kX3N1Ym5vZGUocGFyZW50LCAiZGlzcGxheS10aW1pbmdz
Iik7Cj4gLQlpZiAoIW9mbm9kZV92YWxpZCh0aW1pbmdzKSkKPiAtCQlyZXR1cm4gLUVJTlZBTDsK
PiAtCj4gLQlpID0gMDsKPiAtCW9mbm9kZV9mb3JfZWFjaF9zdWJub2RlKG5vZGUsIHRpbWluZ3Mp
IHsKPiAtCQlpZiAoaSsrID09IGluZGV4KQo+IC0JCQlicmVhazsKPiArCWlmIChvZm5vZGVfdmFs
aWQodGltaW5ncykpIHsKPiArCQlpID0gMDsKPiArCQlvZm5vZGVfZm9yX2VhY2hfc3Vibm9kZShu
b2RlLCB0aW1pbmdzKSB7Cj4gKwkJCWlmIChpKysgPT0gaW5kZXgpCj4gKwkJCQlicmVhazsKPiAr
CQl9Cj4gKwl9IGVsc2Ugewo+ICsJCWlmIChpbmRleCAhPSAwKQo+ICsJCQlyZXR1cm4gLUVJTlZB
TDsKPiArCQlub2RlID0gb2Zub2RlX2ZpbmRfc3Vibm9kZShwYXJlbnQsICJwYW5lbC10aW1pbmci
KTsKPiAgIAl9Cj4gICAKPiAgIAlpZiAoIW9mbm9kZV92YWxpZChub2RlKSkKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
