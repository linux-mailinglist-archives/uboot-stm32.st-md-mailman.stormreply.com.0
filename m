Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64BBAD8F9
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Sep 2025 17:09:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F348C3F951;
	Tue, 30 Sep 2025 15:09:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B23D9C3F94D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 15:09:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UES0bH031162;
 Tue, 30 Sep 2025 17:09:30 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49e5bf59kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Sep 2025 17:09:30 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ozs4X2x0BEaQxa/spa+7UHIQfR7jFOSyHT9ss2+TKt2YwBWYZFvdKqkgai6L3cLODFVU+RRc+uUK56eexqdSPicZ1rvx1M7kAjU91w89Y9qV3VA+P/CmznF1CvxMZ7+9+nO3dGbsXgO3WjmXwWMPujbv2va0Z9tfxdIBde5VjJQEC4svV4vUAgFgauq+RwgXEksNT8NDa6FCMSSmEYKSD/nNkBdi8zSF2INTmW81/vqN+u/iVt3GKfQfNVrhy6NCGtYETo5u/M+64fYvDVpQKFZyk4x00Lurso44KNFPL9pBg/RnJrgPQNBVuU7gOtpo8rBTVnDshN4AG/G0Qp0iTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNjFVABx/uz2aZC9Kq5cs81/GdROTwK/FmuhxBXXEEA=;
 b=V/boiwHR8IrSTNyy6yxXWP+CSdyvaviR2/fvD3lVcvWVHnLc47VRsJ1xUK4YaS9CJ4+lzJR0IX3vsFk10mGlE+zW2xONVQExr0TEcJ5jj7DSQBGTF6V9ZRFokMneHRlAmsT7P0CdPpLv8daagEEjscbCzVp609uEinuzX4/oTrYhSKBV1X5V/Of39agJ4hwlGlaOQ0DobLDqbFOi3KH4d1+0xwz/J6nVptirDHDkCiGQ/d0lvsduZ5OCe8QT1PLF0Fy3ODrMJ5H1R/j4jhTk8no3I7roCUcPHPwuzCzYhx5HJ9Fpu1wrAxmqJx82FKCbckupA+/9FE1ovo9/UOKPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNjFVABx/uz2aZC9Kq5cs81/GdROTwK/FmuhxBXXEEA=;
 b=hNbuR3S4Rd1M/sApBXw3XskBbv5iktIDPUTx2gOMtii8oWRh4qUbVEXPDAscyC7t3Nwd3zAoOoBpIyuczGQM0XMKCWhaNQC0k5UQ3LvvYlcaIA5JUjT1nInxM0Zg0fdBuTxYpXIXniHRnmtZYCv3U30hJ1lH/9C7K7aEnLYJbFtPH/J0TvJa357jjy2/Dar/EIyciQH7O9AkA42b6c7ApcYz7iI5sK7abFVRMccPRSn0CoAK2evwxEqwiyTQdHmC1wrT1xcCfFcv48KHNvvnw8yW1T7EhPbVvteAWrjLjWvNmQ4s7PnF2GwZ283K/1HPdeq7ef/ts9zmV3mlEZUc5w==
