Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKJiLrLegWkXLgMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:40:34 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99AD8852
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 12:40:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F244C87EC8;
	Tue,  3 Feb 2026 11:40:34 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B32DC87EC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XO8syiJtWNjxEws0xsnzRPGlEK8nSf2TaVwRaKqWJC3N+qaneUJiKuOy+5qqjW2jtCoRlo0vFL2wYReb0x5k1zQ7JWOXy1Bs60k2BN9cTI/hQFbtvB7z8uJWutVVVy1TuiuaVPSd+gYj/0kAdSbb8Ug+ynOjgzaKX2Ujs8nEzo8bV6Z8cXjUqp034UkOoAwaoNZzupMVN9BzYWE+nn4yopDs9zcZlW1ZsYcG/HNG+lGld+QJgUWPkPoP4l4tQ7HoUIv2T/ZcYTWZ1ZDjscIf262GNrUofa9h657Qw5hrY8EDlN5JP/FP1g35DvfAmHx4l4cWajjdjQWi7XaJPxV5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mARH3HXQvn9H2K9C75Ooeo+YZ9BTcmxpCVUThYGK/EU=;
 b=qkEqiTGnhe0P7Ag3GaJVDkgXDk0iMmVMCGY341KINQ6kC0Oa6PfANpunIQWQTFOwGzlOtBuMWkXC0/AafPhVzSB1SOqL0sjWzTKkmLz9u5isX/0wIA/gmZCPGIAUpwykLRwKNwU1/OOdMnCh1pX2zdb5V2Ax0I5xuzb5vTXDSNbFBbwJ208Yf3NUj9Za4mOiBC2kbjt8tJmuCfPbdEasYGYKhxQ6e/ddpvtB7AHEW8XkSMlU69yiNZ64HvxFZ7mdyiNXueK6M1/MSocDp3j6QerLBH7m1m0Hb5GkAC080CqK2ElfBL2QezTlrH8FrBEr792SDQb6zRdZz/V/SPFLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mARH3HXQvn9H2K9C75Ooeo+YZ9BTcmxpCVUThYGK/EU=;
 b=lHgufcxFTIMYmhMcYSTsVkMRQJLzxtdEejivvV/py5bcMDmkV2yIlrz6i3AN9swYhbCNUFsSi7bPZ4kfKTt8MW9hxxiz8UX+CMCycDg+y5DJCppNeaqZqsr6z7WqRjivBu/f0lurgvtMTVWnwZoIxTxxLuvNJScu6tC8JebB3YGp5D/jL0atYa4g4mblRokEaubMca1oPhsVHuMOOZVfmvh5Q0Gix2q30LyI6mWd4bdcK5cOiSqYXKLI3ZjtbnX+B4bdLwdZZbCNViSR3mpTjbRiObqK6uKSTsEKKqHtwJGjNfHZPmmXLGYNaFg8u0MmtESdDm4Fg0A0v7T4UT7Beg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10202.eurprd04.prod.outlook.com (2603:10a6:150:1c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 11:40:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 11:40:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 19:32:16 +0800
Message-Id: <20260203-cleanup-v1-12-732e986039cd@nxp.com>
References: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-732e986039cd@nxp.com>
To: u-boot@lists.denx.de, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Christoph Stoidner <c.stoidner@phytec.de>, kernel@puri.sm, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, uboot-snps-arc@synopsys.com, 
 u-boot-amlogic@groups.io, u-boot@dh-electronics.com, 
 upstream@lists.phytec.de, u-boot-qcom@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10202:EE_
X-MS-Office365-Filtering-Correlation-Id: ac04527b-7f8d-480d-cdad-08de63190387
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bi9OOHNzN25mU0d6U2xEUTF4VC95eEcwdGdtMmdhNHZxNVcxNmxqSkt0a3k1?=
 =?utf-8?B?WVdIUzJzS0xhd0xEVXRZT2lkcVd3RWtrNXpiQS9pekovV1hiMnZsM3hkSCtq?=
 =?utf-8?B?TUp5NUF0ODJ1ejlFMzk4MW1wa3lmamNyamdEQWhXK3VydVpzOVpjZi80TnVp?=
 =?utf-8?B?RXBORXBNVkFVTXV0dUNSL01MWmYvZHd6SWpsZHdIODRmYzZlek5JVTBSbmg0?=
 =?utf-8?B?cXgybzdnZU0yRWFERGN0VjVMdFI4K24yN01WcENTR0N5SmsxZkV3by9DSkpQ?=
 =?utf-8?B?NmIzbERTVVBacmQ0bjJ4OU1QVlJxRDF1U1dRZDA3eDZoeDBZcVMrVVBLbVZs?=
 =?utf-8?B?S1l0RVlYOHpNenNtU3BFVHlqN25GZjFKbVlGZyt0RmQwTEFEZ2plN1E1R2E1?=
 =?utf-8?B?L3VDSVhKU2QxSDA5QW02ZVl2L0RyZm1odVBnakZHbTJ1Q1dWaVNXR2QrdEpi?=
 =?utf-8?B?dEZXWi9JTURSbTRVQ1JrY1YyYVFMeVZjSUN5YzJwRnAxT2kyMDljSk1heDJL?=
 =?utf-8?B?blNUZE9WdFJOcGc1K1FpZ3g4SXg1OGJoeHJHZk9GbmErNDhGbTZoRmNMaUo5?=
 =?utf-8?B?Ym9tVE8ydlYrbkRnQ3YzT0Zzakt6RVliNTVYSTdMbTJ3UzZuRDFrWk02NVls?=
 =?utf-8?B?SisvN0RSWldwczZsWE1veTVDb2xVeUxJTXNUODgwMHRGREhLYUoxdDgvVG1W?=
 =?utf-8?B?V2tOY0Y5UEVxNUJWaTE2R0l4MGFOMC81dVgySU1Nd1hNeituTm5aRTNPU01S?=
 =?utf-8?B?VXJKSEFxV3o2UDUyQWxPcWk1RlZFbWg1cXVidkZvbEI4WUJLa04wOGRZS3pB?=
 =?utf-8?B?Q1Z3WjVYSW1IdjJjdE5MTDh4R0VUTSsrbVdrMkhjNWR4ZVhwclkwVzZnUWxW?=
 =?utf-8?B?ay81NTBLMlFPRUI4VnlyZ0Vtd1hsdlQzQ0Mxb3drNGZmYUh2VE5CTVBQTSt3?=
 =?utf-8?B?VXJ1ZkxaVitiZm5wOXRZc2trUnpTOTJzZkJ5RFRPNUt5MURnSjEyUERnT29M?=
 =?utf-8?B?V2dVS1VsKzBNYXVSb0tlaVJhdjhNdXdJMVA1YmFuZEtuZlJyV1RiUGlRRDJa?=
 =?utf-8?B?ejl3WXB6Tk55ZEtMbEQyb2tGTXdhWE9yRlhRQkhzQVppZU9iT2o1Z0RRWWNH?=
 =?utf-8?B?Y2RNbCtMQkNrVDlnZUVDTGNWWGVoQWdjblcxbXhLSGx1OCtJTlNUWGk1SENu?=
 =?utf-8?B?Y3k2RFd2WmErSWVTN3lTcHVVZjhmTUFibVMrdHUyLzA4K1paOWx5RnRoQ0hT?=
 =?utf-8?B?T21FaE9hcnpPUVJMWWpQMFo5N08vb0ZLbkwwQ3dIc1JiclAzaC9lQTRkcHNO?=
 =?utf-8?B?T05JeC91ZjU1Sk1yNC8xUkhTRmxzSGtrZHhuWjRZNkowaXFHY003c2NmeGJ5?=
 =?utf-8?B?RUZiK3k0bWlNeTFXeHRqM1ZzanJ4M0oxVkpSTXZ2by9abEJJSWk4UmpLVTdE?=
 =?utf-8?B?SDBNaDU2dDhObjdRclFKMkIxVFI3NTFYMjc0YW5RYmNoK21HdjZqVWNyWXgz?=
 =?utf-8?B?eVlTRnRScVFlTzNnMllkUWlGL05sSGlNREtXaXQ1cDI1T1VNdzBKQkc2cGRw?=
 =?utf-8?B?VDhBVjM3NW1SaUhlanVnZ1F1UzdOZVVuaWx5VTlDRWF3R2Vob2Y1L2hqSkZD?=
 =?utf-8?B?TmJPcmJzRklYT3ZNRXN4S2FvRGllTStUWm1lbVdRUEdRaDF3QnczUFh6UnIv?=
 =?utf-8?B?N2QrNkkvQkx2VnlOTldzUEgzN0EzQnVNaVpTSWY4cHU0QUdpQTA0OGUvSEJk?=
 =?utf-8?B?eFJOOElVUFN6VzlVZ3diYlFvcUtIbS9ESDh4R2tzQ21GMTNCNmY2eE4xcWZt?=
 =?utf-8?B?K0NIYzhBYzBUTGl2UFpFSHd0N3JFZldRcUp0bHlKZ0Y4blZDMXg2Q1k0SDZY?=
 =?utf-8?B?N2VLN3ZFSWJLUGpvNDdpQkdvZElMZFVKRXkwOVFGWWlpT1RjT0ZCUzRaaXV6?=
 =?utf-8?B?ODJJam9LUTNlZjI2S05uMUpVN3J2cHpWL0FVSXpqNllPSEhKejNmVUlSdmZm?=
 =?utf-8?B?eEFRS0lTL0ZiNDdmRVI0RmtQVE0zWHE1RHdxd1Bod2lQeWNLc245bmd5aUR0?=
 =?utf-8?B?RnpWQmwrNi8ya1pyM0JLdFUyZ0VLQ0hFYU5JdkRMdzNwejFETm9lZGRjaG1q?=
 =?utf-8?B?Tk9yMWgxeUFicHEzeW9pRUVZc0NCVjhtZXdCeC9qbmswMnFNOTNpL3pEZHBK?=
 =?utf-8?Q?gLgaOBSGlosZDMHmcBeSHlqbw2quw5oak8tptFTR6Aov?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGJLUlNRemg3bWU4R1ZNajdlMmw4N1VSNHJxU1RTbDVVNk5BU1N4clBiVit2?=
 =?utf-8?B?eU1sYmlJY1BJRlJTUnBLQmVNNFRqbTdRdTZvNTcxYXI2Y2hBTStXTnptWFov?=
 =?utf-8?B?R0dwdjFZb2R4ZmpGekN2SzhrTm80RnNhMkhmUFhkK2ZTMTBCWWkxc3haNE9j?=
 =?utf-8?B?SWMyc0FmVEt1aWkyNWVuenRGTEJBbDJKQURraU0vVkJpRVNvM3dpMWFUajNS?=
 =?utf-8?B?TGVxc0tLVG13Szl5N0FuMGZKU0JkNnA2MUtyZEN2NE1IQVUvNlZFSDlOa3po?=
 =?utf-8?B?OGxhRFFVTWlQb0FHMCtiL0pKdFdUK2dPai9VSkRraUJHYjdUcDgvVWVKaHdk?=
 =?utf-8?B?aCtRTGlZNTJtWWpEWk41dHZIRGRCWTVoMXE0QWFyd1loYXNyZTRwVUt2Z1JB?=
 =?utf-8?B?bVhIZWVLTkhVUlRqZ3JkaFZmdGxHTG84Q01rVEFOcFF3OTdXOGZwWDhSdlR0?=
 =?utf-8?B?c2RhUDlTcGJjOVl3VjY3elBkLzZDc1hHY3NWUVBuUnF5dlYrejRWWGtSdlNq?=
 =?utf-8?B?SXdOUWNsdWwwdWFIQnZKZk9VV0Z4c2p0R2g3OFMzQy81N3ptZThJWlIzVytH?=
 =?utf-8?B?Tm4wVWVIRkVCSXBZVWI1c0lQekgrdWpjcno3K2FWRnEzc0s5bU1paHovQmli?=
 =?utf-8?B?N1pmVTFrQnlhck55bm5SaW9HRlNvQW00SWZqNlNXejNtc0hxU1YrbzRsQkht?=
 =?utf-8?B?RG82aEFLTlovWEg2N1RqbER0VThOa0lKM1V4Wk5odk9uS2xGNmRXdlFZMWJI?=
 =?utf-8?B?V1pRT3V0bkJlTEVxZ01TOTI3dUN3Q3g4MHZKcldUZkxCVWd1cWxvTHNqTTBj?=
 =?utf-8?B?MHZydVBoUEpBci9Xd2RyRWw3am1HYUpHbmY3OTNkeUdycHdjOG9vL2xjSElY?=
 =?utf-8?B?aDVZV1JSTUJaT2dFbmkvaDFEQ0w2K1FzY1pxY01tSXpFdmo5TFU2cG8rVlZE?=
 =?utf-8?B?M2tvSGZ3d1NUaHh0Y3BiVUVnaStPeURsZFZ0cXlPZWpQSXJ4WjNlamhmUWYv?=
 =?utf-8?B?ZnRaR1htbmVsV1pmRXBFa2JCakdaemU5OEhwSFJ4alZpNDFDZ0o5cjI3RUM3?=
 =?utf-8?B?UlVtNzlzREY3SFFoV0RhWHowRlN4Z2xMdlh6T0dScGszVmlrMElCVE1wcUdu?=
 =?utf-8?B?cUxNOVc5MkdlUFlqTDdnU1l4cHdJcVRPemtEOVFnR0lka2Zqc1BhbjBFKytV?=
 =?utf-8?B?UFBET2l0Sms2UVkvTlJHaGdGQ1gvNk5Wd0FsTEdBSVZHdlFDMXEyaFVFNGx3?=
 =?utf-8?B?QjhmRHNsT2xMeHJNZnU3aytTU0xuUmdxQzErS3dSbnVmSG9FVVZmbnl4TXpv?=
 =?utf-8?B?V3ZTOFBtMEtNYTgwZE4yUVdFT1A5Q0JhOU0zNEgzT25pdWFDZnpGRkRWb3Ba?=
 =?utf-8?B?bytDMGcxQlVFYjcwSkc1cGlRbFhUdEtsSkhOR1lCKzk3aXJOUGlwbHBYb2hT?=
 =?utf-8?B?RFRXOEFhSUcxREw5N3RCMklINnhWVnRQcHIrWnRoNlViVFNRYVNHbzJWYWxj?=
 =?utf-8?B?RnhGNFB2Wnh1UUpPZ3hNTlNFWW9RZzdiVmF6SjMwbjlKK294alV3dUVJUEho?=
 =?utf-8?B?UXk2SEdCSG5SZjc1Q21KdjhmN1RnNGwzZlN0ZU9WenhraWpxeXJUYW5xUWFK?=
 =?utf-8?B?Q3VrNmRaRTZnM29obTk1U3FrN2dFZ3FPL0xkWm0vSXZjMnFLYjZ5c0dxUGw5?=
 =?utf-8?B?QzF6UE9uRE1OQm8rN3puYVFueU1LVHloTksxUTVHMVR4am1jb0h6M3pOdmZR?=
 =?utf-8?B?VFRqVG5ncWhhK205R0tJYzRDeEVrL2F3MW92SGRVMFN5RG42WVpnRG53RGFk?=
 =?utf-8?B?cVdXS2xEZFExLzBMVnlYT3U5UHpWWDgrSStDd1dFUlJ0UWs0SnZ3ZUZLcjU5?=
 =?utf-8?B?YVA1QnRCVTQ4NjIwUS9pdVFwSzVEZnNpMElEandzODEyajljL0hHcUQxN2I2?=
 =?utf-8?B?YmlTYVRKSWsxdVJuMlVxcmVEc0ljR3F1aFhkeWxWVWJnT3hnaENDcFpabllu?=
 =?utf-8?B?L0JkeE1YdG1CODE4VXozc3pBd1dEV2RXalVWSkhHeG1hRGFtOGU4ZFg1aGZy?=
 =?utf-8?B?dWlkdTJ1WWFOTDhDSUVvYytIS0hVeHBzSU9qaDI5VjZkOWlOS21wZXg1cWU4?=
 =?utf-8?B?ek5sWkh1ZUl1N2p4VG8yejBaVTdGWkxjdU1rSUtabUt1R0RpZ1d2OERnWWxO?=
 =?utf-8?B?M29yd2tobzZOSmk4OW5zV0JIWTNoUHFGenl3em5ENlA1b2tFdjcrNXdlc2VV?=
 =?utf-8?B?Z2RaN0lRbXNicUFQSXNtK0tMczJYSDlqTDFIelYrNVJFTmxVVk1tTnFwTjFQ?=
 =?utf-8?B?MnRwL1RBeS81TmtmaCtQemorYXAwYTdERlBtajRpN056L2JmWmJyUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac04527b-7f8d-480d-cdad-08de63190387
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:40:21.9751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VY/q3rEfHkmtGY6T08LEEDLP/HqdRpQD3z/FedwIKnYDB47kKR/da3XS8L/zCtm2uNmSy0GD2damuxdhQmmfRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10202
Cc: Debbie Horsfall <debbie.horsfall@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Angus Ainslie <angus@akkea.ca>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>,
 Finley Xiao <finley.xiao@rock-chips.com>, Zixun LI <admin@hifiphile.com>,
 Vitor Soares <vitor.soares@toradex.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Swamil Jain <s-jain1@ti.com>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Eoin Dickson <eoin.dickson@microchip.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hal Feng <hal.feng@starfivetech.com>, Marco Franchi <marcofrk@gmail.com>,
 Neha Malcom Francis <n-francis@ti.com>, Ramon Fried <rfried.dev@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 E Shattow <e@freeshell.de>, Sam Protsenko <semen.protsenko@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Teresa Remmet <t.remmet@phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>,
 Francesco Valla <francesco@valla.it>, "Lukas F. Hartmann" <lukas@mntre.com>,
 Heiko Schocher <hs@nabladev.com>,
 Paul Geurts <paul.geurts@prodrive-technologies.com>,
 Tingting Meng <tingting.meng@altera.com>,
 =?utf-8?q?Timo_tp_Prei=C3=9Fl?= <t.preissl@proton.me>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Gilles Talis <gilles.talis@gmail.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Leonard Anderweit <l.anderweit@phytec.de>, Stefano Babic <sbabic@nabladev.com>,
 David Feng <fenghua@phytium.com.cn>, Bryan Brattlof <bb@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, "Lucien.Jheng" <lucienzx159@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Jerome Forissier <jerome@forissier.org>,
 Sky Huang <SkyLake.Huang@mediatek.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Primoz Fiser <primoz.fiser@norik.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joseph Chen <chenjh@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Sam Shih <sam.shih@mediatek.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Mathieu Othacehe <m.othacehe@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anton Moryakov <ant.v.moryakov@gmail.com>, Mahesh Rao <mahesh.rao@altera.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Alifer Moraes <alifer.wsdm@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Brian Sune <briansune@gmail.com>,
 Leo <ycliang@andestech.com>, Greg Malysa <malysagreg@gmail.com>,
 David Zang <davidzangcs@gmail.com>, Ian Roberts <ian.roberts@timesys.com>,
 Simon Glass <sjg@chromium.org>, Osama Abdelkader <osama.abdelkader@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Mario Six <mario.six@gdsys.cc>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 Yannic Moog <y.moog@phytec.de>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Dhruva Gole <d-gole@ti.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jonathan Humphreys <j-humphreys@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Rini <trini@konsulko.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Bernhard Messerklinger <bernhard.messerklinger@at.abb.com>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Wolfgang Wallner <wolfgang.wallner@at.abb.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Adam Ford <aford173@gmail.com>,
 Sai Varun Venkatapuram <saivarun.venkatapuram@amd.com>,
 Wadim Egorov <w.egorov@phytec.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Linus Walleij <linusw@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Harrison Mutai <harrison.mutai@arm.com>,
 Aaron Williams <awilliams@marvell.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jeremy Compostella <jeremy.compostella@intel.com>,
 Casey Connolly <casey.connolly@linaro.org>, Yao Zi <me@ziyao.cc>,
 Rick Chen <rick@andestech.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>,
 "Guillaume La Roque \(TI.com\)" <glaroque@baylibre.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Brian Ruley <brian.ruley@gehealthcare.com>, Peng Fan <peng.fan@nxp.com>,
 Marek Vasut <marex@denx.de>, Hai Pham <hai.pham.ud@renesas.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Randolph <randolph@andestech.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vishal Mahaveer <vishalm@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Ilko Iliev <iliev@ronetix.at>, Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Patrick Wildt <patrick@blueri.se>,
 Adriano Cordova <adrianox@gmail.com>,
 Martyn Welch <martyn.welch@collabora.com>, Keerthy <j-keerthy@ti.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dinesh Maniyam <dinesh.maniyam@altera.com>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>, Anshul Dalal <anshuld@ti.com>
Subject: [Uboot-stm32] [PATCH RESEND 12/14] renesas: common: Include
	asm-generic/u-boot.h
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmail.com,m:n-francis@ti.com
 ,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@forissier.org,m:SkyLake.Hua
 ng@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,m:michal.simek@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[195];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,blueri.se,postmarketos.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6A99AD8852
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

struct bd_info is defined in asm-generic/u-boot.h. Include it to avoid
building error after asm/global_data.h are removed from this file.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 board/renesas/common/gen3-common.c | 1 +
 board/renesas/common/gen4-common.c | 1 +
 board/renesas/common/gen5-common.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/board/renesas/common/gen3-common.c b/board/renesas/common/gen3-common.c
index 94da00985d34049222a2c5aaec650d03dc2aec85..f89ae81e95ec551b8b254fd0fee0b9839f798b85 100644
--- a/board/renesas/common/gen3-common.c
+++ b/board/renesas/common/gen3-common.c
@@ -16,6 +16,7 @@
 #include <asm/io.h>
 #include <dm/uclass-internal.h>
 #include <asm/arch/renesas.h>
+#include <asm-generic/u-boot.h>
 #include <linux/libfdt.h>
 
 DECLARE_GLOBAL_DATA_PTR;
diff --git a/board/renesas/common/gen4-common.c b/board/renesas/common/gen4-common.c
index 38fba7a5ea77778383d29f2403a585bdb54994e9..81c6f6f4c6ddbf78f50657bef9a31a4f3e8e6099 100644
--- a/board/renesas/common/gen4-common.c
+++ b/board/renesas/common/gen4-common.c
@@ -13,6 +13,7 @@
 #include <asm/mach-types.h>
 #include <asm/processor.h>
 #include <asm/system.h>
+#include <asm-generic/u-boot.h>
 #include <image.h>
 #include <linux/errno.h>
 
diff --git a/board/renesas/common/gen5-common.c b/board/renesas/common/gen5-common.c
index a05a3e8abef46f55ae649d11741ad45797090728..3b724e59049c0b451b6e346a6ecb9846c3226e97 100644
--- a/board/renesas/common/gen5-common.c
+++ b/board/renesas/common/gen5-common.c
@@ -10,6 +10,7 @@
 #include <asm/mach-types.h>
 #include <asm/processor.h>
 #include <asm/system.h>
+#include <asm-generic/u-boot.h>
 #include <linux/errno.h>
 
 DECLARE_GLOBAL_DATA_PTR;

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
