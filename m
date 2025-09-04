Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF618B43C1F
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 14:53:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4E74C3FAD2;
	Thu,  4 Sep 2025 12:53:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03B50C3FAD0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:53:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584CPcak012539;
 Thu, 4 Sep 2025 14:53:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SZOd8LYCkfKNCD2XZwRoPyisS/gGgS/+tZG19sUDvvA=; b=eMeh/foiaG2cWCUv
 hidnEP55h41xQEXEayhiij3B2YAL2snmA9b0JSx7TTYQhLrkcsN1D3Yx/E4WrkyD
 as7d+XAGqC9u1p+SSV4r5LZHYcvpODNAj4Y8toD52/HZ8Bi20pbRS4C8pSfx3SpU
 Eu3DSyYS1aBizMSz5lZ8xDzSpSJ7RHmJCpoDY/L5BcaZ9qIg6EgGjIUqp0Y62WBF
 b0Z/QjHy8xzFzHzr6LngYpYGWX9sSSoX9CcE3Yh5UftF/xQ1+glFJkf8yj5dJ5S8
 xoEoTfd5rHMzLyS8FBUMMs70VTaVqRBHXsKyvkiF6xqjWN6LV1pqu90Zmr/fBQU3
 2rWlRw==
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxp0y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 14:53:16 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryr/vTOLFTymXFYBieuA+u0AnQzoafinXvsl1ScaDaJPics0a3gdsoL0e3nLYwTPt+9xB3LW2MeIEAb0hWPn9Z751dhBXb8l4rZka6HEPN9MF5zNWnS/TgGfWGmUI9ZcGL2NtnV0IifL8B+NW2B4qN5UyVb4UHpxJWskYHk9lw+4+WDGZ42BVhLi8y7GSL86zelLVBCfRlue2h31axOXV5OPKEQtDUaYS4vkgQjJ4dg44gAqSEj3+tNmT2p0Fyqn6KE8cHv119B6VIXe8NfEyx/5YuMxWxaWXzrmtmGlJBTctwjk6WdXc1dlmYR24Py5r+vYDMIR+i5TxrVu4PiQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZOd8LYCkfKNCD2XZwRoPyisS/gGgS/+tZG19sUDvvA=;
 b=ijufXJFdwfu+UOl9b1zJRYpwLnLqN1O0+kflSVT88KqCtABMx/UxoQZNJmUOndn2dyhVg1G+xSwsNouGBgy+VkP597wC/ge6DUy53Lvzjv+7l18Q3ap7wuoSTQzinnhVVBtOSRSkriyKCOly7b9GePgjVp+e1fUamKT/Cij0qGdqj68cW96BRbfc/orGrsIAr2uv34tDb/2ApXZKYMAhAy9p+Zn+cZsDvAYUOzIhRD+u1qCwFCcWTSQlWy84bkuQEeTPN07J12MxC5YJP4RZORY0r9un5L0QSXkGl88Q9lch9DbcGBYUYD6GDue0hmJwAYpjKvVD29+Do5H1K4aBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 164.130.1.43) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=foss.st.com; 
 dmarc=temperror action=none header.from=foss.st.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZOd8LYCkfKNCD2XZwRoPyisS/gGgS/+tZG19sUDvvA=;
 b=gHYN4QToaTOKbv3BJDqxc+m5YnNzpBjlxuzBScPNjF0tG6BGdh6bH61ahiknrBKn1BMHknwj1O5jO1H6racU/Koj95yLQ9Gy31ydJ175ohf7p+GjsVDInUoxwLr93yKJb4M5553jUCHkjnYMYec24dusiehOdxJJCKytCollAto=
