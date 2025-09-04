Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C46B43351
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 09:05:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA60FC3F93A;
	Thu,  4 Sep 2025 07:05:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFEDCC3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 07:05:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5846Yuwf004214;
 Thu, 4 Sep 2025 09:05:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 iSNiXmPCvQROIXiacFFmvW9APn7IxXBaQSCg8Cemozg=; b=bq1/37vZjrLvUwDX
 4FWojZjq37L3s5eyUunWqJq+8xebsUNOdlh8ROqM1rYjsz6v8fDRg+4vAa7Y8+0w
 gkLk9dGmMFIyh1N2ZtW89Rd0OTpA+0PdTlIiURqMhD33pfNlfmSzQBytJn4SlhzB
 mbRGr0t83rObv2JlgMDLH+EIx0JMu5GXfuHLWw1XKnWPDaUyF54pGYi0g6XNnW65
 13xDFQB5o82BoH/lynSu58KNaJ0en61Id1tx3ad+lscjZV8SqcQ2XOW7f83DWthb
 Xiam409Tf3fJ8uuP4MpVglCrxUDYHGVVvHiJAF2oLqBozEwlkW+hXhdwPzhJT0Y2
 z3JSmQ==
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013063.outbound.protection.outlook.com
 [40.107.162.63])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqkn1b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 09:05:02 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AokSV13Aj+lQBed/4N3rQLIeE9QIDGQajZZefZiT1dExpY5YGYH/NpjoMA1obxDqYm2H+gV9S/ynEe+pfL7x8B6X8h78j+Kyyf3MFL/KW6Lwvrnf0roxOIK5Gt2ekc78GObTVTlB6d7moDZCd14N+qyF1KfldIH2hs+qpewhxzaj+9OcR/flwzuvEAD+PYbWdTwrm7Pc09+cUpOUAwcWzyHq9Ot5VHGJLNrzHUN1TjZ3HR3GpdB4CROatJPUwniKcIXy0yo5cUXcMdREUXThT0tHiQLW62sgsoIfb6u+P0quVRIfuDAB0llO8DtZsCTnlP7MiI245YPaNqVcvMmFZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSNiXmPCvQROIXiacFFmvW9APn7IxXBaQSCg8Cemozg=;
 b=ogvdbpFKTk7Cc7sbuRVrTtNc3onWLcLJslvgczEfT6hRzzDEo91YehNQ3PDMYYanqpEkmu+5SDDnyVPD7/h5Sbxr5G5foPGNNm9tDonNwSZ9QSARs49vKiexNdImd09ph+iv0ODbYEl+MAPXEWOh7IrGO6XUarLOli17qi5kWN72wLbaQgxnolipZIV/67fm1M9iEmUad+VhgkbFpqbKc225Z/ndFTeEuWhQqQbatwKXHWNoGa/4eobxxP+yq5ZZ6Ly9/tjzkzmiICip5O9Rgw3eDf5ZiC5jg16Opq2zBQmi1rwHOzh27WDxKUmUHBfhUFjSIXPRMwEDYwJ8FIqdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSNiXmPCvQROIXiacFFmvW9APn7IxXBaQSCg8Cemozg=;
 b=gxFTI6fo90uN7nMFLxiOSYn7oRH8/TtrnwDBs/oFvDJguHPUc4MkZ/90fTlVeNiJNGtF3XvZbL2E5UDbHfg/lIPRSkbwmUKvIjxCq+Cbyt/qq2G95xWNmHQ4Jr6JCoGJnBqmTCh3XPH0NJ18HKp8IVaFgbhro4Y+J26UqGzcR6M=
