Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B34BC59515
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Nov 2025 19:01:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4673C628D5;
	Thu, 13 Nov 2025 18:01:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80E34C628B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 18:01:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADHnKbe227807; Thu, 13 Nov 2025 19:01:33 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acqa7erk4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 13 Nov 2025 19:01:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGsrnLFsFwT6ak2RbzCsd+fWHvF6gY+AhbcHVTK1MwYHTuCFr31y2XeHMIyh3RKVNyJvv+d7O66uqFAwn7nCVLPSI0gHfwPyY76YtbXnoO968DTqhMnHY3lnk1wDqzCJbLcQ6Oeh74UpBRNsZL85ppgB5VZp0EEEdYT8BtKEQow0uQ1Cn72XrJiTGEykyW1i1A6AXj2XYPQQDNB8IYNPkpDX7q87uTkh6R5LBBq9p56FvYMcbH9wo8VaK20Szk6g0ZYwjrrckd9J2Tm5ldb/fAW8gRyu4otchsyi2iamZ3iVPD1WOoFevfbqhLoXqlioTmXSKUQMPMpp4myWoDLO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZTk7z9NGjLjUJnJ0810a5NVucM1Qbg19Oqgzb3I3b4=;
 b=aGWa5QU0ssSR8BQYF3lDgcwfZJcUiEKKm9ckvDdcVBV0xrlMFs1FQ04CGFkLpf1jBehBsbwcph5ITsUretdP9SBEsK5AIAgxHYF5oqte3qKP8gCz9upNawb2gniwG7VYjk4iYJfU3PvnqdG7COHunBl7w7KjM4ecy6TsRO1pczBxK+6Vxx2lMSC5SzGJ93BVkjp8Qj8e1wISu6xcHrcE5BIR/8f3DFKWbvK/iVqnb1nZWQ5+Q6wbz0W+PpYr2VBsx3DBP3mw+7gDhsXtBUJ3jBoEgAm9t2VoTWNUXyS6hCgExo+GFChuIrnwu86I+/ZeJ8lhH08HrzO5yskdb1dRfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 164.130.1.60) smtp.rcpttodomain=lists.denx.de
 smtp.mailfrom=foss.st.com; 
 dmarc=temperror action=none header.from=foss.st.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZTk7z9NGjLjUJnJ0810a5NVucM1Qbg19Oqgzb3I3b4=;
 b=fU8FXb9h8VNNa8WR3DxAtK42ipDQfZFQ4Ca2Pz6kEQQ+FtLzBjHjoZbdJ/R5S94o+b1euDniu7u2F2KIkz71PXDy9Fw+PCuWfBMzWiXfZerBaeb5AA09BQ3fgx2RdeePk0vNZ9Y/fAPLmIkhhBrr3LLhq7iTOoky1TDMZBzZhIshBOBUcso9ruL3FMVnEiKXfqFGTSxVew5B9ipgxUem+KiH8UfzqFolxIztmMes0m0wzDsJTWiP6Bvn8yHJLun0tPm5ekgae9pBAhTXMacklCEdXCd9w9kQ+EMv3MSZ5Yttu+ujL+idpxz5zf8OE8Vw2zAYTwZXwPQkLBkVRViAug==