Received: from DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) by GV1PR10MB8495.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 4 Sep
 2025 12:53:14 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::49) by DUZPR01CA0212.outlook.office365.com
 (2603:10a6:10:4b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 12:53:12 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 164.130.1.43) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=foss.st.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of foss.st.com: DNS Timeout)
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 12:53:13 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:50:54 +0200
Received: from localhost (10.252.28.189) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 14:53:12 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 4 Sep 2025 14:53:06 +0200
MIME-Version: 1.0
Message-ID: <20250904-master-v3-2-b42847884974@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|GV1PR10MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4ee3df-fbd5-41c7-1e2e-08ddebb2025f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3drUGpTWFdsQlZ3bnFtR05Bck9QSWd5TDEramZRVS9OMTZMUk1Nd0FBQmhD?=
 =?utf-8?B?TGY2Qkc4N3BTc0Iza3dzVFhZeEQ3ZjV6SHcreVIvNUpsYkdZVDd1VDFoWkda?=
 =?utf-8?B?eGZzNHVLSzh3ZHpnTlQ1VWJqTFBONE9zajl1cFFRVzhLZS93RVdVWWFoS09G?=
 =?utf-8?B?aGVqQW9yenNUQXA1S0txUDVnLzJ0Y2NDNDJrdzN4eWxuZ21EWGk2dzFQdDlo?=
 =?utf-8?B?eTcxVHAzVmYxcDFoU0xvbm9jUG1GSDAzdy9TdElzSG5oV0MvZDg3Vy9JY3ZZ?=
 =?utf-8?B?bEo2VElqZHVEUkRrS1gzYzZrWTV6Y0NySjZ1Nk9CeCtiMmFDS3paYUkwYXZi?=
 =?utf-8?B?ZC9ZT2wxZm41Tll3b054a29HZnFhY01ZT29XMWY0S3hQNnVrTEE5NW1JWHI4?=
 =?utf-8?B?citvZTdCRGo4TlVWYVV2akcyUjF6dHduNjNGOEhURGNNWURORVJpZTNOcVBM?=
 =?utf-8?B?b1QwQVhIQjFJc1hMRDgxUi85TnZOdjJla1hBVmoxN3hqYWtLc2p3ZFIvd3E5?=
 =?utf-8?B?eUdyTDNzVEtyTTRnVWR6TjZGd3VVUzMxZmNMaXFHbC9ldkhRSnZkU0dkcTJW?=
 =?utf-8?B?QTBndmo0OHZlUVVJc1F4TFhLRG11RVgyTENuVjJZNVplN3hPMHhTOEd4VTN1?=
 =?utf-8?B?aHVtWENmNUZDWG4rQkt2WHcweWQvR3g4ZjYvWm5tK3VjQjdpWXJXR1NPNE44?=
 =?utf-8?B?Tm5oZUZPam9rSitrNDJMOEZMbU5Xa25vTFViTU40aGt1VDdtQmZtMGVSdHVM?=
 =?utf-8?B?UXNCQWlpOVJSNmc2c2oyMXliTUdXOG5lYy9uNThOTGd0eXFXSnA4VWVlVGhk?=
 =?utf-8?B?b3pYRExLbmovK29xbHBVQW5QRGNsVDhsYjNFazdTTmVITnhwWVlacmoreWhs?=
 =?utf-8?B?OXNaZkRKQ1orY0RXU2lpSm42STNHRFkybksyRm9yZ0pRbG1uLzUyMlhPOTRF?=
 =?utf-8?B?NkVmYVZuV1BUQVhrd3Q4dmFKT3laV1lnWlRBOGdRanhIdXRHRE1TaDR3bDhQ?=
 =?utf-8?B?aGh5WDdvdi8va3dNZnhCbmxobk96RmxMekpIMTRSMnk5cEhDYjdIZkhHN1FR?=
 =?utf-8?B?WklvYk44RnQ5NGRrZkI4Z3Z5UmdtRkNYTHh3UFNqYUI0QnFjNlRFOGRPYTRJ?=
 =?utf-8?B?NEVLc0VueFdoQkhUV2dvbWxqSjFmbUlpTlFFcnJFTVR0NnI0c3IvUVNvd3RI?=
 =?utf-8?B?MW5CdzRJQzJ0dm5xRkpvSmFTY2RzMFp5NXBXVGNOVG1NV3JOSzNJTm45YTNh?=
 =?utf-8?B?WjhpUllrcnVML3JOa0pkc2F6V0lNT2RxOG9UWU5XQklhZmlXOU9TYkxOVk0w?=
 =?utf-8?B?RCtjZVZkei9lOSs5UjFiNW1UZFZZMUo0WGZ3Q05UdTZXTUUvK1ljM3VDTjAz?=
 =?utf-8?B?eTVnZVZEMWZGTytDbGx0NG80S1AwRE5NMFcxZEJRWk1DNXZsUnN0ZXB3QzQ5?=
 =?utf-8?B?dFRicitvY0piMWZrM3pWbXBCZGJKdmVYUnlSV2p0bUxrR2tZd3VLZE9Vb0Np?=
 =?utf-8?B?ZFFWUi9TQ1VjNVNrSlcrZTlubS9WMjR3cGlETDliLzlPemVxYUplRmwybHNh?=
 =?utf-8?B?eWpCZ0RCYkJOcGxPQWY2YUhVRU5icCtkVTRFZEE0dzFmTVN1c3k4YTlHd2xY?=
 =?utf-8?B?Qm1JUTEwSXc5RHlVQ1VCRXpremZPU3FZWkRVVjFubzBGTEQzZnY5MFlGVndI?=
 =?utf-8?B?SlM4RDBYRTVmM2VsRHR4ZUpIZndsVnprQWJRcWpxUVorK29uTjhnOU5kdkdy?=
 =?utf-8?B?SVc4SjBIVzhVWTQ5YklHMUJ2enVxUWJ1M2FSdkZlSWlzNnZkWDdIcGVRYWZv?=
 =?utf-8?B?Z0E3dmNJOTNDdzFuN3BmYlBZL21MN0U0SjBuMW0rMDlOVDdCa0k4THpEeUFl?=
 =?utf-8?B?UEgxWnBTR21jdXIxcmY3RHVmdnBxWlFsbmZ0U2txZ25CbGxZWnVVUDBzVisz?=
 =?utf-8?B?M1JKS3BYa005V2hEcHQrTFBYOEg0NDIzQ1VZY0dwTWhYSkp4TlFCbENjKzdO?=
 =?utf-8?B?WkxPOEloU2lRa2pMbDlucEI3cm1nSjJhZHU3WExYYTl1WCtWSUNoQ2hsODJ0?=
 =?utf-8?B?ZmtZT0VMMlZJRzdmS0dsU0pSWnJvL3dqT0xIQT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:53:13.1822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4ee3df-fbd5-41c7-1e2e-08ddebb2025f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8495
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNSBTYWx0ZWRfXw4MtJvs5QtRv
 yXeZv0VVxQXao8nqylpXsHrzbqzOS55Lpqis8X7HrkE+hoFfqhP7dye2JtvjGp0quh5CowN6cZV
 Dkoa9Dx2pdFU5H6A++mFsZWkqSiv5suzf/0Rcp9c7sKZCq3Kz0XsoqU7ylbmyU8JzIAhs5J4Ucb
 JyTnstBmgDkh52pLa6a2pJTrrv1l8P1xBp1SPeoXJKlNp+ipnT3HzGoRBLH9Zbzp6PGxZhtO05Y
 YNCZvz7Tq61cA/zjhjMDHDxymzU1x2C9OReYA+FEsigYWHEbDA5V0YqrAJ6dHKvRgsLOUrSrIcs
 sa6mbF1oApvssr9pk/iE4Bf3+flnu6cC/OkeE949OO2r0FPl6vrGNF25eqVRTg8uOEtfgVFiJgV
 8v5q9Ohq
