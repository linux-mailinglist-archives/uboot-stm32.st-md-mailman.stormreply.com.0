Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0ABC0F999
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Oct 2025 18:19:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CD29C60492;
	Mon, 27 Oct 2025 17:19:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50538C6048D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 17:19:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RGVfMj2243501; Mon, 27 Oct 2025 18:19:07 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011071.outbound.protection.outlook.com
 [40.107.130.71])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a22awaxrb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 18:19:07 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVV40Hv+IWCWwEhu4Y6BdX+vVH5QgWxhhw+WYOUnzFAU+1bv/NM+5pKIaTcQ4bjPNzN3tJuWargs4DufqF26VVaXK8uvUTpMjEHiom2+yFYTjgU0g5N7wFLa4hVppHb7Js4rdaaTKXGZPW9cQnKXq3qGEYCiCow7sJGQYplvEvW5xbzRIFGz8PE66HnqKaaQ2vqfMXbiHNrV47WuSHyDlv83zRo2MI9oH55n/VdhXLWEsUxlKJgzvGVPqwE3pYochLHbhdNbFcSEtgos392ht1LFV87Zr5YCLZ1S5YcmBT6ZGA7VZSUx4kKV3BBoFyHTgZT2nnqcVTRexfCUe7LGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpHPO/3hRlw2pmQnWwEguECY3upqg6ix0dajz6mglcM=;
 b=NEyyjAhPzBd2Xs4l0lbx6px7A9nmXVOH6OLcG9hUEluw0J5q2CWuAUjX3CEyxLJO/BAg0kcn57x8plfDRQrIQ0pjEKyfi2UDFg0MfTv9FBQxdSH9MtGj533pQ1kMBYnlbHjusFqQD0RTOhkcbqG6NBK+5aeRs0v/YIwuAHs7Ys1c2hqg0zFK6ToWc9JjnMhjl3e5g80VruJpwr7HyEAXStkY1w1U50stt3RgSZ7sp2eMRYf0AqQlvi8jgm5OP4PUge8Hr2i6N80vlJabWSMpzovK7g3/mOI2Pk1XBugghf1HZTk8TmpSipH9B//omJEDkZkHoe0Vua2r/XPxJNe3Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpHPO/3hRlw2pmQnWwEguECY3upqg6ix0dajz6mglcM=;
 b=a8z8/GhjDaLwvnp0ZeWIP3V7HNIzYSi7OceW2UkkJ+Cdd11cdLKqoWstBoHMvKpHBEZ6uhgPm04J2oH9a0JJd0FumrGARAGck7hlwBb7t3W4RRin8kuSFAFHZ27qawG80dFKOJCYg/M1Zz7F+x7l5zq/pFTeDIJOTXUWIw3wG7dpfQJTAtGPDnOaPA/g79KHb+txh1E2Yh+X2SVYhD9eOTrm7BvDDB76L4GbdQ/PLA8GHsqoYCgp4DAboA27t5SUiKLh9gXF5EL2b8IXQI/xBierDUHFuPPuO+MOsJ37zeTjpkFR14ZT6TLQpJPSedIDqIyBTkDObk5RAj4wEX9T2Q==