Received: from AM4PR0302CA0017.eurprd03.prod.outlook.com (2603:10a6:205:2::30)
 by VI0PR10MB8814.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 18:01:30 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::58) by AM4PR0302CA0017.outlook.office365.com
 (2603:10a6:205:2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 18:01:28 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=foss.st.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of foss.st.com: DNS Timeout)
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 18:01:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 19:01:38 +0100
Received: from [10.48.87.108] (10.48.87.108) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 19:01:26 +0100
Message-ID: <0c65cafc-ebc5-49fc-be22-a4033ceeb208@foss.st.com>
Date: Thu, 13 Nov 2025 19:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20251009152610.300154-1-patrice.chotard@foss.st.com>
 <20251009152610.300154-4-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20251009152610.300154-4-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|VI0PR10MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: b86bda28-0899-49ae-8f36-08de22deab8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTVCV2ZTdFQ2QzhVVGMrN2Rla1ZncHBYTVVVMWpsZU51RFZQTkZ3c0w3ZWFF?=
 =?utf-8?B?Y3hsaGUvalBQK1hjNVFLVFMxOE8yZXNLZ0JIUXR6SVlQQnc3Y1BFOUxwU015?=
 =?utf-8?B?cTVwbE85ZlgyMUFtZjFxSmVHNlFqRG9DTXZiUGdTMkt5ZHIrN0x3dXMyeVFU?=
 =?utf-8?B?Z0ErcEh4NzhzZ2E1S3liSXVQazkybzlZZWp4RjAvUE0rbVBISzZidVRKcnor?=
 =?utf-8?B?eUJ3SG1MTXkvc2h0YkxxeUlkODNyMVA3bWFvZXcxZG9JQnhzSExCdkZKOGxr?=
 =?utf-8?B?UDFkVktaUS9QNUZnM3V5SVVtRUlVMFg1ZWJ6b1BaMzZENFY5Y09DODNLQkQ5?=
 =?utf-8?B?bEkvQ3o4UFNPUU9US2UvbnU1dUhtd0JRUjFoM1NaeGhiK3R5dUcwbytMb1RN?=
 =?utf-8?B?SnFwRGtOTTZpWXZVQkFkb2xmR2Y1VXZlemVEZkNSeEV4Njg3Qm5ZaHViL1Va?=
 =?utf-8?B?eWRyN2FqM2VSNCtFcWZBbHZHc1drWG40ekNCZXgwNitCU1NTcmJxb2w3R2VF?=
 =?utf-8?B?SE9kalNNcTZ5T1JQNWpQNmhGMVdOUHNwYzRhdkpGSXVMOGRBTUVSbUs0Uysw?=
 =?utf-8?B?VC9NQmpxbkgybjZjWXdTbnlUeWRiT0JWN0Zta1lBUVFhUmJQSkI0STRHZzIw?=
 =?utf-8?B?bVAydUszeVM3QXdUZ29NWFdxQSt0M0E5eVNVcU5YOWRxS1FocjAxR3VYQ2h3?=
 =?utf-8?B?OUJTMEhML0R1MEl5YXphMkZoLzZXWm9HS3B6SUp4UW8yNVFwdmwyU3pCU3dW?=
 =?utf-8?B?WjF6QlBhN0N6QTZ2djYvSjlPdVZ1am5jRGg5Z0ROWUdxOURrVlk1YWVERkFE?=
 =?utf-8?B?cEd0Z1dLRmIvdjIwZnpUWHBqZFQvREc3cEpDL3M3WXMrZ0lwc1k5Zm9sdXlJ?=
 =?utf-8?B?UDhLYmJuM1hQZ0pZUXJ1dXBIZWdXNmp3QzdxcEx0ZDh2Vm5id2hXMHRoMkpK?=
 =?utf-8?B?MmNmR0poWnpkWXdiek02RXNuK1puekx5TmVSTEVQakNYL0V2VnpBR2NuVmVF?=
 =?utf-8?B?YkxLUnRMV1VsTDgvNGJpU1FWeUF2eTlMUitobGhla2ZmWEU2UjZBcVB2RXpm?=
 =?utf-8?B?WnZvK3JLNVZiWkpUMG5PTUQ3NUpiUCt2b0d3M29GL2hPaDM3dDJiUEt2RXc2?=
 =?utf-8?B?WTV1eG9nb1Y5aGFCaHpFMnRyN1NJQ3VjQytsZG9XUnF2L0x2UjZaMnNrcTV2?=
 =?utf-8?B?MU1iVWtMTWlqSDRsL25LZGdsUXBvNVZidUNLeTU0bzdLZ1N3TllGWW1ZMzh1?=
 =?utf-8?B?Q2ZIVTIwZkNLb0NvUG1abldFL1NIZnlmQTN5SmJYNXlYNFRzclFXY2xDdjY1?=
 =?utf-8?B?UmYzRnRnOUpIMFRpMG9GbzFOam82YjdDR1J6eXVvdFZ6RW1mVnROeUo3ZGda?=
 =?utf-8?B?Y1ZYanZlTHBFK25kRm9FaGQ5TzkyenNBT0hCNUE5U2hyNHFNTm1KY2MwazJC?=
 =?utf-8?B?NmFlRzVkUXIvL3RubTN0cTBSVlo0N21UcXBxcWwrTi9rV1I5REZQTVNZbWpi?=
 =?utf-8?B?ajNZaHFhczhYZEhHekhCR1g1KzlqMkNxelgzdGZXRUU1RGJ0Q2NZb2ZSWjNr?=
 =?utf-8?B?cDYzajdRenFFc2J2QXFoZ0xOVVYyS2p1Zjk4K25nb0I0enJCVFlNSlhqSzNv?=
 =?utf-8?B?OWthWnM1SDM2ZDJwQTJpUUxwRjF5N3NMS1pNczAvT3hGVlQyYmJJZzJKQTdr?=
 =?utf-8?B?c05QUWdNd0NKL0M3RWRFdlg1OHlvWnlWRjVwRjVGOE0zaVo3SnFqWngxc3RQ?=
 =?utf-8?B?K2ZZdklnYlh0YktZMk1BWno3eWE3RmJaS2EwaVEwRXVZTTh0TE9jOFFyNlBz?=
 =?utf-8?B?VGZOaDV2bzQrNkY1SWlGSmFjRkQ0UWZCSXQ4Y3hLYlZwc0E4V29qcmNzV2Ru?=
 =?utf-8?B?VjdLMmZMUnMyY3BoY0UwTDdtSHVrU3hHOE15RlVVSFZaZytrUURQSksxMTg5?=
 =?utf-8?B?QjFYRVVCclU5TmkvZ3FXdGIxWWJIdTUxOHFOZlFFNkFwOHFzQk82L3hQcDQr?=
 =?utf-8?B?cWovNG01UzlEbWxvVXhxcUN4dWJHbDNTUWZBbzBHZEZBSkhNbDBxSjFuUTlh?=
 =?utf-8?B?cWNLSlJIUUwrQzByUXdNTDVCVGU0MCtLRENOR3lLY05iSElyelZZYXIrZ0hy?=
 =?utf-8?Q?QJR8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:01:28.8531 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b86bda28-0899-49ae-8f36-08de22deab8b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8814
