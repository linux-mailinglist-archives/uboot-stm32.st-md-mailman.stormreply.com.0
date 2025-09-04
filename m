Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7738B43C1C
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 14:53:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83F66C3FAD0;
	Thu,  4 Sep 2025 12:53:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D705AC36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:53:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584CPsJ8003771;
 Thu, 4 Sep 2025 14:53:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 aITp0bEaIVkFgg5Z9Fe8Fp3Ccxym7EItdtJX7gXUyUA=; b=aUNN8UJ2jsAAbIEG
 TF+9iwEcZbfU1UexGPJsvqeiwxKEr4IhSVyHRAUQGQ9+Twng32nTGhvk0U8yNOMV
 D5XT493HYzxOvrAQdXrTcEadyj1MgxdIo2ffqE1qF1mCYADbLFdoKtpQCGYp15bj
 qoBb/TWJ/0n1vlexIxEtOgmd8aS7ca3Ls13Y8U5NWloWuatXGCjim1jOj0a5pW0M
 LstnxXKOLuGAUulyPzIqUePP5UTHjhpmCmqpBlPKjKt4x6dzuOL8nfK/pcPAnWt8
 ZXcGGVslP6jqc1W1CDAbCTwS7qEkoxoOCWK2fcQp6BjllMDqQdGOZWoHpunOZs+S
 c2CFSg==
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013000.outbound.protection.outlook.com
 [52.101.83.0])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6fw62h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 14:53:16 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b33VPswU6s1ekbpoqiw6uP6D9HYY5Q7yfpo+/GC+2FdwCBEPCxORa1eBu8mc3222Ig7fqGw2iOuPnmQaH5GUa/2gQx6Vf0aTidX2M9tcrZeJhY8Xc1VIm9F5piYHmk/jGnqto4Dw45oyB6UaFFEgf9glfGmfW7+1V4P63L0KpqBalvNdK9Vrvl1xd/4yplSbqZuU7pacCYphfEoI1W5DTZOduHFciV6N5t8cp9lM8bn5KQYYYVEHOmKNoljivUziMLXjdakZRt4aNFza7adJKRMuYA7KVh7N/mUl7w3WmEWvGIiuHQrgi7hsockTER0RXOj877p99ETIaa9/K7jnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aITp0bEaIVkFgg5Z9Fe8Fp3Ccxym7EItdtJX7gXUyUA=;
 b=ZC0/0/PHnT+48vlmIMUzQZqzH02bcWsq+XoLorqmuhyWbp/TA8HqgAkZgRVL663ybaQMLTAZ2trNoYYkvCwZ8mmO6+AT9RnIh5luLffHYR01swHhv2icadT/82eKCU81Cvi9p7WWekAG/6mi/bTlVpDU4jbpRxFaB2AFlIR9N4V4Bemju3vPNo5F+Em8G/hUPKW06E+mwNkVC5xFJ+vjtzPLGdqk3iEXYzbHQkZaWfKXv1nJSaMOuqToLgzNeeuMrLRwQSK3K6O5p40lSgtcvU79fcuHSsR2vhdWURn/i7fInYqGMkWIKr3yavJlgP6sdajJh192pwL7IL27GmkYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aITp0bEaIVkFgg5Z9Fe8Fp3Ccxym7EItdtJX7gXUyUA=;
 b=X+6VEZX49sW6q8wKMg06S4YKXihSb7i26G7IH0G1U5EC5Pv+bVKGYz52u8iTPyA8db3WkY40SxfXCbGN+dWluVu2ogVKD96gb2zFS8bFPmRdanrRBBbibKtm+HRFc5dWFUI1i5Rs1eLpQYZ1/zFco3la4wK6mWYU0vTVgOAO/n8=