Received: from DUZP191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::6) by
 GVXPR10MB8058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:110::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:19:02 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::5c) by DUZP191CA0042.outlook.office365.com
 (2603:10a6:10:4f8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 17:19:01 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 18:11:33 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 18:19:00 +0100
Message-ID: <4050a7ca-7a3c-45c7-bcfc-ee62caf4a6d6@foss.st.com>
Date: Mon, 27 Oct 2025 18:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214855.181410-1-marek.vasut@mailbox.org>
 <20251023214855.181410-2-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251023214855.181410-2-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|GVXPR10MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 66fd6d9d-6e5d-463e-bce6-08de157cec41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3pqbkdtVmMrUlNYNVhJbmhqOWE5SkcvVDhIdWlFUVB1aDdzUlQ1OXp6WnhM?=
 =?utf-8?B?a2hDd2dwQWJMYlkyMjl1SVlkZ3lNNVhGc3Q0Y1RvOEg5ZGFOdnM0ZlBTb2JI?=
 =?utf-8?B?OXZ0ZjN1VjJWUXJRSVdCMWNwQXJtekN2MURKOUFjRU82MVFDSEFNYzl3ZXIy?=
 =?utf-8?B?UlFUWXdhYk1DMFBtNHBWQnVwU2NCTWpPV0JoSzN1azBESzBZdEFHWFUrbGFa?=
 =?utf-8?B?bUJqeGhGNlVNUEUyZ1ljazZZK1IvUExZaGNwaUt2NC92ekZNcERJcE1hZlJK?=
 =?utf-8?B?dGJZek9SV1FBUlNkanozV3k3dEZXSzJZdkUwNTg5b09sb1NXbGNLVi9rblpi?=
 =?utf-8?B?RklVUGtyVjlkQnZPMWdPa29ZcXNsODZ2bDVPWkhldjZmYlVhQkFOQ0xnMXpB?=
 =?utf-8?B?Ymo3RzhPYitjT2FZVExpb2x1eGxaVzM1WExXTHNuQlJ5dXZTaEwvb0xneWha?=
 =?utf-8?B?VlJGUkJSSEJ1dGdlZyt4dDdtc0VIdy82VHZNWmVyRHN4ME1mVTBaMlA0aS9h?=
 =?utf-8?B?RVFpOHc0RWlIelB4UWtOaWdhbndCVGNBUEpEY2FmYjJyWFFsWXZaTElFMlhp?=
 =?utf-8?B?VFRkenEzcUl3T1NOSUZvL3k1eDJudjZLZmRpWmlLVndnaVVJNXBydTYyWHQz?=
 =?utf-8?B?bDlON0lHbmVrSEJ0aGZHUmorVzNlNTB4blRVT0xuL1M2Rlh4UWM4UDN2TjdK?=
 =?utf-8?B?UW14SnJYZUl3Vm93TjhXWjN2eWlsNUI2NnNWb1U5YnVEenVUdDkrWFoweHZm?=
 =?utf-8?B?ek1xa3k3WlFSV3pKdDlNTXQxNUJEUy96MXZnQi92T1J3bms4ZFVXMTlVLzc5?=
 =?utf-8?B?TVFyY0ZXTzZxUmwzczlwUzE1a203UGppVjhTWFVzNHpYNjhGbHBISjliclRJ?=
 =?utf-8?B?WnREdlJ1KzEzKzNjMEUwbU55cjBiOXlyWTJwSE1tWWhOcDl1Qzd5dXB3ckZC?=
 =?utf-8?B?OGpjRmtsenc0aitKZXlZaVE2V3lOa2xHMWw4M1dEZjJPbzlLYXdpOGdvN0Ni?=
 =?utf-8?B?aHU1RjdUREFJV05ieGRrTXlibjE0cGhlTFVvK2xUTmNkZ0dlNngwbSt5TEZD?=
 =?utf-8?B?MDdobjhzeWpGM0thM3ZMeXh6YUxJOHJOWWxXd3NTUFBKUlpFbkJMZkFEVmJC?=
 =?utf-8?B?Vy9lS25ZcFROaVEzakI1VU5UbXRrYWVPYU9xSmNkeldyWWxsNmlQNUFyNTJ3?=
 =?utf-8?B?K1FteXVtTytTVkp4SDdoSWpLcVIxVDlST2MyNk5PbEY0c2c4S1JQVjF4Mkxi?=
 =?utf-8?B?dzl1KzdaRzN0UjM0T3lkVEF5VEtSWGhhSG5BOEpzS2J4dWZZSVNzUThyQXM3?=
 =?utf-8?B?c3dLZUNQT1Y0ck9JT0owOXYwMURlcGwzWXQ3MTNVWHEvOGcwZkxsU0srQ3dP?=
 =?utf-8?B?WTJpVEs4cnFUM1JNNDVzWHErZWRQb0FKakNCS2tTMEtzU0p1Q0pNcWdha1lS?=
 =?utf-8?B?SCtEWkhDV1E3T1BwSDlsbkliMmxGM1UwemJHNkRLNDlKTG94c09DNHM5ellF?=
 =?utf-8?B?ckZxUnZHNXh6OWZja2tkMEcwQXd0WkRzNXR1bUdKVDVFWjkvWVBFNWMycXZJ?=
 =?utf-8?B?L3M5NVNNVDdsSjhIUTU1L2hQMFdnWGkxZW1xbzdpa21QOVEzNUVZVjBjRURp?=
 =?utf-8?B?S3N4QkxmTGdGZjdnVGRVejJUeXArQ2pEK2Vnc2tCb1lhRmxQUUl0amNLTThp?=
 =?utf-8?B?UHFIQXFhZzR1bzlGbXB3Wmp2aTlvWldGOVd5UmdJTkhtcWs3YlphL0h0eW9z?=
 =?utf-8?B?RThKbVRxQWd4Y0QxSFpiYTNvYitTSlhzbVBVU0JXYlQxWE5mSjBaSmF4RjVK?=
 =?utf-8?B?cUdRdmdpTjc1R0hDZEROb0dZRStKY1pNUFkwR0NUVHh4NHN0Z1dYdXB5TTlI?=
 =?utf-8?B?RTBvRHFPbXQrM2JaeXlDQTlrdGp1RFgxYVl3T0ZHVzNOR2diNm5GZjRkY1oz?=
 =?utf-8?B?aGFaTEo4TEsrSzdnMTg5NHBjSitjam1JeVF3WTJ0TGxvaVRDMEx2VURra29u?=
 =?utf-8?B?V256MW5kTjc3VGFEZWhxVDhvL1BrbVFoNlpGYTRpbTh1K0JsOTdHb3FuVnNl?=
 =?utf-8?B?aUR0YU5mQnBTWkw1azhpeUJjWDR1MVpNOGNVL0JzU0IxV1dYeTlFRTVvWlIv?=
 =?utf-8?Q?EM1o=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:19:01.6022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fd6d9d-6e5d-463e-bce6-08de157cec41
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8058
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2MCBTYWx0ZWRfX7xRlpb9XpUfO
 Uoy8EaZY0HzRC7Iewq1XeLCUX1RPqr6SCRL+3Oc9ziQZ93bWK41f3WreHZtzdQsfMg8oYPNnBmh
 SgloWL1WRls6mOVn68B8Mci3hEcWjN/0d/pTzPUlEfUih8AlLyF4CSLs1xY/8OvE5BUS4skJ7iU
 BRi/QLihoEcgEUY41VFE4OEpryjZ+iIy0eUK2qguOSRsmyn1oWnd4YXGFfxnn+Lcp3AMcGHi/IU
 DMbwZBJ4taYayY/IC+RzMgrCQ5y6FfR5bo8Ejw2f0PeCF3g4ylumszAtaNt9eIVspCfeZEGbKL6
 mCkbmTglMRDF0l+EGfyKvyNj+l6lxzJw+r+lS6RhZLrY1wK4HyG8T2cHvISy1lp/aZOA63ngfVi
 XUzDBhOykO/eL0gTQFZdZxuqakTHnw==
X-Authority-Analysis: v=2.4 cv=T/KBjvKQ c=1 sm=1 tr=0 ts=68ffa98b cx=c_pps
 a=ng2v5I1XFi+PtHXJtWjLGA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=NgXIByz4evxGwLUuSQMA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=HhbK4dLum7pmb74im6QT:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: E-YbUDqQJq2q6wyhC6zBSiD2O05IRUYa
X-Proofpoint-GUID: E-YbUDqQJq2q6wyhC6zBSiD2O05IRUYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270160
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/3] ARM: stm32: Read values from M24256
 write-lockable page on STM32MP13xx DHCOR
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



