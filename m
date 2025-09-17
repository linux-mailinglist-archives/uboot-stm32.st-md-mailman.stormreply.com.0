Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A66B7D016
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Sep 2025 14:15:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 577BDC3F930;
	Wed, 17 Sep 2025 07:26:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D092C3F92E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 07:26:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H6ij9n002680;
 Wed, 17 Sep 2025 09:26:11 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxkt3bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Sep 2025 09:26:11 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b680/TmByhJGYqLG/yPnqkuDYxFVdTuIT8b8ZCf0hTAd6kqnrHj9rUgAftKNebTmNGI58e8amb3zrVSQ4j+PzXSnm2/F3Ecdrc13F0Yo8PZ4uISlSVAbx8tpohyHvxhK96VM1A4TDnj4k7n6jNQs1KTpGLhD2A3mCAu5lfz/tMEtIUdnqp4KGQDDkIKfFIZC03D4IJ5FqT0pMZ70eQHxXtgykaXD9KBNP9l+7vr2Ym9uOaAxjAGM419k6Rtvlu5hxcll2le0YxGhdEI5E+/OIucVXy6563/iUCQIH3oL3rCM/yysGg8SgNafBdnH3XqL3Q9yIGWeLA8BFm5ZsGzM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj/YwQM1wnjGiLpLzW2bjn+bAici/LTaHPDifWCElZ4=;
 b=nXEGPb3ECmTj2OMpkcJJGZfpjpKoju8LPLSyMrJc4JEbBNc0mGvYmyKErZ8R1JErXQF05kXzarb9R6QnvD75tQlo3IUrC9VmUCZZXj5/a6YAnbL5Bo1gj5Wbng22vY8QiTSMJOCV6rM8EuxqOCVpCFlIKvYdIJxWSnpTjxIThkLc4J6Lv/4V8a3YrWEk3DWDtU0Qxf7AsQhkjFCyPC49Kcco1q6FFGmSlAjohhlpuM/r6ZBXgeMatbGtb+85JZRDBs/YR6N23arttTsGl9t2EOCqNKqquy83T/XGtsYEF/1ufMeYvUGJAZH4GUQtg7w+q18KMkXU4eMOa8xV1ToUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vj/YwQM1wnjGiLpLzW2bjn+bAici/LTaHPDifWCElZ4=;
 b=TeS98JP+diE3XokZm8x5vpAapr06xn5tN9GpUuX9494xqI9UNv6O/jpUcfZpIl/guCDdifcHhgg5vpBQePKB9CZSxEDN9gx2ru6fG+VwKeuN/5C4C2es14Z6ujMgm7nOWmGcVi6nY8cpeO8/kqPzRzn+EslXLkOlFMxOsHVos8SuJnsMqjzdzdTlxtvp+dYcGBHRgNi8+P0rL2VXgD7ahf83KDxR41H3Bdcnbim8EiNo33ycfzkzVAwNi9Fpv6v7vqExEi85WTB5c2CHk8wWsHkNMqpQcw1p0ALbunG57fxoRQRYz0O/xUnPa2hMOC9bRrlJw1lRRP6Xs8GbIQgNCA==