X-Authority-Analysis: v=2.4 cv=dqLbC0g4 c=1 sm=1 tr=0 ts=68b98bbc cx=c_pps
 a=Z1aKtg390Pb53hnSiQipVg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=QntWg-Jy-EcA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=gdDcLP8PJbfKwgDRBEAA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: tJ28jmaZ2iZrcQo0aVgLZOi8Iag-S0mg
X-Proofpoint-GUID: tJ28jmaZ2iZrcQo0aVgLZOi8Iag-S0mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300025
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v3 2/7] video: simple_panel: add support for
 "panel-lvds" display
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

Add the compatible "panel-lvds" for simple-panel driver in U-Boot.  In
Linux this compatible is managed by the driver
drivers/gpu/drm/panel/panel-lvds.c but in U-Boot the specific LVDS
features (bus_format/bus_flags) are not supported.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/video/simple_panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/simple_panel.c b/drivers/video/simple_panel.c
index b6c5b058b2e967bbbd47ab3c3ce5ca52c7804409..0f23df701bc3c40ea49380bbfa3743ee592d8bd3 100644
--- a/drivers/video/simple_panel.c
+++ b/drivers/video/simple_panel.c
@@ -191,6 +191,7 @@ static const struct mipi_dsi_panel_plat panasonic_vvx10f004b00 = {
 
 static const struct udevice_id simple_panel_ids[] = {
 	{ .compatible = "simple-panel" },
+	{ .compatible = "panel-lvds" },
 	{ .compatible = "auo,b133xtn01" },
 	{ .compatible = "auo,b116xw03" },
 	{ .compatible = "auo,b133htn01" },

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