X-Proofpoint-GUID: lPjqZOQEN0Jd-aP3-vQQ-3K0nZzEpGl_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE0MCBTYWx0ZWRfX0saLFpbN2V2I
 6QoiA7kc3e14JFTdi2lluvUQphbwp3nKSpIAv1CugJOJRI3gTv9EEQP87DXZA9p9CDj1jXqk9c/
 vzubxgY7IG2cY8dlDxiVOKtvj61vBko+DsrxpeKmaA33fks/9ZeFxDxEHo2cf6hr9RjVKFyGEpw
 E6fQi3nSpfQzL1MvYLQd5JQKLaR3vNy28TTBRM3sjKkXveFy0BdNfgVWdkDRx5gEyVPiIqvB9W3
 T9wy6TJiMk5ELixSWaJbXsPjjs8ORrKEPykkyTFjiIwaqMmuG+oOiaxQ0yE7ZYCtRtn9MW0qkQW
 pS+h0kJ8/88GhGzzArtsvhzd6HS492vrnfDWGg4JDy2AiscYzFcOl6/N8txhY2Ygm/zuWj8ywXd
 ORNZLKwfxpEd1X0/dsKUqwGdw2h45w==
X-Proofpoint-ORIG-GUID: lPjqZOQEN0Jd-aP3-vQQ-3K0nZzEpGl_
X-Authority-Analysis: v=2.4 cv=VoAuwu2n c=1 sm=1 tr=0 ts=69161cfd cx=c_pps
 a=1vQRXpsGNmEGKh2qpy4sKg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=VyCTW_2QcLNSsm-El1EA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_03,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130140
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 3/3] ARM: dts: Add st,
 adc_usb_pd property for stm32mp135-dk-u-boot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 10/9/25 17:26, Patrice Chotard wrote:
> Add st,adc_usb_pd property in /config node for stm32mp135-dk-u-boot.
> This needed to check board USB power delivery.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
>   arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
> index f004e9840a2..326a8f8736e 100644
> --- a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
> @@ -14,6 +14,7 @@
>   		u-boot,boot-led = "led-blue";
>   		u-boot,error-led = "led-red";
>   		u-boot,mmc-env-partition = "u-boot-env";
> +		st,adc_usb_pd = <&adc1 6>, <&adc1 12>;
>   	};
>   
>   	gpio-keys {


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