Received: from DU7P190CA0013.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::35)
 by DB3PR10MB6811.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:437::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 15:09:28 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::f1) by DU7P190CA0013.outlook.office365.com
 (2603:10a6:10:550::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 15:09:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 15:09:27 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 30 Sep
 2025 17:07:10 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 30 Sep
 2025 17:09:26 +0200
Message-ID: <0b7c0f03-37ec-4aec-80e7-e26de4091560@foss.st.com>
Date: Tue, 30 Sep 2025 17:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
 <55d0805b-dcb2-4277-a4da-f4c26b48a2dd@foss.st.com>
 <20250929170912.3bee3f9d@kmaincent-XPS-13-7390>
 <fd32f45e-a3c9-4170-8886-5a31dda0e4c9@foss.st.com>
 <20250930143732.GU6093@bill-the-cat>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250930143732.GU6093@bill-the-cat>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|DB3PR10MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 15252145-48c0-4a2b-ff72-08de00335993
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3h5ZFpXK0ttcUNiTVdSNS9BVmVES0xNNGdtREV1dHVkQWJBdUVJbENKbkRh?=
 =?utf-8?B?NkpNQVlUOUthODlieWhqOFFDVENRMGJLdG1ENldtYTVzdzFlKzFNQ2JrKzZv?=
 =?utf-8?B?dytlc2xRQ09pMDMvd2tra3Nsb2RCOHNBZW1ITklxbnVuVWxORE9BVFJxTi9k?=
 =?utf-8?B?emlvNGpKdmlmb052eFFXS0JGd2FQamo1Q3NkczdxdC9ESXpFaW16YllJQ2N4?=
 =?utf-8?B?MERtSnV4Nk9JTHd3QjIxWmoyTjNTdlBtM1JubkNmdllVVXVIcWR0emlOMS9V?=
 =?utf-8?B?WEhnTFAwZHNncW1TTTdMMnRXaEFtN3FwYkt3MlMvM1YwdDhSQytzTGZxdkc4?=
 =?utf-8?B?MERwN2Z1SHNaZUJwTldXbUV5Vnh3LzZwcldRRWxnWnRtSmRHVGtDUEtnSWNs?=
 =?utf-8?B?ZTU4Ly81TTJqVUVBWVVJMXdFQUMya1R0ZURqbGlyZUdmQWFjSFpMOXAybGQr?=
 =?utf-8?B?TVhXbjFzK1pGYUpYaXFyVkgzRHF6NW80KzZEYWZPc2VmYytTTS9POWt6bXRW?=
 =?utf-8?B?UzF0RllIWUdSM0dCNWQwWXVhbzNoTXRqbVptNUVxaTArRis1WGFYK3ZuZFl4?=
 =?utf-8?B?MDI1WFcvV1UveHZwZ3pRVlRhQXVVeVFlMFptTTlwRzJ4Y25yUTFEVEd6M2di?=
 =?utf-8?B?S0plZ3VZbVlwMy9MVUR0QzZpY0hEZzR4N3NmUE5kSFVrbW54QVQ1YjFNb3J3?=
 =?utf-8?B?aFBhbVRPenRrV0Y5Sk9LR20vbUFHODZvQ0xmZHpUbUtUdmlZRXRXcTQ4bCtK?=
 =?utf-8?B?dmZaR2piWlUxUHJYeTFhb1hkOXh5alo5TkNqR0FuQ0JqeDBPY2pvOUk1MlRr?=
 =?utf-8?B?Z2JESEx2VFRQanNEalFlMVpqRmtNSEg3UEYrV1Z0Q0Rod242alVPNGxvNjdq?=
 =?utf-8?B?MzJlcCtPM0wycVVsSjZQQklYM2RyakYzSjNuT0N5dVljNWRIdDRMaGdLZXVu?=
 =?utf-8?B?bGYzZjF2Mi9CSkFkMVFXSVpOZFdYaHR6cGhlR0dyK0NDaTI4WldzMHZTQzZz?=
 =?utf-8?B?ZE9oUld6UU9Ta2U2dzhUSGFMZWlySFducHowUy9XR2V5VStsSjFhNktKNzQ0?=
 =?utf-8?B?U2JoTnplNW1qTmlrdllTMzRicnFrTEw1b3lMbHdZbm1odWwrMmVzTG9kSjdr?=
 =?utf-8?B?dEU0NkFhRmc1cXdUTkdMSDFpTXhUa2ZrbDRwNEQvNFdJL0hKN3haY0pIY3VG?=
 =?utf-8?B?dFZ5WWh0NTB2dnhwVEtGaFpPcGVMeldFM21BYkFWNGl5aVZhc0I0UmNyWnlC?=
 =?utf-8?B?K3BiZE1INkhHYjgyaXpub01yVFdyWlNLb2dpNDFwSHBHS1lDbkNCWktVRWZ5?=
 =?utf-8?B?UDd5UDNVTGl4a3lneUZtbFY4a3ZjTlF5MnhqN2p2Sjk0LzdVTGRQQ0xFc3Bs?=
 =?utf-8?B?YW5oRG82ek81Z01ibXc3ZmkrY1pJWVF1WGgxU09QcnVkcG1zVGt1YmhBeFFE?=
 =?utf-8?B?dzE5czNVSFJ2enczckh0NUZaSHc0TDVGOXpiMzRIa0pjK3FycG1YUGFlZGtx?=
 =?utf-8?B?QnJCbXV2KzVVVFBRTEMyNEJwQloyQk1JejRobUdTTEVlbFZjb01ObEdQR3dJ?=
 =?utf-8?B?R2xkV3N6QkpLNDczTFdEaVFIZE1URHFqYy9veStiaGpZZTFGQzZpSG5OTUtP?=
 =?utf-8?B?aW0vRGM2Q2pvOXNhUGFpZ2prKytJUlJnTnBhSHZiYVd6M2c2UXdJMk9nWXJ6?=
 =?utf-8?B?UlVXSlBRMEU2UWEvV2hydWt2VVJtZ0d6ZFNSOE1vZTAzL2l4RmwrUEYwYks1?=
 =?utf-8?B?M25ud2dQMnJrWWRXOVBqU3k4RnVNUkloWElvVTJyT21CeTJsTG91a0o1Um9V?=
 =?utf-8?B?VTRpOUkxQ25qbEJIa3h5TURuZ3czRDl0TzNSRGZBVXR1TTdUSVV1SEtxOHp3?=
 =?utf-8?B?b1EyMFlNUXg4amVnRlVYdUhMVFpwdmJYVFFPdktxaGlRTU9aUDhiNms4c2U0?=
 =?utf-8?B?ZlRTUWtRajE5VnJtZ3llSWNkZkZtQ3BFOERPa1FnTUZEak8vY3VoemZrdHlF?=
 =?utf-8?B?T3MrRDhDanluQmdCeDBoaHVtZWpoaUI3RXNzSE9xM0YyM0wyMVgwbHNlZ1Iz?=
 =?utf-8?B?M3h0c2lWOXdBQXVZSlFWR21jL0ZvWDFxWkpMWEs2QllPcGo4MHFCZzVPRWNo?=
 =?utf-8?Q?X5LY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:09:27.8288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15252145-48c0-4a2b-ff72-08de00335993
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6811
X-Authority-Analysis: v=2.4 cv=L80QguT8 c=1 sm=1 tr=0 ts=68dbf2aa cx=c_pps
 a=xsPRXSxgE/lgwrq+xqasSg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=P-IC7800AAAA:8 a=uNisml2lv1MGpa1gV_QA:9 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: xKHD4U7IVnRIpAVw19SyT-fPs0Mu92dB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXx18dNMB3mKYn
 nWizctTLQBYq2/830gYEj90T0r5DlkKbS/Lnrj/dstUgbEjtu965VR6wrMsFS0l3HzBAHqpadbn
 volqf32DMVj2GQA4TIXeCZExuJb7aoTDduZe5jWam1DpaRURdBUU7exEXDtjrXqNFpAqZcCsVi9
 KfyVCH1goiv56+JoWFyzdOZKCaES+NNx3JVXKWWGCTtEnxMcLBuplUH7UdaMj7qduaqYm1FT1zo
 ABfLwnKokddNor8puknZASapWbUbJVN6gpDa4nRH9X+pNEXcD4L79U4RZQMVoHuFRVSRvKHn9zg
 7Mzj2OOUXbISiHFzYqM/EmF+7TNo1+NV5C2VGMjsg7jV84WvArnB4SmnEHca8pzRPueqZ081Q5t
 ndD5KTNKSjHg0qRpEbycWIENehLXTg==
X-Proofpoint-GUID: xKHD4U7IVnRIpAVw19SyT-fPs0Mu92dB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2509150000 definitions=main-2509270001
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Bastien
 Curutchet <bastien.curutchet@bootlin.com>, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, thomas.petazzoni@bootlin.com,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] Revert "board: st: stm32mp1: Clean
	env_get_location()"
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