Received: from DUZPR01CA0243.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::11) by DB8PR10MB3960.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:14b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 12:53:15 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::6c) by DUZPR01CA0243.outlook.office365.com
 (2603:10a6:10:4b5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:53:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 12:53:15 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:50:56 +0200
Received: from localhost (10.252.28.189) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:53:14 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 4 Sep 2025 14:53:08 +0200
MIME-Version: 1.0
Message-ID: <20250904-master-v3-4-b42847884974@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
In-Reply-To: <20250904-master-v3-0-b42847884974@foss.st.com>
To: Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.28.189]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|DB8PR10MB3960:EE_
X-MS-Office365-Filtering-Correlation-Id: c90390ca-e997-405e-2709-08ddebb20379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzZtRVI3R0RYb0daRlNFNU1qcHFvRThQOGJxTWdkZ0NLODB4U1VidVlYYVp5?=
 =?utf-8?B?K1p3a1JneG1ZUjg2YlBPS3FaWUhjU2NTTXphLzlyRDd5RW0yUFZQaElRVWpI?=
 =?utf-8?B?TjRFOFN5RmJBenJzSjVsRlFzZFM5dVEzV1RaYitxSTBKOG0vMElSZHp1ZnRG?=
 =?utf-8?B?ZUNmcnpYTXNCUVlIMEJYQ0JxNlU5ZGhLMXV4ekhQYmsyY29WazdOSjR1YVR6?=
 =?utf-8?B?d0lyVUpaODBWSVBzV241SzJzRFRUVXF3OFZuME1TOVE0M015SjBDOFdvUm0y?=
 =?utf-8?B?VWcvVDNzTmNid1R6aEVsMzBQUEJzVU5pQjNtWFVjekFBRW5XREwxSm9vdGpm?=
 =?utf-8?B?ZnUraWVKakErWUQ2dlI3amF1VUpXZFF1UWxFT2JUcXVhUVlqMnRpcWVmRXhI?=
 =?utf-8?B?UFZ1UGxEVmNiNmNxQ3ZLanJGOG5wUmQwNWlqNG95aXYwb2Fkd1dJamMzbTFy?=
 =?utf-8?B?cG92bkpwTEJBYjd1ejFFYkdDdmpMMTBEanZOWjZIZlVxbkp3bTBrR3JXRU0w?=
 =?utf-8?B?ME5NU01CNnN5Y295TEJwSWJETUViZTdUUTRic1AwUWZvdlBMb1VCbVcyeFJv?=
 =?utf-8?B?SEgrbm9VSm1kaU8zUmxHdGRzeTJWNHV2TFNXM3NvcHBYOXBMeWI3N3RIL3hJ?=
 =?utf-8?B?Z2tvOGhZRmx2Rkxab0RsNno0UkEzUUgyNGRGSmxWYjhBWWRwUnRhcW9tYnU2?=
 =?utf-8?B?WWErYXd5MUc5SVJUVU4xZm9XNjFpQjRhYUtLTmZ2aW4xdWNDeDdhQThNUDd1?=
 =?utf-8?B?Z1NLZHRPK05LTDBNVElSY1FpYlFaQnpINCsrT0FoRGV3ZWluem95YUJOSnZW?=
 =?utf-8?B?NDA3eTRvYzFoYVMzbWZITnRWYU5VT0FIZVZOM3BkN1l0SDYrR3RtbGl2MFZv?=
 =?utf-8?B?MGxQcGRrUTZqYUxFa1dQNGR2VGFSQXgrUkdtME90M1B5UGhLUkpDancvdlBO?=
 =?utf-8?B?a0F6LysvdnBqc3hxcGdrNFpVVWIwUWFlTzB3QWFQVzN3WFo5Ty8xNXhQcDQz?=
 =?utf-8?B?R2RRTzhRY0dtSldTTEQrYUVGM0trcjhtdTYzUUpqNGRwdTR0T2xQb3M4WGZi?=
 =?utf-8?B?dTREeUEyeWFVTyt3RFNSeTFmakhMSTdaaGp3T21OTmhNcUJid2ZUQ0N3aVla?=
 =?utf-8?B?bkFYVmR2Nk5QMDJUYzh4L3dVUE9CMy9zKy9BZkpTYk0rcEdxK000SzY4TW1U?=
 =?utf-8?B?czV4bmdlSmZ0eUczejFKMzFQL2VvSUZoVkw1T3NlUUMxVnZQUzNrKzlHNmJk?=
 =?utf-8?B?Q2xESldlOHB0RHh2cWdRWUJ1QVBsQXRXWjM1ckZoOTl5SmloVjQvS1NBTlFY?=
 =?utf-8?B?K1VRNHByZFgySXowK0NIN05FcVFZMll1OFU1RU93Mjh4ZG1pVTlHUlJPMEYv?=
 =?utf-8?B?d0dQZU0yZkRKRzl3REptYXd1UWN6T1RzbVo5TGdwTGFjanR2bGJUazJKajdD?=
 =?utf-8?B?NnhnWEZkaHhEaEp4V0xxcitsa243eU9NSHJGWFF6TExZWjE2eGdoRmVLK1kv?=
 =?utf-8?B?bUxiajRWVWc3U3RsaUJuVWx1V1hBY1IvaVE2MzFXYmRDRmdUQ2JGcGVONEdJ?=
 =?utf-8?B?YVgrYlB4N3BjSVc2RUo0SGdKbS9TNmpJQnlTWEpwRnpsQXU0bzBTZTQxRXFF?=
 =?utf-8?B?UFgzOUc1Tk5NZEc0RjhHN2JWMWFjTUZXN0drSUx6eXByc1dNWkE0dzJFSmZJ?=
 =?utf-8?B?cVMxN2NsTEpmSlR3Qm5UVmdSZ1BIVHZOdWVrSC93L2s5N1B0Z2R3NXVlemVE?=
 =?utf-8?B?d3NVY3JmY0dzV25IQThFVFlvNzAyTWZ4OFZnaU9uZkVtaUxqUWFOZWR4ZDVk?=
 =?utf-8?B?aTdoZDU2aDRxMjdNU1h1OXVGZzlZWDlEaHpTUEVLUnlhVlM0S3NqUUNtdmJ0?=
 =?utf-8?B?U0o2RldsZVBjSUh1ZHNRVFBKMG0wUFZyYVZiTkRpQXNlT1BUbVU0YzdXTXkr?=
 =?utf-8?B?bGlFNEhHMldTVkdBNHVDZnRLR1dmL0pBZlZHNHd2ajVyekg5UFBBelJRRzFy?=
 =?utf-8?B?M2JxUmNrMExGdHdOSG1FSjd6U1l6cjI3ejFtTGtSZWRJVWxQTzdFTjRTR0lS?=
 =?utf-8?B?Mzl1enlmczRpYW1NVmtreTMyejl4ZTduOWQrdz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:53:15.0261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c90390ca-e997-405e-2709-08ddebb20379
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3960
X-Authority-Analysis: v=2.4 cv=Ts3mhCXh c=1 sm=1 tr=0 ts=68b98bbc cx=c_pps
 a=nByTnSNBlmrEcbo/XTjLTw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=QntWg-Jy-EcA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=3m7zQxU1K7Cpftt6fvcA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: c_dG9JxOVdYRIvG9r4OhVS7rnOcX7A7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOCBTYWx0ZWRfXyrOFNru78BiO
 3uBs5gCrFVTtNAQWK7W6CjCBpdcC7v8+W/tMc6DdsAH3Vgn4vyAkdgv2DWQao4MtkKSnlKlzwuh
 e6OQ14VPK9zpabn1uCxBwqjTj0ezAZxzuBa2RD6ekqTjzFgqjwspTDm4erXUON4GosvTYvxFKaL
 ecLVli5Azw88i4ZkHxsAxaRB9Ek8ILIICfqgOWeBcOI16uHLvBjhAnRco6/RPTdbMjbDcD7B5KE
 Wd86XcsQUliRqC6PbUoB05oz9d8kcRqMi6gaE1sKlfhV1uorwfM1KDd4tdbjKcKbZDs/ZeT9DT7
 edVNx/6UmnH4rgss8Uzp7UHUVh03fpqYWW9m6ixt5Y1V+nCEjtoEBvCrmL/+9Ebe+4t46pK2tGQ
 yiQ2cmhn
