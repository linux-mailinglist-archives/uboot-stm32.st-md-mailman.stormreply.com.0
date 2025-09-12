Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BBB554E5
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Sep 2025 18:45:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01104C3F933;
	Fri, 12 Sep 2025 16:45:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FAB0C3087B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Sep 2025 16:45:47 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CF2smh012315;
 Fri, 12 Sep 2025 18:45:38 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490xh295wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 18:45:38 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM2M1nlhpO03o1LJYpoFwFORYyf28TYMrULgPTsuY5Aebhvt/+NZe+qllrd/Fama1YTJKDRpdpqx5A8vzOKt/eHxFJpRLUZ9xPbfMGiQeqbW8qZan8Sdrax81cV3eM1DlH850N/1cD8DTZqwIuQlfSmKD7QIPhixcOe7SB0a4eAAqx96gu673LSxPtDqXZ5ytqJyiItaWWYsDJrQcpt91uS98h6M1gpj0baSMvbFt4srhnw5QcnHQ68h/BQa/MNUFaYWXPdD2TQiV8kXY+H/0INI9NDSKXBSMY9ufQ8/9+F8I7tOyl6MRQK/f3Gkz/usZDRXFaSLb+n7/56TMXGg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5LFu7erPKkpbOlnzqXIyPx/AEEeVsd6GFYQI1zCwYg=;
 b=Sxr02Da87yJjak+6PIMI3X7z4/kazbSo3FvQ7TTGHl2NVEl/odwkyEqmELhTX0tX0+r0Nw26+nhXdZ8LOtqcXg9nt2tTYwbEyGeIsSbRCucc0g6Lefm/TE5+C8Oi3PKeX0811ubjctZIDbI91XP7vQDIlmZOZXC6SwnTdqDwjPpPLqeIBsgX/Bfg1cJdCxhqzbV4ZX7t460HyLO/lVYPB5pfwFOqoSAI7mLvATXE0kPrcSlSXA4+xILUuePU/TT5/v9USH4zbspMLHqxRSohY+lhWve8XA+Aq5RiUSsTl41u7jvTjlhxW8njqI9hDrhDkaMkhfWT/NQSceJ5Hn4ywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5LFu7erPKkpbOlnzqXIyPx/AEEeVsd6GFYQI1zCwYg=;
 b=a1ceuWyvQtIrBEkJCze1hCftRoKoWZNtT8RUC2Xk1VQAJogmutYfZb/UM/SvljnV28eClHe/dgO7dyBNRSdSlKc210BjSmOzztplERqiLWaDQPFdtJoE2qtS548u/QhAda9fPaAsJT17E/3B8O8eZEE8PUNU//QSZaTQJClUwtoDJamBxmrBNmdQuSMW65AUI//0r6qbyKYoif6XBd8kcbJrYuUE5MW0wwC49mSoX4CYxlvh7xxWF8mtTAfyV4pZRKQpOgy96CXyNz3YI5DwWndPDI864MbjDV6rJ9MkvTlTEI0B1BQZKM8Yd/PdS4dPyTjUrRu2w31eXFroFPijsg==