Received: from DU7PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::10) by AS8PR10MB7303.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:615::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 07:26:09 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::66) by DU7PR01CA0022.outlook.office365.com
 (2603:10a6:10:50f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 07:26:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 07:26:09 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 09:19:04 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 09:26:08 +0200
Message-ID: <769ad782-b4a9-4089-ad14-a05bc9c41772@foss.st.com>
Date: Wed, 17 Sep 2025 09:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>, Marek Vasut
 <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250915005331.222677-1-marek.vasut@mailbox.org>
 <7355aea1-17af-477d-84b3-9f47ccbb35ee@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7355aea1-17af-477d-84b3-9f47ccbb35ee@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D03:EE_|AS8PR10MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fdbf1f4-8240-450b-b60b-08ddf5bb78e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnFDOFZweUJjVmFkNGg5Q0Y4WjB0dDdNUjJEYithZlhMa3h0RlMvMXA3N2hX?=
 =?utf-8?B?SEZuampPRXFkQ2t1K0JSZDF3RktzRzFqbDN1Si9GZ3FEckMwQkcydE1pVGF1?=
 =?utf-8?B?UllOOW5BNjhXQUdoYlEvY3JtUDc4OThubGtHWHArZzVmQ2Y4TGF0aXF6clNv?=
 =?utf-8?B?ZEd0S1lhc2kzKytUdzF6NUhKSU4xd1ExTGZpbEdMOVFhT29CMnRTTUMvU1hT?=
 =?utf-8?B?QkUwSVNmQlkxT3Ztd1lDbjMxelg4eE5CMmVjRXp0ZllrUGw2SGZQZmphRTE1?=
 =?utf-8?B?VHJBQlo3SWZGbXJtMTFrMG15L05oYVlxRWtwdHkyZFlMYmo4VHdHdkp0S2pP?=
 =?utf-8?B?MVVjbElLN1pNbTJ1Um5SaWduNk5NTW45MnIvREMvc1U2enYrSWxrUzZQZ2VF?=
 =?utf-8?B?ZXh0UHFyM0t2MkdrWW1pY3FtNUZqVTRnSjZicWdHSlVQbENDeitWWkRjUnp4?=
 =?utf-8?B?V012bDNUS280Zm0xTVNsY2hJUFozQWtCMWFybEYxQXdBNnZVV3o0Y3pXNVFJ?=
 =?utf-8?B?Yzc2WkZ3UUtUTFFZWHdFVDRRUldScWpoTlhBNy9xZDNRV200ME1hS09PZWNm?=
 =?utf-8?B?NkhINUpDR1dTYXVSRG5ILzFZbjdqeEZwM1ZwSFFaSEpFZXk0VjFURnozY1Fv?=
 =?utf-8?B?eTdZMzJKK1pCQmdhS3FOMnYya0w0R1dvUEZWRDgzTjBZSGhYV2tvdUpDTENW?=
 =?utf-8?B?QmlPbGluU3BhRk1XcEtGTDRNKy9kSU5jNmxaaktwa0pBaVZKeHROd0MyaFRI?=
 =?utf-8?B?K1lOYnpyUTZuNHIrM01GMzJTQU1NWkx6Nk5KOThTTUZRYW5oaXBHdXhiZTZk?=
 =?utf-8?B?WmVhUDJZd202dFNwK0VSTXhtUU9rRjZBM2UzQWZLaUZvRVc3dWtTRWhrREhT?=
 =?utf-8?B?VWRBcEUxMU1aTHBudmhwWE5udUZ4Z0tBSk1ITHVwL0piR3FkcWNTSHBwN2ZR?=
 =?utf-8?B?Z1BTU2F0RXJWR0pmV3NZMFZHUHR3Z3RsZDVhTDk5a283azFHY1lQc3hnZWJE?=
 =?utf-8?B?eXBUamQySVBGSFVRVktzYUZyOW9UZE95NlZqekVBa3NLN1pHRnZrN05KWlR4?=
 =?utf-8?B?UkdHYzlNRDJTMzNhT0UrcnFHdmJvSkcrMExBSlNjMW5FWHg0amlGdXYwTElt?=
 =?utf-8?B?SWNyRk5NMmNxc2dHT1dhK0FRbEpmbWFOaDdZUUpWZGlJTVNRZUQySmlndFkr?=
 =?utf-8?B?ZUYwK0J5bGFFMHAzbldTQmFXNXY2Yk5qbVg4TkthTlpySTdYR1VnWWhkTDJn?=
 =?utf-8?B?ajR1YVJFbUdMbVQ0ODJ3RXV4T2duNS9uN3pjS0NlOVVhOVcwYlZnNFJ2NWlE?=
 =?utf-8?B?V1IwclFhSjlRVG5xWlJ0ZFBkaVBYa1FoMU42M25EcVNXaFh3bTZGMThzZ1Za?=
 =?utf-8?B?YlhFNEV4WnhyRUxGenFleWdvUUt4ZzRHdk5WRjA3M0RUdUZqeHhEd0paN2tK?=
 =?utf-8?B?SWJyZnc2aytaNXZCU3RpM2JCaGJlTGlMeUZuMXVLVkNZekdmUVliekJ0aUkx?=
 =?utf-8?B?QTVnNFNOZll2NWFvSEtqRGxTTzV2U3YwN0s4YjkyY2llWU94ZTlJOHdkR0ds?=
 =?utf-8?B?UjhJUTlVWitacW9zcHRrdkZ2YmVlVk5iM0NLcS9ESFdDNlJ3WkwyY2tXV3FP?=
 =?utf-8?B?VHh3ajdBdmwrRnljblN2RVc5bVY4S0ZiR2RrQU8vV1lONzR0SFdUL0ZsWGdY?=
 =?utf-8?B?RCtsblczMTNoeTJnOFhMWlBiTXVvQ291N1BVMUxIb3RtaFhQSGpjaWlKcitN?=
 =?utf-8?B?OG5xNWMzQXk0NVVRT0JJR3NyUTg4czg5MlhmV1Z2KzZHNjZSemx0L0JSRmk4?=
 =?utf-8?B?L1h1cW80dzE1S1M1YmkybDIwRmxGeDk4azlUNzdxSHROU2R1MGZWb28wcW5K?=
 =?utf-8?B?VER6WkhPVXpTVUN0c1k1eTNXcW5hRmFDM3ZpL3phWS9sTDJOWFljbFRVZHVO?=
 =?utf-8?B?bllZQzhtY1F4VWhINmJtb1psdDZlSllSKzc2d29ZUzBsOENpR2RCb1g5aURx?=
 =?utf-8?B?a2hPZkdzSC9NV3lTcTZOVzhzemE1T1I3S2VnTGdWWUxGN1oraDNKVmNRZXpJ?=
 =?utf-8?Q?4ke8ft?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:26:09.0993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fdbf1f4-8240-450b-b60b-08ddf5bb78e1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7303
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX20BjGMN7m/dr
 CeDBU9lGktDy+rCtmilT79I9T+e40OgZVqZyQJD0WHT5f9UabzBZNY0Ob4eeE5DV5E0bCL4NLWl
 prqiL1sQAeRZTEBIDrzIdpK1xrJh/TOk71mcjCc/v45ivMaujH2nPAV9UqaohB7/9rMxJRZwsuV
 NNMBauVq0uMAiO4yc22mrVKjhCRNMvXH92y5YlqDdnfYCRQhF+0LLicOD3b7EF7Gbo4TFPPXclg
 7w2QsGPbgsG/UAaMqeCjPvsr6BFAtgP9oQNFzR0rnV/I8dKoOn6G9xATz6b/1wMr3Oe2vIBTInI
 +YWjmvZqI0++oh9zodw2U6qwwxq3OxkO+S3USW++T4DEIbWuRF2c0xB7xFH0BtsrWg0dI87jWkb
 srp7m+uB
X-Authority-Analysis: v=2.4 cv=JYq8rVKV c=1 sm=1 tr=0 ts=68ca6293 cx=c_pps
 a=nL4jJU91y3sJb0QYIFFgig==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=b3CbU_ItAAAA:8
 a=8b9GpE9nAAAA:8 a=gVGD3344AAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8
 a=phlkwaE_AAAA:8 a=UnK4DUoAdcr_t0pkvwoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=xQEvYfgLW3QvObN0DhJi:22 a=uCSXFHLys93vLW5PjgO_:22
 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-ORIG-GUID: w5ueDor912RIMhxIY0fu9py_2msCJHYd
X-Proofpoint-GUID: w5ueDor912RIMhxIY0fu9py_2msCJHYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2] net: dwc_eth_qos: Fix support for
	stm32mp2 platform
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