X-Proofpoint-GUID: c_dG9JxOVdYRIvG9r4OhVS7rnOcX7A7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300018
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v3 4/7] video: stm32: ltdc: support new
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

STM32MP2 SoCs feature a new version of the LTDC IP.  This new version
features a bus clock, as well as a 150MHz pad frequency.  Add its
compatible to the list of device to probe and handle quirks.  The new
hardware version features a bus clock.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/video/stm32/stm32_ltdc.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index 0a062c8939dbe49b11aa50f5ca9701bdbe5c5b0b..efe9a00996eca0301d2a2b82074ba9690a967a73 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -262,6 +262,7 @@ static const u32 layer_regs_a2[] = {
 #define HWVER_10300 0x010300
 #define HWVER_20101 0x020101
 #define HWVER_40100 0x040100
+#define HWVER_40101 0x040101
 
 enum stm32_ltdc_pix_fmt {
 	PF_ARGB8888 = 0,	/* ARGB [32 bits] */
@@ -529,7 +530,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	struct udevice *bridge = NULL;
 	struct udevice *panel = NULL;
 	struct display_timing timings;
-	struct clk pclk;
+	struct clk pclk, bclk;
 	struct reset_ctl rst;
 	ulong rate;
 	int ret;
@@ -540,7 +541,21 @@ static int stm32_ltdc_probe(struct udevice *dev)
 		return -EINVAL;
 	}
 
-	ret = clk_get_by_index(dev, 0, &pclk);
+	ret = clk_get_by_name(dev, "bus", &bclk);
+	if (ret) {
+		if (ret != -ENODATA) {
+			dev_err(dev, "bus clock get error %d\n", ret);
+			return ret;
+		}
+	} else {
+		ret = clk_enable(&bclk);
+		if (ret) {
+			dev_err(dev, "bus clock enable error %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = clk_get_by_name(dev, "lcd", &pclk);
 	if (ret) {
 		dev_err(dev, "peripheral clock get error %d\n", ret);
 		return ret;
@@ -566,6 +581,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
 		priv->pix_fmt_hw = pix_fmt_a1;
 		break;
 	case HWVER_40100:
+	case HWVER_40101:
 		priv->layer_regs = layer_regs_a2;
 		priv->pix_fmt_hw = pix_fmt_a2;
 		break;
@@ -688,6 +704,8 @@ static int stm32_ltdc_bind(struct udevice *dev)
 
 static const struct udevice_id stm32_ltdc_ids[] = {
 	{ .compatible = "st,stm32-ltdc" },
+	{ .compatible = "st,stm32mp251-ltdc" },
+	{ .compatible = "st,stm32mp255-ltdc" },
 	{ }
 };
 

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