On 10/23/25 23:48, Marek Vasut wrote:
> The STM32MP13xx DHCOR SoM is populated with M24256 EEPROM that contains
> an additional write-lockable page called ID page, which is populated with
> a structure containing ethernet MAC addresses, DH item number and DH serial
> number.
> 
> Read out the MAC address from the WL page between higher priority SoC fuses
> and lower priority plain EEPROM storage area. Read out the DH item and serial
> numbers and set environment variables accordingly.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi |  1 +
>  board/dhelectronics/dh_stm32mp1/board.c    | 51 ++++++++++++++++++----
>  2 files changed, 43 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> index 5ca0258e3ff..bedb7c600d5 100644
> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> @@ -10,6 +10,7 @@
>  / {
>  	aliases {
>  		eeprom0 = &eeprom0;
> +		eeprom0wl = &eeprom0wl;
>  	};
>  
>  	config {
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index a9b1a0f2c34..065d2f338c2 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -119,7 +119,7 @@ static bool dh_stm32_mac_is_in_ks8851(void)
>  	return false;
>  }
>  
> -static int dh_stm32_setup_ethaddr(void)
> +static int dh_stm32_setup_ethaddr(struct eeprom_id_page *eip)
>  {
>  	unsigned char enetaddr[6];
>  
> @@ -129,13 +129,19 @@ static int dh_stm32_setup_ethaddr(void)
>  	if (dh_get_mac_is_enabled("ethernet0"))
>  		return 0;
>  
> +	if (!dh_get_value_from_eeprom_buffer(DH_MAC0, enetaddr, sizeof(enetaddr), eip))
> +		goto out;
> +
>  	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
> -		return eth_env_set_enetaddr("ethaddr", enetaddr);
> +		goto out;
>  
>  	return -ENXIO;
> +
> +out:
> +	return eth_env_set_enetaddr("ethaddr", enetaddr);
>  }
>  
> -static int dh_stm32_setup_eth1addr(void)
> +static int dh_stm32_setup_eth1addr(struct eeprom_id_page *eip)
>  {
>  	unsigned char enetaddr[6];
>  
> @@ -148,20 +154,47 @@ static int dh_stm32_setup_eth1addr(void)
>  	if (dh_stm32_mac_is_in_ks8851())
>  		return 0;
>  
> -	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0")) {
> -		enetaddr[5]++;
> -		return eth_env_set_enetaddr("eth1addr", enetaddr);
> -	}
> +	if (!dh_get_value_from_eeprom_buffer(DH_MAC1, enetaddr, sizeof(enetaddr), eip))
> +		goto out;
> +
> +	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
> +		goto increment_out;
>  
>  	return -ENXIO;
> +
> +increment_out:
> +	enetaddr[5]++;
> +
> +out:
> +	return eth_env_set_enetaddr("eth1addr", enetaddr);
>  }
>  
>  int setup_mac_address(void)
>  {
> -	if (dh_stm32_setup_ethaddr())
> +	u8 eeprom_buffer[DH_EEPROM_ID_PAGE_MAX_SIZE] = { 0 };
> +	struct eeprom_id_page *eip = (struct eeprom_id_page *)eeprom_buffer;
> +	int ret;
> +
> +	ret = dh_read_eeprom_id_page(eeprom_buffer, "eeprom0wl");
> +	if (ret) {
> +		/*
> +		 * The EEPROM ID page is available on SoM rev. 200 and greater.
> +		 * For SoM rev. 100 the return value will be -ENODEV. Suppress
> +		 * the error message for that, because the absence cannot be
> +		 * treated as an error.
> +		 */
> +		if (ret != -ENODEV)
> +			printf("%s: Cannot read valid data from EEPROM ID page! ret = %d\n",
> +			       __func__, ret);
> +		eip = NULL;
> +	} else {
> +		dh_add_item_number_and_serial_to_env(eip);
> +	}
> +
> +	if (dh_stm32_setup_ethaddr(eip))
>  		log_err("%s: Unable to setup ethaddr!\n", __func__);
>  
> -	if (dh_stm32_setup_eth1addr())
> +	if (dh_stm32_setup_eth1addr(eip))
>  		log_err("%s: Unable to setup eth1addr!\n", __func__);
>  
>  	return 0;
Hi 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
