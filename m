Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D185EC1ED11
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Oct 2025 08:41:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2B9CC62D85;
	Thu, 30 Oct 2025 07:41:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6B82C62D84
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 07:41:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U7X5g71281050; Thu, 30 Oct 2025 08:41:46 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a3be3nty1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 08:41:46 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcfbXOp7JJSUhb4kSUGdHa80yP9YRYQw+YcLtkMzOgVP5B6FZhIIIoHc2PIeBiwVoKYrWBYKDy6IiUddZj7kMUMfSUVjrCss3B6A/pKn9nQEl8ZP3lFR++eIG0VGY60sd8zEmYbsODviKD+Om54la5z8+YjJU8n8HPkO88qAM6U8a+rYOX/cjicHVHOznoyQooH1YvIxFx8fa5FdSJntgfwIK1u4gNCa1/9yTyhYoiVyGcmDT2g6g5PpHEGuJAShK1pyvfkPMpiQ7WPzvQ2+t7o/H+DzUnKMyswskaqQVpmJRUJd9DXaQtM9+8BCeDmzkvVOsqwQSpTUcSE1iJbzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLRo3W5jh5w4qEkkzV7gEIoWEz6BPVyKYZTf1DeVKjw=;
 b=SIXpRYuJd0Qajk0pOiLTnbTN/iYEYfSIhx9K+W0YiI+KD9jQMzflZc77l3RwTo/gJfV53KdzXhLn7O//xG8/iM8O6BxrT7srxgr7qXFO2qoaTh06MO3LK5Ps0et0d3pQLSajEsZcHCxHCaH1Q3YhmS2tM0zTaTcjlFWMvdiQ8aaYxAPgsXki6EprnbuOjKdtm8EkjL/32ujORLEE+KNKz+TR2SqcAaR0DDAbAKtzhK2Lptj0+Sc4hfutq84UmUDFoM0HBiC+M4Obxnj7AaPWdZUW5FjII3PoM3ItuCVkhYDAGTzV++aa3JYefG1sO7WQbo035uNa+pEv6qiVMGLv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLRo3W5jh5w4qEkkzV7gEIoWEz6BPVyKYZTf1DeVKjw=;
 b=HVogalaQF5ZqTZEJD93gu+6Ui4xDgF08eaLsoDeaYHjApWf1N5loi705XK3g2Hqxc/E2a9lTdQieEQDtIYmZGKgurGL0J0O2ARX5vwc/UvtbVI70VdgWgFaQskWC5sSA73FBE6cD4saBplkFQp/FtPuw3BKNU0CXN9SvXSw1cX4FnLg0dEqTPTemaFfWULuyOzkz4Wd3w7OGDqMQ4aKwQ9jN3J8m2LJYU99XSnstE+OHMxUdW8+g2lvrjFLSc9nQjWLZ5Zma1SFj1pf14OMkwwPtrrxeyLvhdF+59MhMYfF0jYcJ8Fd7d/lPpgLn+8Kc04qVUuulT9erK+nAzaa/vg==