Received: from DB8PR09CA0009.eurprd09.prod.outlook.com (2603:10a6:10:a0::22)
 by AS2PR10MB7901.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:04:57 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::e) by DB8PR09CA0009.outlook.office365.com
 (2603:10a6:10:a0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 07:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 07:04:57 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:02:39 +0200
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:04:56 +0200
Message-ID: <1840e425-246b-4d4a-8ab1-5ba21acd57e1@foss.st.com>
Date: Thu, 4 Sep 2025 09:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
 <20250903-master-v2-5-5cdf73bff42c@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250903-master-v2-5-5cdf73bff42c@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C5:EE_|AS2PR10MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c9c75c-9396-4b27-5c77-08ddeb815b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGQzbEM0YWVuUnNVSlF3WVV2N0I0aVRzSlB6aDBjemx2MTdEK0ZWajQvUGFD?=
 =?utf-8?B?Z2lzdDlPL1F2aWxHc3Y4bG9NeDdhVGF2RjBnNTBCbzZEY3hEb3VGTnBraVg5?=
 =?utf-8?B?eUdtbkRCcTUrc1hjaTBOTTZweFg4Z2poTEl5VFAzNCs0d2ZCUUhDL3I5ZFBi?=
 =?utf-8?B?Z25DRVV0Q3FsM05RUkxVbDdFaE9oQmwzczRxeER1a2VZQVUxeEVySXhWcEV3?=
 =?utf-8?B?SE9QaFdTUHZaYXRrTGVKc3Rlck1YYmM0SlJEOEQxelhBaG4wR0lnK0ZySXNG?=
 =?utf-8?B?WTh1WlVTRWtzWWZDRG9VSjFiOEhEbStZWXk0eUVVOU9oRGRBbEIrYnlKN05H?=
 =?utf-8?B?TVgyOWN0andPYmdDK3hvVjBCSjMwQXNyT3dpWjF6NjREM3ZaWDVJZTFycDZH?=
 =?utf-8?B?TnJEV0swdjh6WTUzRDlZdVRDU1ExUjhzbEcrd3NQNTNUMVV0N2FoakhCQSsy?=
 =?utf-8?B?RkIyVnhWQlA1d0NyKzJvN2wvWU5ZZjRIbkU4SnBCRmJRQWFUeEVHSEViekxn?=
 =?utf-8?B?cUdPc2lIcVBWSnQ0OStLT0JhWlNxMWZkcUxZcUVLSWpVZmVRQ0l3cWlRMUlu?=
 =?utf-8?B?cTY3ckRzS2txZTllb3FGVUhDbllJaytpYlZOdzJDb0xwaXZJRGxmT1RnUjhX?=
 =?utf-8?B?NVk2aGJXWnhNTlJJdkVVT21pVnU4bmdSMWZKRmMwc0VjVjFrZmtiZGdOTEo2?=
 =?utf-8?B?bjdFT1cyS214VUFycmFaMHd3N0lsa21XbWVENGtqOVBENVE2cEFtR0ZTZzJF?=
 =?utf-8?B?Y1JPMUQzbFh2bGw1WVNibGtQTzdoVEFYQkxmQThMTXQzdXMzdDEwbFlqeWZI?=
 =?utf-8?B?L08zTlQvS216VlJOVW90MDRsdno0T2ZVVkVLVXR3ZGFvOEtTMUZWeWpPb1FF?=
 =?utf-8?B?VEhVMFBPYmJnY3N0UjFvOWVkYzdxYjNRaEpBeXZiRjBoVnROWEdEVysySnBT?=
 =?utf-8?B?aHhsMzJFRlJmWFpuWEJxSmJaTFBDS2tDK3JXdVpjT3NmTjd5MFVHRG9RVlA0?=
 =?utf-8?B?b0RQRzQ1TXZBVDNnZkJiWW1ZeGo5c2JTaWo0dVl2UEs0cVdlVWs5SkpUWm10?=
 =?utf-8?B?VXM3WUdENENyaU53TkFGY0JXK0xWaEh0bCtLSTg1TDBXTml6ZG9OZVA2VE5y?=
 =?utf-8?B?NXEydDY2NWIxdVNCS1drMURkakhvcW5SQ0Y1TDc4RU5oL1ZML2lSVkRtT0o0?=
 =?utf-8?B?aythOGY2WXdjN3lqMjlYeVZDQ0ljV1ZjYU1GL21JK2JGQXNSYkxuVHZmYlcz?=
 =?utf-8?B?L2t5clpGTWFDQXBMaXd1QkpxbHRuckR2MmI2YnRVMlFwNXZyekQwME1kZEpa?=
 =?utf-8?B?U2JCZlVkSExweFRKQTVITWhuRkYyV0Y1S01rVUplVFVhaldabmprR3NoNyth?=
 =?utf-8?B?ZDdSYkRlaG0wTVdicWxCby95aDRuVVA1WkxGTmJOY25tZi83YVdEbmUrbUFl?=
 =?utf-8?B?eVUxbG1UT3UrV2x0OVZJVlFUL3RjekZJTldIb1Z0Z1BzcGdST1RoaWp2bktz?=
 =?utf-8?B?a0lvMnJOOGlTZ3U5akxVZjB0UXB3TlRHRENUZnVIQU5sSndxbnpFQjlTL3Rk?=
 =?utf-8?B?SHFRSVo4ZTEvbUdES0NRa29JOWg3SlBhaHJEVGxlZWVTUHZEb2c5T3M2dTBO?=
 =?utf-8?B?WlQ2K1JjRkIvYWF5eWt6Z05GZEdKblFOdGJJMkpzaEVpKzByZGhjVUwzdzRL?=
 =?utf-8?B?Tk9pMHBHaXlDODJEcGFtM2VERXBpeis3cEptMGhqRXFUSW9NRlZoVkt3R3Vv?=
 =?utf-8?B?aFRjK0x5dmJSOVRxWjJ1TmtIbStZMll3aUN2M0NiNHlKQm5PeTNBZXpqU0JZ?=
 =?utf-8?B?Szd2ZFZXSVFodFdLdzk0VURkSHF1WEJaYUtLUnJmWGlJVnFzTmVkYzVZSllp?=
 =?utf-8?B?dVB2c0poK1YwSW5weHdUZUorWE1FT1hwdjZkTjlxMTA5S2pWRmoveE1pSmdt?=
 =?utf-8?B?dWhjT0ZIbjk2eTljUXFzdUdIUDFBcGZYVGx2SzVBZUl3dXRXK1RWNmhYOFBo?=
 =?utf-8?B?RmJlb2dUUlNFRWdNdm82THVLQVdZR1RoTXZxRXNoNS81WlRBL0ZZRnJDSkRu?=
 =?utf-8?B?RlFkY1RFSUFVaTg3ajAzSkt4dmZRTUhFVGJFQT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:04:57.4819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c9c75c-9396-4b27-5c77-08ddeb815b92
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7901
X-Authority-Analysis: v=2.4 cv=XYCJzJ55 c=1 sm=1 tr=0 ts=68b93a1e cx=c_pps
 a=/QKJ0YTy9Ntnlhio84ImkA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=P2A4Zi-lJHsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=941mOKHnnHugEBzshyIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: oGpklpP9foZSPRnAbxrXFsSY7LwqBwww
X-Proofpoint-GUID: oGpklpP9foZSPRnAbxrXFsSY7LwqBwww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMiBTYWx0ZWRfX0ZDJcx7ZEl9r
 tDbUYy8Ge8uBOCDGqGBK1GmZD995WVLBSENnBln9J2Qt3JhxOaCS9Xrd6/VXOGggLENF/k3TzOY
 YtQiTV5X4Wx2tfbepJjn0i2a156fB5PN7X/DKMdjTZikxeG4G8SOWA6xBymCUJ+a8k6xaCL6Tr7
 lKGbfuWsm6jWEcWLM7UxYItSglSsSE80dC0BgBs3WRe0rXuwfZ/j9zh0ikjK2tX5yXSZVWY9HbX
 0SgftE9LI/ypAx1ACVf0ae+bOOzsp7g1quiM1EjPf6YQ4RIgs6ZEomzTEqXVIbghC+VflXGq4Uc
 X3/zXmUhiw/V6HRMcWBnP+dNRfkF7AE+JNBKqZfaTeK16WtPg6z4gcgBeyJxmJoSKuDGbcKouxK
 h7e+8C8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300002
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 5/7] video: stm32: ltdc: properly
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
dHJlPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKTGUgMDMvMDkvMjAyNSDDoCAxNDoyNSwg
UmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IEluaXRpYWxseSB0aGVyZSB3YXMgb25s
eSBvbmUgRFNJIGJyaWRnZSB3aXRoIG9uZSBwYW5lbCBhdHRhY2hlZCB0byB0aGlzCj4gZGV2aWNl
LiBUaGlzIGV4cGxhaW5lZCB0aGUgY2FsbCB0byB1Y2xhc3NfZmlyc3RfZGV2aWNlX2VycihVQ0xB
U1NfUEFORUwsCj4gLi4uKSB3aGljaCB3b3JrZWQgZmluZSBhdCB0aGUgdGltZS4KPgo+IE5vdyB0
aGF0IG11bHRpcGxlIGJyaWRnZXMgYW5kIHBhbmVscywgd2l0aCBkaWZmZXJlbnQgdGVjaG5vbG9n
aWVzLCBjYW4KPiBiZSBwbHVnZ2VkIG9udG8gdGhlIGJvYXJkIHRoaXMgd2F5IHRvIGdldCB0aGUg
cGFuZWwgZGV2aWNlIGlzIG91dGRhdGVkLgo+Cj4gVGhlIGxvb2t1cCBpcyBkb25lIGlzIHR3byBz
dGVwcy4gRmlyc3Qgd2UgY2lyY2xlIHRocm91Z2ggdGhlCj4gVUNMQVNTX1ZJREVPX0JSSURHRSwg
YW5kIG9uY2Ugd2UgZ2V0IG9uZSwgd2Ugc2VhcmNoIHRocm91Z2ggaXRzCj4gZW5kcG9pbnRzIHVu
dGlsIHdlIGdldCBhIFVDTEFTU19QQU5FTCBkZXZpY2UgYXZhaWxhYmxlLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNv
bT4KPiAtLS0KPiAgIGRyaXZlcnMvdmlkZW8vc3RtMzIvc3RtMzJfbHRkYy5jIHwgMTM2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEy
NSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL3N0bTMyL3N0bTMyX2x0ZGMuYyBiL2RyaXZlcnMvdmlkZW8vc3RtMzIvc3RtMzJfbHRk
Yy5jCj4gaW5kZXggZWZlOWEwMDk5NmVjYTAzMDFkMmEyYjgyMDc0YmE5NjkwYTk2N2E3My4uODM0
YmZiNjI1ZDJkMzRhNDRiZDhlZGZmMWM5MmFmNmRlYzM0NGMyMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2x0ZGMuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vc3RtMzIv
c3RtMzJfbHRkYy5jCj4gQEAgLTE3LDYgKzE3LDcgQEAKPiAgICNpbmNsdWRlIDx2aWRlb19icmlk
Z2UuaD4KPiAgICNpbmNsdWRlIDxhc20vaW8uaD4KPiAgICNpbmNsdWRlIDxkbS9kZXZpY2UtaW50
ZXJuYWwuaD4KPiArI2luY2x1ZGUgPGRtL3VjbGFzcy1pbnRlcm5hbC5oPgo+ICAgI2luY2x1ZGUg
PGRtL2RldmljZV9jb21wYXQuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KPiAgICNp
bmNsdWRlIDxsaW51eC9wcmludGsuaD4KPiBAQCAtNDk1LDYgKzQ5NiwxMDEgQEAgc3RhdGljIHZv
aWQgc3RtMzJfbHRkY19zZXRfbGF5ZXIxKHN0cnVjdCBzdG0zMl9sdGRjX3ByaXYgKnByaXYsIHVs
b25nIGZiX2FkZHIpCj4gICAJc2V0Yml0c19sZTMyKHByaXYtPnJlZ3MgKyBMVERDX0wxQ1IsIExY
Q1JfTEVOKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IHN0bTMyX2x0ZGNfZ2V0X3JlbW90ZV9k
ZXZpY2Uoc3RydWN0IHVkZXZpY2UgKmRldiwgb2Zub2RlIGVwX25vZGUsCj4gKwkJCQkJZW51bSB1
Y2xhc3NfaWQgaWQsIHN0cnVjdCB1ZGV2aWNlICoqcmVtb3RlX2RldikKPiArewo+ICsJdTMyIHJl
bW90ZV9waGFuZGxlOwo+ICsJb2Zub2RlIHJlbW90ZTsKPiArCWludCByZXQgPSAwOwo+ICsKPiAr
CXJldCA9IG9mbm9kZV9yZWFkX3UzMihlcF9ub2RlLCAicmVtb3RlLWVuZHBvaW50IiwgJnJlbW90
ZV9waGFuZGxlKTsKPiArCWlmIChyZXQpIHsKPiArCQlkZXZfZXJyKGRldiwgIiVzKCVzKTogQ291
bGQgbm90IGZpbmQgcmVtb3RlLWVuZHBvaW50IHByb3BlcnR5XG4iLAo+ICsJCQlfX2Z1bmNfXywg
ZGV2X3JlYWRfbmFtZShkZXYpKTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsKPiArCXJlbW90
ZSA9IG9mbm9kZV9nZXRfYnlfcGhhbmRsZShyZW1vdGVfcGhhbmRsZSk7Cj4gKwlpZiAoIW9mbm9k
ZV92YWxpZChyZW1vdGUpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCXdoaWxlIChvZm5v
ZGVfdmFsaWQocmVtb3RlKSkgewo+ICsJCXJlbW90ZSA9IG9mbm9kZV9nZXRfcGFyZW50KHJlbW90
ZSk7Cj4gKwkJaWYgKCFvZm5vZGVfdmFsaWQocmVtb3RlKSkgewo+ICsJCQlkZXZfZGJnKGRldiwg
IiVzKCVzKTogbm8gdWNsYXNzX2lkICVkIGZvciByZW1vdGUtZW5kcG9pbnRcbiIsCj4gKwkJCQlf
X2Z1bmNfXywgZGV2X3JlYWRfbmFtZShkZXYpLCBpZCk7Cj4gKwkJCWNvbnRpbnVlOwo+ICsJCX0K
PiArCj4gKwkJcmV0ID0gdWNsYXNzX2ZpbmRfZGV2aWNlX2J5X29mbm9kZShpZCwgcmVtb3RlLCBy
ZW1vdGVfZGV2KTsKPiArCQlpZiAoKnJlbW90ZV9kZXYgJiYgIXJldCkgewo+ICsJCQlyZXQgPSB1
Y2xhc3NfZ2V0X2RldmljZV9ieV9vZm5vZGUoaWQsIHJlbW90ZSwgcmVtb3RlX2Rldik7Cj4gKwkJ
CWlmIChyZXQpCj4gKwkJCQlkZXZfZGJnKGRldiwgIiVzKCVzKTogZmFpbGVkIHRvIGdldCByZW1v
dGUgZGV2aWNlICVzXG4iLAo+ICsJCQkJCV9fZnVuY19fLCBkZXZfcmVhZF9uYW1lKGRldiksIGRl
dl9yZWFkX25hbWUoKnJlbW90ZV9kZXYpKTsKPiArCQkJYnJlYWs7Cj4gKwkJfQo+ICsJfTsKPiAr
Cj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHN0bTMyX2x0ZGNfZ2V0X3Bh
bmVsKHN0cnVjdCB1ZGV2aWNlICpkZXYsIHN0cnVjdCB1ZGV2aWNlICoqcGFuZWwpCj4gK3sKPiAr
CW9mbm9kZSBlcF9ub2RlLCBub2RlLCBwb3J0czsKPiArCWludCByZXQgPSAwOwo+ICsKPiArCWlm
ICghZGV2KQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCXBvcnRzID0gb2Zub2RlX2ZpbmRf
c3Vibm9kZShkZXZfb2Zub2RlKGRldiksICJwb3J0cyIpOwo+ICsJaWYgKCFvZm5vZGVfdmFsaWQo
cG9ydHMpKSB7Cj4gKwkJZGV2X2VycihkZXYsICJSZW1vdGUgYnJpZGdlIHN1Ym5vZGVcbiIpOwo+
ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJZm9yIChub2RlID0gb2Zub2RlX2ZpcnN0X3N1
Ym5vZGUocG9ydHMpOwo+ICsJICAgICBvZm5vZGVfdmFsaWQobm9kZSk7Cj4gKwkgICAgIG5vZGUg
PSBkZXZfcmVhZF9uZXh0X3N1Ym5vZGUobm9kZSkpIHsKPiArCQllcF9ub2RlID0gb2Zub2RlX2Zp
cnN0X3N1Ym5vZGUobm9kZSk7Cj4gKwkJaWYgKCFvZm5vZGVfdmFsaWQoZXBfbm9kZSkpCj4gKwkJ
CWNvbnRpbnVlOwo+ICsKPiArCQlyZXQgPSBzdG0zMl9sdGRjX2dldF9yZW1vdGVfZGV2aWNlKGRl
diwgZXBfbm9kZSwgVUNMQVNTX1BBTkVMLCBwYW5lbCk7Cj4gKwl9Cj4gKwo+ICsJLyogU2FuaXR5
IGNoZWNrLCB3ZSBjYW4gZ2V0IG91dCBvZiB0aGUgbG9vcCB3aXRob3V0IGhhdmluZyBhIGNsZWFu
IG9mbm9kZSAqLwo+ICsJaWYgKCEoKnBhbmVsKSkKPiArCQlyZXQgPSAtRUlOVkFMOwo+ICsJZWxz
ZQo+ICsJCWlmICghb2Zub2RlX3ZhbGlkKGRldl9vZm5vZGUoKnBhbmVsKSkpCj4gKwkJCXJldCA9
IC1FSU5WQUw7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiArc3RhdGljIGludCBzdG0z
Ml9sdGRjX2Rpc3BsYXlfaW5pdChzdHJ1Y3QgdWRldmljZSAqZGV2LCBvZm5vZGUgKmVwX25vZGUs
Cj4gKwkJCQkgICBzdHJ1Y3QgdWRldmljZSAqKnBhbmVsLCBzdHJ1Y3QgdWRldmljZSAqKmJyaWRn
ZSkKPiArewo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAoKnBhbmVsKQo+ICsJCXJldHVybiAtRUlO
VkFMOwo+ICsKPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19WSURFT19CUklER0UpKSB7Cj4gKwkJ
cmV0ID0gc3RtMzJfbHRkY19nZXRfcmVtb3RlX2RldmljZShkZXYsICplcF9ub2RlLCBVQ0xBU1Nf
VklERU9fQlJJREdFLCBicmlkZ2UpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4g
Kwo+ICsJCXJldCA9IHN0bTMyX2x0ZGNfZ2V0X3BhbmVsKCpicmlkZ2UsIHBhbmVsKTsKPiArCX0g
ZWxzZSB7Cj4gKwkJLyogbm8gYnJpZGdlLCBzZWFyY2ggYSBwYW5lbCBmcm9tIGRpc3BsYXkgY29u
dHJvbGxlciBub2RlICovCj4gKwkJcmV0ID0gc3RtMzJfbHRkY19nZXRfcmVtb3RlX2RldmljZShk
ZXYsICplcF9ub2RlLCBVQ0xBU1NfUEFORUwsIHBhbmVsKTsKPiArCX0KPiArCj4gKwlyZXR1cm4g
cmV0Owo+ICt9Cj4gKwo+ICAgI2lmIElTX0VOQUJMRUQoQ09ORklHX1RBUkdFVF9TVE0zMkY0Njlf
RElTQ09WRVJZKQo+ICAgc3RhdGljIGludCBzdG0zMl9sdGRjX2FsbG9jX2ZiKHN0cnVjdCB1ZGV2
aWNlICpkZXYpCj4gICB7Cj4gQEAgLTUzMiw2ICs2MjgsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2x0
ZGNfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKPiAgIAlzdHJ1Y3QgZGlzcGxheV90aW1pbmcg
dGltaW5nczsKPiAgIAlzdHJ1Y3QgY2xrIHBjbGssIGJjbGs7Cj4gICAJc3RydWN0IHJlc2V0X2N0
bCByc3Q7Cj4gKwlvZm5vZGUgbm9kZSwgcG9ydDsKPiAgIAl1bG9uZyByYXRlOwo+ICAgCWludCBy
ZXQ7Cj4gICAKPiBAQCAtNTY4LDcgKzY2NSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHRkY19wcm9i
ZShzdHJ1Y3QgdWRldmljZSAqZGV2KQo+ICAgCX0KPiAgIAo+ICAgCXByaXYtPmh3X3ZlcnNpb24g
PSByZWFkbChwcml2LT5yZWdzICsgTFREQ19JRFIpOwo+IC0JZGVidWcoIiVzOiBMVERDIGhhcmR3
YXJlIDB4JXhcbiIsIF9fZnVuY19fLCBwcml2LT5od192ZXJzaW9uKTsKPiArCWRldl9kYmcoZGV2
LCAiJXM6IExUREMgaGFyZHdhcmUgMHgleFxuIiwgX19mdW5jX18sIHByaXYtPmh3X3ZlcnNpb24p
Owo+ICAgCj4gICAJc3dpdGNoIChwcml2LT5od192ZXJzaW9uKSB7Cj4gICAJY2FzZSBIV1ZFUl8x
MDIwMDoKPiBAQCAtNTg5LDEzICs2ODYsMzUgQEAgc3RhdGljIGludCBzdG0zMl9sdGRjX3Byb2Jl
KHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gICAJCXJldHVybiAtRU5PREVWOwo+ICAgCX0KPiAgIAo+
IC0JcmV0ID0gdWNsYXNzX2ZpcnN0X2RldmljZV9lcnIoVUNMQVNTX1BBTkVMLCAmcGFuZWwpOwo+
IC0JaWYgKHJldCkgewo+IC0JCWlmIChyZXQgIT0gLUVOT0RFVikKPiAtCQkJZGV2X2VycihkZXYs
ICJwYW5lbCBkZXZpY2UgZXJyb3IgJWRcbiIsIHJldCk7Cj4gLQkJcmV0dXJuIHJldDsKPiArCS8q
Cj4gKwkgKiBUcnkgYWxsIHRoZSBwb3J0cyB1bnRpbCBvbmUgd29ya2luZy4KPiArCSAqCj4gKwkg
KiBUaGlzIGlzIGRvbmUgaW4gdHdvIHRpbWVzLiBGaXJzdCBpcyBjaGVja3MgZm9yIHRoZQo+ICsJ
ICogVUNMQVNTX1ZJREVPX0JSSURHRSBhdmFpbGFibGUsIGFuZCB0aGVuIGZvciB0aGlzIGJyaWRn
ZQo+ICsJICogaXQgc2NhbnMgZm9yIGEgVUNMQVNTX1BBTkVMLgo+ICsJICovCj4gKwo+ICsJcG9y
dCA9IGRldl9yZWFkX3N1Ym5vZGUoZGV2LCAicG9ydCIpOwo+ICsJaWYgKCFvZm5vZGVfdmFsaWQo
cG9ydCkpIHsKPiArCQlkZXZfZXJyKGRldiwgIiVzKCVzKTogJ3BvcnQnIHN1Ym5vZGUgbm90IGZv
dW5kXG4iLAo+ICsJCQlfX2Z1bmNfXywgZGV2X3JlYWRfbmFtZShkZXYpKTsKPiArCQlyZXR1cm4g
LUVJTlZBTDsKPiAgIAl9Cj4gICAKPiArCWZvciAobm9kZSA9IG9mbm9kZV9maXJzdF9zdWJub2Rl
KHBvcnQpOwo+ICsJICAgICBvZm5vZGVfdmFsaWQobm9kZSk7Cj4gKwkgICAgIG5vZGUgPSBkZXZf
cmVhZF9uZXh0X3N1Ym5vZGUobm9kZSkpIHsKPiArCQlyZXQgPSBzdG0zMl9sdGRjX2Rpc3BsYXlf
aW5pdChkZXYsICZub2RlLCAmcGFuZWwsICZicmlkZ2UpOwo+ICsJCWlmIChyZXQpCj4gKwkJCWRl
dl9kYmcoZGV2LCAiRGV2aWNlIGZhaWxlZCByZXQ9JWRcbiIsIHJldCk7Cj4gKwkJZWxzZQo+ICsJ
CQlicmVhazsKPiArCX0KPiArCj4gKwkvKiBTYW5pdHkgY2hlY2sgKi8KPiArCWlmIChyZXQpCj4g
KwkJcmV0dXJuIHJldDsKPiArCj4gICAJcmV0ID0gcGFuZWxfZ2V0X2Rpc3BsYXlfdGltaW5nKHBh
bmVsLCAmdGltaW5ncyk7Cj4gICAJaWYgKHJldCkgewo+ICAgCQlyZXQgPSBvZm5vZGVfZGVjb2Rl
X2Rpc3BsYXlfdGltaW5nKGRldl9vZm5vZGUocGFuZWwpLAo+IEBAIC02MjQsMTEgKzc0Myw2IEBA
IHN0YXRpYyBpbnQgc3RtMzJfbHRkY19wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQo+ICAgCXJl
c2V0X2RlYXNzZXJ0KCZyc3QpOwo+ICAgCj4gICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX1ZJREVP
X0JSSURHRSkpIHsKPiAtCQlyZXQgPSB1Y2xhc3NfZ2V0X2RldmljZShVQ0xBU1NfVklERU9fQlJJ
REdFLCAwLCAmYnJpZGdlKTsKPiAtCQlpZiAocmV0KQo+IC0JCQlkZXZfZGJnKGRldiwKPiAtCQkJ
CSJObyB2aWRlbyBicmlkZ2UsIG9yIG5vIGJhY2tsaWdodCBvbiBicmlkZ2VcbiIpOwo+IC0KPiAg
IAkJaWYgKGJyaWRnZSkgewo+ICAgCQkJcmV0ID0gdmlkZW9fYnJpZGdlX2F0dGFjaChicmlkZ2Up
Owo+ICAgCQkJaWYgKHJldCkgewo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