CgpPbiA5LzE2LzI1IDA4OjUzLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+IE9uIDkvMTUv
MjUgMDI6NTMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IAo+PiBUaGUgbGF5b3V0IG9mIFNZU0NGR19F
VEhuQ1Igb24gU1RNMzJNUDI1eHggaXMgc2xpZ2h0bHkgZGlmZmVyZW50IHlldCBhZ2Fpbi4KPj4g
QWRkIG1pc3Npbmcgc3dpenpsaW5nIHRvIHByb2dyYW0gdGhlIGNvcnJlY3QgcmVnaXN0ZXIgd2l0
aCB0aGUgY29ycmVjdCBjb250ZW50Lgo+Pgo+PiBGaXhlczogMjBhZmNhODllZDUzICgibmV0OiBk
d2NfZXRoX3FvczogYWRkIHN1cHBvcnQgb2Ygc3RtMzJtcDIgcGxhdGZvcm0iKQo+PiBTaWduZWQt
b2ZmLWJ5OiBNYXJlayBWYXN1dDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4KPj4gLS0tCj4+IENj
OiBDaHJpc3RvcGhlIFJvdWxsaWVyPGNocmlzdG9waGUucm91bGxpZXJAZm9zcy5zdC5jb20+Cj4+
IENjOiBKb2UgSGVyc2hiZXJnZXI8am9lLmhlcnNoYmVyZ2VyQG5pLmNvbT4KPj4gQ2M6IFBhdHJp
Y2UgQ2hvdGFyZDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IENjOiBQYXRyaWNrIERl
bGF1bmF5PHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IENjOiBSYW1vbiBGcmllZDxy
ZnJpZWQuZGV2QGdtYWlsLmNvbT4KPj4gQ2M6IFRvbSBSaW5pPHRyaW5pQGtvbnN1bGtvLmNvbT4K
Pj4gQ2M6dS1ib290QGxpc3RzLmRlbnguZGUKPj4gQ2M6dWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQo+PiAtLS0KPj4gVjI6IEdhdGUgb2ZmIFNFTE1JSSBiaXQgb24gYm90
aCBNUDEzIGFuZCBNUDIKPj4gLS0tCj4+IMKgIGRyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0bTMy
LmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9kd2NfZXRoX3Fvc19zdG0zMi5jIGIvZHJpdmVycy9uZXQvZHdjX2V0aF9x
b3Nfc3RtMzIuYwo+PiBpbmRleCA3YTI4ZjJhM2U4My4uNTdhYzUyOGViZjUgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvbmV0L2R3Y19ldGhfcW9zX3N0bTMyLmMKPj4gKysrIGIvZHJpdmVycy9uZXQv
ZHdjX2V0aF9xb3Nfc3RtMzIuYwo+PiBAQCAtMTM3LDEzICsxMzcsMTUgQEAgc3RhdGljIGludCBl
cW9zX3Byb2JlX3N5c2NmZ19zdG0zMihzdHJ1Y3QgdWRldmljZSAqZGV2LAo+PiDCoMKgwqDCoMKg
IGNvbnN0IGJvb2wgZXRoX3JlZl9jbGtfc2VsID0gZGV2X3JlYWRfYm9vbChkZXYsICJzdCxldGgt
cmVmLWNsay1zZWwiKTsKPj4gwqDCoMKgwqDCoCAvKiBTb0MgaXMgU1RNMzJNUDEzeHggd2l0aCB0
d28gZXRoZXJuZXQgTUFDcyAqLwo+PiDCoMKgwqDCoMKgIGNvbnN0IGJvb2wgaXNfbXAxMyA9IGRl
dmljZV9pc19jb21wYXRpYmxlKGRldiwgInN0LHN0bTMybXAxMy1kd21hYyIpOwo+PiArwqDCoMKg
IC8qIFNvQyBpcyBTVE0zMk1QMjV4eCB3aXRoIHR3byBldGhlcm5ldCBNQUNzICovCj4+ICvCoMKg
wqAgY29uc3QgYm9vbCBpc19tcDIgPSBkZXZpY2VfaXNfY29tcGF0aWJsZShkZXYsICJzdCxzdG0z
Mm1wMjUtZHdtYWMiKTsKPj4gwqDCoMKgwqDCoCAvKiBHaWdhYml0IEV0aGVybmV0IDEyNU1IeiBj
bG9jayBzZWxlY3Rpb24uICovCj4+IMKgwqDCoMKgwqAgY29uc3QgYm9vbCBldGhfY2xrX3NlbCA9
IGRldl9yZWFkX2Jvb2woZGV2LCAic3QsZXRoLWNsay1zZWwiKTsKPj4gwqDCoMKgwqDCoCAvKiBF
dGhlcm5ldCBjbG9jayBzb3VyY2UgaXMgUkNDLiAqLwo+PiDCoMKgwqDCoMKgIGNvbnN0IGJvb2wg
ZXh0X3BoeWNsayA9IGRldl9yZWFkX2Jvb2woZGV2LCAic3QsZXh0LXBoeWNsayIpOwo+PiDCoMKg
wqDCoMKgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPj4gwqDCoMKgwqDCoCB1MzIgcmVnbWFwX21h
c2s7Cj4+IC3CoMKgwqAgdTMyIHZhbHVlOwo+PiArwqDCoMKgIHUzMiByZWcsIHZhbHVlOwo+PiDC
oCDCoMKgwqDCoMKgIHJlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoZGV2
LCAic3Qsc3lzY29uIik7Cj4+IMKgwqDCoMKgwqAgaWYgKElTX0VSUihyZWdtYXApKQo+PiBAQCAt
MTYzLDcgKzE2NSw3IEBAIHN0YXRpYyBpbnQgZXFvc19wcm9iZV9zeXNjZmdfc3RtMzIoc3RydWN0
IHVkZXZpY2UgKmRldiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBhY3RzIGFzIGEgc2VsZWN0
b3IgYmV0d2VlbiAwOkdNSUkgYW5kIDE6TUlJLiBBcyBTVE0zMk1QMTN4eAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIHN1cHBvcnRzIG9ubHkgTUlJLCBFVEhfU0VMTUlJIGlzIG5vdCBwcmVzZW50
Lgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFpc19t
cDEzKcKgwqDCoCAvKiBTZWxlY3QgTUlJIG1vZGUgb24gU1RNMzJNUDE1eHggKi8KPj4gK8KgwqDC
oMKgwqDCoMKgIGlmICghaXNfbXAxMyAmJiAhaXNfbXAyKSAvKiBTZWxlY3QgTUlJIG1vZGUgb24g
U1RNMzJNUDE1eHggKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsdWUgfD0gU1lT
Q0ZHX1BNQ1NFVFJfRVRIX1NFTE1JSTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiDC
oMKgwqDCoMKgIGNhc2UgUEhZX0lOVEVSRkFDRV9NT0RFX0dNSUk6wqDCoMKgIC8qIFNUTTMyTVAx
NXh4IG9ubHkgKi8KPj4gQEAgLTIxMywxNSArMjE1LDM5IEBAIHN0YXRpYyBpbnQgZXFvc19wcm9i
ZV9zeXNjZmdfc3RtMzIoc3RydWN0IHVkZXZpY2UgKmRldiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRUlOVkFMOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgLcKgwqDCoCAvKiBTaGlmdCB2
YWx1ZSBhdCBjb3JyZWN0IGV0aGVybmV0IE1BQyBvZmZzZXQgaW4gU1lTQ0ZHX1BNQ1NFVFIgKi8K
Pj4gLcKgwqDCoCB2YWx1ZSA8PD0gZmZzKHJlZ21hcF9tYXNrKSAtIGZmcyhTWVNDRkdfUE1DU0VU
Ul9FVEgxX01BU0spOwo+PiArwqDCoMKgIGlmIChpc19tcDIpIHsKPj4gK8KgwqDCoMKgwqDCoMKg
IC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogU1RNMzJNUDI1eHggU1lTQ0ZHIEV0aGVybmV0TiBj
b250cm9sIHJlZ2lzdGVyCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogaGFzIEVUSG5fQ0xLX1NFTCBh
bmQgRVRIbl9SRUZfQ0xLX1NFTCBiaXRzCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogc3dhcHBlZCwg
c3dpenpsZSB0aGVtIGJhY2sgaW4gcGxhY2UuIEJpdGZpZWxkCj4+ICvCoMKgwqDCoMKgwqDCoMKg
ICogRVRIbl9TRUwgaXMgc2hpZnRlZCBieSAxIHJpZ2h0LCBmaXggdGhpcyB1cC4KPj4gK8KgwqDC
oMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIHZhbHVlID0gKCh2YWx1ZSAmIFNZU0NG
R19QTUNTRVRSX0VUSF9TRUxfTUFTSykgPj4gMSkgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAoKHZhbHVlICYgU1lTQ0ZHX1BNQ1NFVFJfRVRIX0NMS19TRUwpIDw8IDEpIHwKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKCh2YWx1ZSAmIFNZU0NGR19QTUNTRVRSX0VUSF9SRUZfQ0xLX1NF
TCkgPj4gMSk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKg
ICogU1RNMzJNUDI1eHggU1lTQ0ZHIEV0aGVybmV0TiBjb250cm9sIHJlZ2lzdGVyCj4+ICvCoMKg
wqDCoMKgwqDCoMKgICogYml0cyBhbHdheXMgc3RhcnQgYXQgYml0IHNoaWZ0IDAgYW5kIHRoZXJl
IGlzCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogb25lIHJlZ2lzdGVyIGZvciBlYWNoIE1BQywgc2hp
ZnQgdGhlIHJlZ2lzdGVyCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogY29udGVudCBpbiBwbGFjZS4K
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIHZhbHVlID4+PSBmZnMo
U1lTQ0ZHX1BNQ1NFVFJfRVRIMV9NQVNLKSAtIDE7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHJl
ZyA9IGRldl9yZWFkX3UzMl9pbmRleF9kZWZhdWx0KGRldiwgInN0LHN5c2NvbiIsIDEsIDApOwo+
PiDCoCAtwqDCoMKgIC8qIFVwZGF0ZSBQTUNDTFJSIChjbGVhciByZWdpc3RlcikgKi8KPj4gLcKg
wqDCoCByZWdtYXBfd3JpdGUocmVnbWFwLCBpc19tcDEzID8KPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFNZU0NGR19QTUNDTFJSX01QMTMgOiBTWVNDRkdfUE1DQ0xSUl9NUDE1
LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnbWFwX21hc2spOwo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlZ21hcF93cml0ZShyZWdtYXAsIHJlZywgdmFsdWUpOwo+
PiArwqDCoMKgIH0gZWxzZSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBTaGlmdCB2YWx1ZSBhdCBj
b3JyZWN0IGV0aGVybmV0IE1BQyBvZmZzZXQgaW4gU1lTQ0ZHX1BNQ1NFVFIgKi8KPj4gK8KgwqDC
oMKgwqDCoMKgIHZhbHVlIDw8PSBmZnMocmVnbWFwX21hc2spIC0gZmZzKFNZU0NGR19QTUNTRVRS
X0VUSDFfTUFTSyk7Cj4+IMKgIC3CoMKgwqAgcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhyZWdt
YXAsIFNZU0NGR19QTUNTRVRSLCByZWdtYXBfbWFzaywgdmFsdWUpOwo+PiArwqDCoMKgwqDCoMKg
wqAgLyogVXBkYXRlIFBNQ0NMUlIgKGNsZWFyIHJlZ2lzdGVyKSAqLwo+PiArwqDCoMKgwqDCoMKg
wqAgcmVnbWFwX3dyaXRlKHJlZ21hcCwgaXNfbXAxMyA/Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNZU0NGR19QTUNDTFJSX01QMTMgOiBTWVNDRkdfUE1DQ0xS
Ul9NUDE1LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWdt
YXBfbWFzayk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZWdtYXBfdXBkYXRlX2Jp
dHMocmVnbWFwLCBTWVNDRkdfUE1DU0VUUiwgcmVnbWFwX21hc2ssIHZhbHVlKTsKPj4gK8KgwqDC
oCB9Cj4+IMKgIH0KPj4gwqAgwqAgc3RhdGljIGludCBlcW9zX3Byb2JlX3Jlc291cmNlc19zdG0z
MihzdHJ1Y3QgdWRldmljZSAqZGV2KQo+IAo+IFJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIFJPVUxM
SUVSPGNocmlzdG9waGUucm91bGxpZXJAZm9zcy5zdC5jb20+Cj4gCkFwcGxpZWQgdG8gdS1ib290
LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