Received: from CWLP265CA0376.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5e::28)
 by GV2PR10MB6044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 07:41:41 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:401:5e:cafe::cd) by CWLP265CA0376.outlook.office365.com
 (2603:10a6:401:5e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 07:41:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 07:41:40 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:39:24 +0100
Received: from [10.252.23.232] (10.252.23.232) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:41:39 +0100
Message-ID: <82b5938c-59cd-4596-971c-47bd4276dee7@foss.st.com>
Date: Thu, 30 Oct 2025 08:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-2-b42847884974@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250904-master-v3-2-b42847884974@foss.st.com>
X-Originating-IP: [10.252.23.232]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|GV2PR10MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 5294f019-a457-4b51-f29e-08de1787c3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzdOY3F1YXVSTFJkcXpKa21vRkJ1dU1SOXlDcmtIeGpZdlZyVTl3WlI2V2Qx?=
 =?utf-8?B?L1Rma2kwMkhZUWRiQWVFbDQzalByMWRKVkFmYXkwdWFnMTkzaFd5UE4wVmtJ?=
 =?utf-8?B?VC9nekZiSFVNSjdxVzlhY0FuOVZGbWZDeUQrV0RYbEhWd2lFQ0swaWVsaTd1?=
 =?utf-8?B?cUtzK0F6d1BKMTNhdkwwRjdGdWx6L0NIRmhsN1ZIQ3UwbnBkSjZaSW1zL3ln?=
 =?utf-8?B?V1dDcEpzMk4rRlBGOGtvSlU2dHMyaE9mZVlUSFVrY3lRQ0RqU2NFcVdLcDM1?=
 =?utf-8?B?UTI3aVQ0eE0zWXNwU1crTVVmb3BJRXdyWEZLVkgzNEJBQ2x1ZVhwdjgwSGZK?=
 =?utf-8?B?ZHNhN1orcXVLWmovRmZKT1BxMUZiaG1scDQ0REhFLytjT0hlN0Fra0lXc1di?=
 =?utf-8?B?by9xSWczcGFpVEpFd1drL0xDbkhHckVsbkVFd0hmMXdzVkRVL2t2akJjeVUy?=
 =?utf-8?B?RTI3azhTOXdTQ1BhLzMxMnN1OHNkaFdEeFVjMlh5enpDUkN4emNkZEZOUnFD?=
 =?utf-8?B?VU1NaGdYRGwySERma2U4SGkvTGw2QjlmeEYwdHpYeGFsakovamtQUk5oaHVD?=
 =?utf-8?B?YzhSVjhVMmxaYmJzYTBheFdLcFVnUTM0aXF2RDBCZ0w0U2xKVFVlWnlaeTRm?=
 =?utf-8?B?L01lRmYxVUdBd2ZlZ2ZWeHczM24rY3RCRWFZSXY4RnlxNE5rOFRPM2VJNHVU?=
 =?utf-8?B?dDdianE5cWxpOXlIeU1MU1RXQTNTQnR6ZUNsdStkaWJnUGovMTRKOHVoU0Mx?=
 =?utf-8?B?alFBVnk0aWdjanBIVFpDWm5aOXNaejNuSVQxSFUycVJ2R1NjUUoxYkRLZ2Fj?=
 =?utf-8?B?ZWRNd3E3YWpwWHQ0RDZRdXFCMm1CRDFNdGtzWEZzb0lEQXM2cVFkRVZTL3hs?=
 =?utf-8?B?blEzQ1dsNXlPa2dNdFNhbXRvanNYOVYwbHE1MktaLzdGdkpPbzgzVkFCdmVJ?=
 =?utf-8?B?UEo3a2E5cFg3R1VwWk00ZE0yVWhXdldUei8vRVUwc0hmTzhCQVQwS3Btamgv?=
 =?utf-8?B?YUFWck1FaUxSTURtWFhMSWRyTlZGOGJkd3Q1STRXRm1LNldvYk9VUnU5NGlm?=
 =?utf-8?B?QXN3U3hnT2hJcjlwQ2s4dGFTNzk1dkFlVis5Q1VjZ2Mwd0lqVHB2THRKY0pR?=
 =?utf-8?B?V3N0dlZmcit6Z3M3Mm1XRTFXb01DMlFyUmxXMWpNY2l3cEh0c3p4MG5xdlVT?=
 =?utf-8?B?clpVNXFGUFpCUk8vNFdVZkNKTXRNSDArR1JyeWI5SXFlQmsxclMwVlAyOFB3?=
 =?utf-8?B?ZHpXNzVwT1lTQTk1NjZ6VURRQWhWbXJXcUJScTBjSmFQSVRUZGthcGo0a1Jz?=
 =?utf-8?B?dTE2Q1IzYU5LVVVUVVRTNEZPZ1UwYzZCdEg0c3NxRGdXa3I3UEgwTHRZYzVG?=
 =?utf-8?B?VHhFQjM0MDJPeDQwaDNuU3UxSE54Q1BCbUpCeXZTdWRFOCs4QVIySm9JQmFO?=
 =?utf-8?B?NCtiMlRIOHFJZUE1cm1UQW44dlVDZWtKdWd0aGdjRDlpV0VDY0VReS82T3hi?=
 =?utf-8?B?MU5FM3M0bHk0RWN1d1llRUJZRFEzeGE1UEtVTzF6WE1YV0NvVGtaM3R1UGZ5?=
 =?utf-8?B?aGlvVnVRV1pqUm5RMkhMMXdsOWQ4VUtFTFVFT1UwcUQ5d21CSWVob0l4ZUhC?=
 =?utf-8?B?Z0pRbUFTOXdyR2swVHZBRGtFejcvV2FTS3hkQmNNYlVMK3c4NFNhMjkxM3pV?=
 =?utf-8?B?d0JrY05Zc1Z6UWJMWjBLZm9Wb0RuV2psajhtWFpRbWNWODFza2J1VkZZTWdz?=
 =?utf-8?B?UnNlOFJhc0g0cThESFJHVjVGK1pxVXlvbzd2Nzd3R3BTMFQrNlo3VDJSVlJy?=
 =?utf-8?B?SGdZUGRKQW5GOXIxWUNKdGhnZkd6V0hnWEI5WkFBVVFrWnBEZExFcVBSNHky?=
 =?utf-8?B?RXkvaVVQa3JodFk3TitBY3J4OTRod3BNamtZSXNjdm5ZOFZwMk5CYU5vc1Jn?=
 =?utf-8?B?WkJKUzEvcGJDVkVQWUdESTY4aTQyNWs5OVpyVHl2UHQydVB1Wk5zYjNmQWo2?=
 =?utf-8?B?aVZPd0o5eVlEZlZHWGRRVVhQL21WQkRLNnMwa2d0NFo4V2NIQ3kxYzRMaDA1?=
 =?utf-8?B?ZUlyKzd6SWZuOXU5a1BsMm5PMW9oZzN0bVhhZGU4djlpbXNwbE5YYVB5bjFW?=
 =?utf-8?Q?4YcHXWVDFfROxZym6QAZ3yDqv?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 07:41:40.3196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5294f019-a457-4b51-f29e-08de1787c3b0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6044
X-Authority-Analysis: v=2.4 cv=JMU2csKb c=1 sm=1 tr=0 ts=690316ba cx=c_pps
 a=mvxltUZ4cO/riayU31U9hw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ttam_Flv6DUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=5-UEqyCUgD__VgFuBE0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 0rITvwRnUnqjAyhZGY7cfN3ft95e87xb
X-Proofpoint-GUID: 0rITvwRnUnqjAyhZGY7cfN3ft95e87xb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MSBTYWx0ZWRfX7qP1vVKRWATG
 7zaUL2vXBkyTHg5R1JpMk0+rjolxUTk9LEQ3jZhrxp5DxDOdo2jgnPkem2Ty81i+NnG8B5jtM3X
 0K0CJpfryOUsz82oc0uKdQOHY+5zCfpACUkkZy3DBbhvtA0nvhFwXXyrp/ozaJo95aBxY6ddTAZ
 forWmPMr3gsoSKG2GH1BPDgrVGDuZbwFWw2LNY54eTHYnUf845rbheWtyXnifcUcVNKfHaURd1F
 UytkdGklljY0Kb8T6Kg2AJobSuXBvANLIICC1eAbnlGgDl1P187UC1EddVxPZTeq68vp2CH1vyF
 zuLBRNEC8VWmBsJcYD0pfoBqVnk+R3naJhiLjzbEOyI4/ou1T8UPZhduIoLLJ+xxm1pua0FaCAe
 QRUtwZu1/bfDeGWtZGNroupgRT9O4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300061
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 2/7] video: simple_panel: add support
 for "panel-lvds" display
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
NTMsIFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBBZGQgdGhlIGNvbXBhdGlibGUg
InBhbmVsLWx2ZHMiIGZvciBzaW1wbGUtcGFuZWwgZHJpdmVyIGluIFUtQm9vdC4gIEluCj4gTGlu
dXggdGhpcyBjb21wYXRpYmxlIGlzIG1hbmFnZWQgYnkgdGhlIGRyaXZlcgo+IGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMgYnV0IGluIFUtQm9vdCB0aGUgc3BlY2lmaWMgTFZEUwo+
IGZlYXR1cmVzIChidXNfZm9ybWF0L2J1c19mbGFncykgYXJlIG5vdCBzdXBwb3J0ZWQuCj4KPiBS
ZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMt
cG91QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aWRlby9zaW1wbGVfcGFuZWwuYyB8
IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9zaW1wbGVfcGFuZWwuYyBiL2RyaXZlcnMvdmlkZW8vc2ltcGxlX3BhbmVs
LmMKPiBpbmRleCBiNmM1YjA1OGIyZTk2N2JiYmQ0N2FiM2MzY2U1Y2E1MmM3ODA0NDA5Li4wZjIz
ZGY3MDFiYzNjNDBlYTQ5MzgwYmJmYTM3NDNlZTU5MmQ4YmQzIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdmlkZW8vc2ltcGxlX3BhbmVsLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL3NpbXBsZV9wYW5l
bC5jCj4gQEAgLTE5MSw2ICsxOTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1pcGlfZHNpX3Bh
bmVsX3BsYXQgcGFuYXNvbmljX3Z2eDEwZjAwNGIwMCA9IHsKPiAgIAo+ICAgc3RhdGljIGNvbnN0
IHN0cnVjdCB1ZGV2aWNlX2lkIHNpbXBsZV9wYW5lbF9pZHNbXSA9IHsKPiAgIAl7IC5jb21wYXRp
YmxlID0gInNpbXBsZS1wYW5lbCIgfSwKPiArCXsgLmNvbXBhdGlibGUgPSAicGFuZWwtbHZkcyIg
fSwKPiAgIAl7IC5jb21wYXRpYmxlID0gImF1byxiMTMzeHRuMDEiIH0sCj4gICAJeyAuY29tcGF0
aWJsZSA9ICJhdW8sYjExNnh3MDMiIH0sCj4gICAJeyAuY29tcGF0aWJsZSA9ICJhdW8sYjEzM2h0
bjAxIiB9LAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==