Received: from AS4P192CA0054.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::14)
 by DU0PR10MB6298.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 16:45:36 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::f0) by AS4P192CA0054.outlook.office365.com
 (2603:10a6:20b:658::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 16:45:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 16:45:35 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:43:13 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:45:34 +0200
Message-ID: <ab316803-ef45-4fb1-bc0b-6b2a1097c1b8@foss.st.com>
Date: Fri, 12 Sep 2025 18:45:33 +0200
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
 <20250904-master-v3-6-b42847884974@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250904-master-v3-6-b42847884974@foss.st.com>
X-Originating-IP: [10.252.28.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A69:EE_|DU0PR10MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a83fb50-c8bf-4059-06e3-08ddf21bcbec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzc1S3FrN2d1ZEZOaXVtNnFzTXBLai9aU3pUelBsM21KQkdXaURkSmZOdG00?=
 =?utf-8?B?KzhZSDdMWGRFN244djZkYW8yaTN4K0MxS3N0VG5Md3JVbTBSSDRBRkdLYTV0?=
 =?utf-8?B?UkJlb1FiTis0UjhtTHFUdmpFa2owelp3RHRBUGNiaVYyUkRSaHMrSFYvZkxl?=
 =?utf-8?B?MFpncklaZXVJZGxaR2lTM3BtYm1kbitJY1Eva0VDcE96WmRoMjBCQ3RLYmMw?=
 =?utf-8?B?dzc1UzNqMUMzVzlUVGFCUFVuMjFXcUlscmFFY21aQXJwU0RjZ1BVOHVEV2ww?=
 =?utf-8?B?dnpHQ1J3dE5mbFZmdmJ3ajhkWGhEd29PSnVKZ1RtOUhzNHZ6THlKVjE1eFZ4?=
 =?utf-8?B?azhabS9NNmdseHd0UTRnT0d0bm1lbzZldjN6T3ZaTnBzaXU5eGQ3V3hubmUv?=
 =?utf-8?B?b01RNS9ZYlRqZ1VwdVFmUVBGWUNiS0laQXVLR0I2ZTNuWWJrRGg2N0FuK3ZL?=
 =?utf-8?B?ZU1JbmNwSCtHak42bHNPaEdTWExaVE1yNkpoQndObDlJOEJOYVBKdVVGdy9w?=
 =?utf-8?B?bGpZTUovOHpUVEsvUU80d0Z1SXlSWW9ZWTU0OUxJMjcyckNHUllzN2lPeTZX?=
 =?utf-8?B?S3pTL2c1ODJiMGVTTEdEcHpWNHFFYUhzWVZieUt5Z2wrWGJKcmpzSGJhVDl6?=
 =?utf-8?B?NDlVMXY3T0VxazhOVHE2TnhBQ1ZVYUQ5QmFnek5HZ0Q5RWxRY1k4dXpoVnBP?=
 =?utf-8?B?M1ZpVXN3VjVFWUV6cUNqeHhkNko3Z1NTL1VpbVBmaTRHTkxCOE5vclVtS1ZR?=
 =?utf-8?B?RTIzNHp2bEFBTHpsajkwSXdBU3lBTEpZK3BySldFTGdMY095R2VFYk9PeHVB?=
 =?utf-8?B?azhyZlJyV3ZmY3k2enJ6aTZvN0ROQ041M3ZoVzBYMTl0VEkyNmc4ZzJCelRp?=
 =?utf-8?B?N2FEM0tycStRdzRuRWE2QU5HNWFWa0gvWkxhTndmcXNnMkJlT0ZobEppbjB1?=
 =?utf-8?B?ZEYwOW1QTHR6eng0OTFiRHZpaE94K1haSTRBS0hvR2VncSt0ckM5ZWJwTk1O?=
 =?utf-8?B?MC9UWmhsNU51TXFrYmFzWWFlS1Y4b2YyNGVyaFFHV2lDeUx6dDgweCt0Vlcz?=
 =?utf-8?B?dEN3MGdQNnM2ZkRsUHhWNTZPSUNYM3VqcHZGYnVjVmZISVMwblN2cGRaUGRo?=
 =?utf-8?B?cDNuY3BNcWhEWUJpR05ZRU81cHlkc24wZ1NDZzl1UytucnFQVjg3SnVZT1Rw?=
 =?utf-8?B?Z2lkY0hucFdDZWtaNXh1c0E2MDNpR0VXcVR4UzhWNWlhK0hFVTIrWU9DRFZV?=
 =?utf-8?B?QW4rZGVjVlplaS9FZnhaSkwvQzJiZ3YzbUJJU0lJK0RTWkxzMlppRTB4RFA5?=
 =?utf-8?B?dERhay9oSlBOT2c2S1VBOXEyK2hpV3JmYmo1U1hIZEhmUXlrbE5XQzN0bTBJ?=
 =?utf-8?B?WXpOSkNTN1Mxb3dTa0ZwNGhxQSsvQnZhdDhVanZvRzdsUE83dklReThqMndo?=
 =?utf-8?B?WHc5bXBlTjhDeGYwUjZDblNCQ3lWOHFDd3hQOHRpdVlEZUloZFRLc1dtUGM0?=
 =?utf-8?B?OFdiWTdqVE9kcEZCY29EQVdtbzdCYitMNGVIMEczVXVlaUdlWnJFL2N2RFZK?=
 =?utf-8?B?S291Wlp5bVFRUWJCY09scFJlZ3c3VXBzKzJ3ZXdxM1RISlMwTEZncFpLWjFw?=
 =?utf-8?B?YzBtSEJEUzNzalQyQ1pvQUN2T1A0N3VydlA3RjRZVUlPM2g1S09teEtGOXJW?=
 =?utf-8?B?bWhLOHJTTDVlUEg1N3hoQm00SFRDM1grd1ZXQzNod1lURmlBNVJwaDREVEVI?=
 =?utf-8?B?NUlyTlFRWTRaZmpwRGdMNDZNL3lCSFM1bmhmTTczS2Q0ZVp4K1RoWDFGQ3FO?=
 =?utf-8?B?M0lsZWNZSEJKOWV2WXB2Y2JHL2NWQjBiK3NtZm0zT0hUMHc3aENRejFrVlVP?=
 =?utf-8?B?VUZPWXZ5YW95V1FneDVXdFZrbUtrY0xvalppTG12cFAwa3RvcVFiMU9JSTZy?=
 =?utf-8?B?M3Fob1IvTkNBTFlvMUhOaUFucC81VjZXVGZGQ2hncTN5ZUFKRjg4NnByd3Bn?=
 =?utf-8?B?Q2JTanRSR1JBWVpXMUdiNiswSiszazg0YU5lcUFDWk53TC8wSjBkVGxXNlFG?=
 =?utf-8?B?UEF5Z0dsMkdGN2I0dGs5Ym93U2VhK2ZyUEw3QT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 16:45:35.4810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a83fb50-c8bf-4059-06e3-08ddf21bcbec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6298
X-Proofpoint-GUID: yOjVHXVPQVvWZ5zXKLCRkwM9SYCrqNCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIyOSBTYWx0ZWRfX++k+xG5NnrXj
 G5Kmca3A6W1olWvjhWYaUofPGG1PdzdV+uOe9lpoz+E06yCBY6z2OVS/ZIYBn9gnkNDvd91TeqI
 UXTN0HiHSaYJAQKP7O25bURsH4ovwLDbYVZ2qoiCGS+fqdcZgJGXxj58dWuuNYQo0mZSnDPQ17p
 HDqxjvBrqbvRcFkxFoQmBKunUzcONqwTZ1BHGbbf3i9aj4j34X4KLd81OmCpO0HNzcbvhc+FHPM
 PEv9vjIl/CDnzFU3N8nHTfKgXQVt8gcFg/oUW4a3P29asRQJKDMu9fobsRbHIvece/2jGOc9wVe
 HhXREjh0hAKDtPnjR65GT/2xUvwp1Ch6aTphFA6azu6DBn5MYJBDs23+zp78evUqHr9V4KtETRk
 9dwbb+R6
X-Authority-Analysis: v=2.4 cv=VKfdn8PX c=1 sm=1 tr=0 ts=68c44e32 cx=c_pps
 a=pvTFClRe/ipeMqbgOSyXcA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=RGJY1t5NHAZWiFEA6bAA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: yOjVHXVPQVvWZ5zXKLCRkwM9SYCrqNCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060229
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 6/7] ARM: dts: stm32: use LTDC and LVDS
 nodes before relocation in stm32mp25-u-boot
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



On 9/4/25 14:53, Raphael Gallais-Pou wrote:
> Use LTDC and LVDS nodes in all boot phases.  This is specially useful
> before U-Boot relocation.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  arch/arm/dts/stm32mp25-u-boot.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp25-u-boot.dtsi b/arch/arm/dts/stm32mp25-u-boot.dtsi
> index d9aeeb6d510df9dea9700148cf8a8ad5efcfd4f9..3ac35c4a6bc27c72eeeb532742fd4412b7aa1b85 100644
> --- a/arch/arm/dts/stm32mp25-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp25-u-boot.dtsi
> @@ -93,6 +93,14 @@
>  	bootph-all;
>  };
>  
> +&ltdc {
> +	bootph-all;
> +};
> +
> +&lvds {
> +	bootph-all;
> +};
> +
>  &pinctrl {
>  	bootph-all;
>  };
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