On 9/30/25 16:37, Tom Rini wrote:
> On Tue, Sep 30, 2025 at 09:45:08AM +0200, Patrice CHOTARD wrote:
>>
>>
>> On 9/29/25 17:09, Kory Maincent wrote:
>>> On Thu, 18 Sep 2025 16:16:35 +0200
>>> Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
>>>
>>>> On 9/17/25 16:17, Kory Maincent wrote:
>>>>> This reverts commit d37641c61ba212241c38e3fd22f0335fc0bebc96.
>>>>>
>>>>> Restore support for environment storage in EXT4 filesystem on eMMC boot.
>>>>> The previous cleanup incorrectly removed this fallback option which is
>>>>> needed for boards that store their environment in an EXT4 partition.
>>>>>
>>>>> This configuration is OS-specific rather than board-dependent and should
>>>>> remain as it is configurable via menuconfig. Even if it is not described
>>>>> in ST defconfigs people may have enabled it in their defconfig.
>>>>>
>>>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
>>>
>>>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>>
>>> Hello,
>>>
>>> Any news from the maintainers? Is there a reason for not being merge?
>>>
>>> Regards,
>>
>> Hi Kory
>>
>> I expect to send a pull request before end of this week for master branch including your patch.
> 
> Since the release is Monday, I'd really prefer sooner this week to later
> this week if possible, thanks!
> 
Hi Tom

I am preparing the PR, it will be send today.

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
