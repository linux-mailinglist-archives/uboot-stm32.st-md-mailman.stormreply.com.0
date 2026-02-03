Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id L/1xNWfTgWmlKQMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:52:23 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB71D7F65
	for <lists+uboot-stm32@lfdr.de>; Tue, 03 Feb 2026 11:52:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F40AC87ECA;
	Tue,  3 Feb 2026 10:43:22 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010012.outbound.protection.outlook.com [52.101.84.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBFC9C0693E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 10:43:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZb0jQiIVcPQ0l3QljFylTrTE4zWHtYcWyJv8j3HKGqmN81udrPlY7dl9YIxJySoJdNOwSyfG+ZgmlwaYiLXMhGKqb6fFIpk2pCxB069P230JTYfRsfLHAmxGZjtQKNhpcZCvbsv1QKHLjigZjy/eEdr0tBoA9FkP+aAB8T78o+qM1e5Cpc2EVfWRkRgvDG4N0ji6uG7ZAPEWPvZAEf5lCv6Oe+KUE3/3Zyusy0IxEBHZmKFu0wKT3EtHGLRi/+z3/8ssw2BSoQMTcl8ZBe0864aB5UW9WOP7+7ziUbqj2ipQmzUFk/QFWInd+YxqBF+XVBu1A+pEJMP/GsPDHxolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dxbr7uyv8Xqm+u1OsX4NFT/MEzMSpSPFOaM6+KTG3SM=;
 b=UjYY7Fn+tHnKXYDDSMz9O48soXNElr8XxMKp+iw3pkDSNWwqfiSQ0G7zD+tqry8F9B330+ySPu6F131AhanA+eYkGaZfgif03TnoFM/UNN5h8OMwfB6lKT6bQMdDlDT5FG0dzsVgVhFo9nyy268jwX5sQHW00uBcbIQNRQ6DzyHCGQk05yDIvV1rKfxHUcdLAFXV9PTUj8C5nsd90kn7SxjAv7leZ85FMKiCaUcYEHf6qah9ZYapkXKHX1NPGJ5G1IrL+IIH7K7TkUgNxg+DWP6fd1uM+M3jhggP922cLS+hgrIaTkCchKk234yk8Cx1gjPNzAGlVEWMJL5mwfcsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dxbr7uyv8Xqm+u1OsX4NFT/MEzMSpSPFOaM6+KTG3SM=;
 b=xdCaPgvXLYX8TWUtaVqN1zeQ6UKoxWT957eqvbxxBan2JXBLvBJ2HDZG4xd2IP+HUk4v9ItcGX4XsUfzpRMzrDMmEVPI5u+Iprp7F26kp34wQOLA3hQlQu5wHd0zGkAPkLWwE7z/KFQtMH3g0eOFN9tkJk6/XPjZ8ZgHe22m9YUesohimUxkAvji3LPn6Ea2r03l8EgzQdLoZypV0/9ZVRyj0uZxl5vDe7bMprBkyU97mhQAOzcgqRKWAQu4fHDFO3zbC5e8Q8JteaNJuU1hToAQ+hVGMPXrGhIm0LFZggEnil6YFw3NJYqfuQu21lNFQ8g+COAMnIpOVHNjdZPiEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11197.eurprd04.prod.outlook.com (2603:10a6:d10:170::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Tue, 3 Feb
 2026 10:43:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 10:43:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 18:41:34 +0800
Message-Id: <20260203-cleanup-v1-3-4221c13e7558@nxp.com>
References: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
In-Reply-To: <20260203-cleanup-v1-0-4221c13e7558@nxp.com>
To: u-boot@lists.denx.de, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Christoph Stoidner <c.stoidner@phytec.de>, kernel@puri.sm, 
 Sam Day <me@samcday.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, uboot-snps-arc@synopsys.com, 
 u-boot-amlogic@groups.io, u-boot@dh-electronics.com, 
 upstream@lists.phytec.de, u-boot-qcom@groups.io, 
 uboot-stm32@st-md-mailman.stormreply.com, adsp-linux@analog.com
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0187.apcprd04.prod.outlook.com
 (2603:1096:4:14::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11197:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a0375f-f246-4ce4-c147-08de631108b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YllxWUdGL2QyOWJ5d2hnRldrTVM4UnFFMXZWcTdzVm9QbVpLallRdHhmOFEx?=
 =?utf-8?B?dEhYSVNGZnNyMXZ2a0FnZnZKMGZWQ0VOMVhIaXpiTFZNcmJnbUQ4R3RBbEw1?=
 =?utf-8?B?L1lIUzdQQUJndjJOenFyZXo2Yk9GNWNBRXNaS1NDbjBkVVp6TFhPT0Zkai9q?=
 =?utf-8?B?eVlUcDhSV2RYYkRLeHVpTEpsbzk0WHhPS2dQeTI4VU95UllVSkVZZW5JQ3BF?=
 =?utf-8?B?RzhYNU9FYk5BZHBoclI4d3RTTDRVNERaQkFxcm9SQ080a0xmcUl1K291eHVH?=
 =?utf-8?B?bXFXa0JtcU5Ja0RqU1pvREx2elF6c2dtZmtLV0ludE4vcUhaZzFWMzdsSk5k?=
 =?utf-8?B?S1hmV0NudjBxWE9GRkdzMzBDcENVRUF1V3pucmR1RS9UaWs5RldjQytZWFox?=
 =?utf-8?B?d0VDRXRtYUxTZ0EvRzNZZDhxMGJDN25ENlpyRDQ5UEhUcHFIaHJHbm0wSFBk?=
 =?utf-8?B?SmlRVjlpU1ZaUjFsK1VEN1VzVVU3dnFWVUVIV1BTL2RXRTNLcFdlSWpVbGw0?=
 =?utf-8?B?WnZhbGJheDFPVUI5SVlvaVhTM1ZrZGpRMGkrWlZLdWhzYmFCc2hPM3dIeGtG?=
 =?utf-8?B?dEZFWDcvNzBINnpZd0M0cFh0alNCSzRPdGM0TXZ6SGg1VlRFa00wdWFvNW9j?=
 =?utf-8?B?OTJjMUErcm5ZcnlKL1NuVGd5TkRaMXY5QWVHSGJLcWJLbFdYdng4OUlwdkw1?=
 =?utf-8?B?QWZQbjNLSWFncVJGdTRVb3lZQXVoWE9OaCthaFZHQTdKeE50T1JIeXdUMUhv?=
 =?utf-8?B?NlI5RUdVUVRjR2lDTjFUck04ak5EUnFkYmRlbHg4R1dDNXMwNzVaQXBOMCs1?=
 =?utf-8?B?YThuNHIydHhRZEVZL1pGb1BFdFZscklrQkhxMFBOSFdpSVBWTEw4a0hMYWcx?=
 =?utf-8?B?VzdzZU5KWWJ4VmRMdmtDU2xCeDFMTXdTcWxDbjVIMkdCYlNKWkpidHRZOGRY?=
 =?utf-8?B?R2tSNXd2UE1yNDBKRHoyZGorZWtJREF6MFNZK3pCSi9nWFFuRmhPeDcxSWQv?=
 =?utf-8?B?eUtucHlVdkUwcHhhaHNpWnlGUjdtaVhYVG1ncUQrS0lXQ3Q2ajlVdTFVYWx0?=
 =?utf-8?B?ellHZzhCZkRnL2Y1cW43ZThwOTd5L0hVNXExY25QVkdacUJRL3lTUDE1dWds?=
 =?utf-8?B?SU51bFluN3ZQeTdKaVJkdTc1VjgxVFdVZ08vR0lJMmY0bjJCUDhCUDRHTlAy?=
 =?utf-8?B?SXI5b0xjVzI3aVFidVVyNzN3TTNwd2gyQWVZeVJXRlB1RWh3c1dPMVJyNUJR?=
 =?utf-8?B?dXEvNXZva0dSZFJmRVVianZZVmg1cmt0Q05LU0NoR0c5azhZaDJ5TmY2YVht?=
 =?utf-8?B?WWdaeDJSNmZqZHM2SEUzcXZjVmRPUWhOTThNQTV2cjN1WTliTTlBOVNORXY1?=
 =?utf-8?B?c0N5b2h1RnlIODd4Tkd1Z1p3cHlnZmpDUk5LeXh2SENScnVITHpSdG55MDR4?=
 =?utf-8?B?WTMvVGw0MTZFNjNCQU5TcWw1UXp6ekV4VmN1OS90WjRIWU1NYktCRzhrc0s5?=
 =?utf-8?B?N1JPUVI2bDVlN1JtY21qNmVDRGFwS01JbUpheHNSZ1FWV3Y1dXVPWnJjQ3lm?=
 =?utf-8?B?SnU3Vm9MV05iK2pYeFEvZDQvQTU1b2s1dTROeU0xQ0toS09Ub3V6NktLVW8v?=
 =?utf-8?B?WVk0R1ByK1IrOVBYdkQ4endMMzJUOFBQU0lYTWQxUmVYckhxTUdlZEc1ZnJ3?=
 =?utf-8?B?U25PQkNKWjlmcmsxTlVKYmdHb2c1WW5LbmhiWWJibGVPRnh2M09sUTJEWm9r?=
 =?utf-8?B?Y2htVlFlTWV1dU13VVJzM2ErZ1lIRUNiL1ZPMEY2ai80b2lHLzkvRWlYbG5S?=
 =?utf-8?B?WDdCdDhpdkJvbFZUMEZWdWtPM05ieEN2V1ZHOUVwejd2c3dDSmpBVi9sK0tv?=
 =?utf-8?B?VFY4cDliRkpCRTBDZFRIaUxkU1hJWDRVRWxQVWxSVnIvRmxNZ0pLRUpCVEp1?=
 =?utf-8?B?ZXd6ZjBHTHpUQ1o0MkZ2OU5ibmgyN1VScjBPOG1INXFlay82ZGUwZjFEQUhX?=
 =?utf-8?B?NFJHd1hsRmpUdzR6UUJFYWNTZmVISk9VZmZjcGJWMXBONmg3cmQ2S01JRS9q?=
 =?utf-8?B?dmp1Z0ozdnJJc29SLzhNLzREUDZUWldjcDJza1VpMVdLSGlXSWtXbyt3RGRL?=
 =?utf-8?B?dFM3blZTZy9iN0VLMVZlM2lzQXNsL3A3c1BQbXk5dElRcVpwb1k1L0ZpbWk3?=
 =?utf-8?Q?/kTsH1O9gBd78DBq0Q9HADkFBS/LB0pJ3yr+voFUgSTg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHdrWEszRzFYVG9CRnRTdGtHd3NjNkx3azhBT3pHdWR6YWF0VDltNzN5NlJh?=
 =?utf-8?B?bkMxMk8wS2Q3N1FoRG9aQzRZdHpMNXBkRlRFL3hmZThNN2k4YUNXWTBNZ290?=
 =?utf-8?B?TVc0SkR5WXpVdGQrcjFBbys2NnY1WTVqdURPbUpRc0JoSXdyQS9ONVpDSThm?=
 =?utf-8?B?N1VsMWZ3V3U1bDAvUU0wNjd5WlpGZWlUWEU1OU9raXR1STRYaDM4ZDdYTzV6?=
 =?utf-8?B?WHRLd1hOUnFHdFlpQUIzV3dmTGN5cUl2UkdtWE5YYjYwdjJHejdrNDVGZnlV?=
 =?utf-8?B?ajFNSDZnQUxUWjRaQ21TTWpVOUJCclFjVXk1WEJEOXFzSTFQK0RQUjhsMis4?=
 =?utf-8?B?OW5qc0RGa0crM2ptRzNaSDAwYlkxVHp4eWVrL0tsSk80ZXZWbW13eVhMYi92?=
 =?utf-8?B?UU5MSGpFVmxKUVk1S2xpam83dHRxLzlTemNXZGpObkdabkRwejVnckY3cWl0?=
 =?utf-8?B?U3Uwakhwbk5CT293RlJDNUJaaEo1WjhQcWVHWDVnNVBHNDN2b25BbTFzUFpl?=
 =?utf-8?B?dTJjQTgvY3hLMmt4SU5uRExoTnh6VVRvVTFOZGZSa1RmclBIMlJtR0paTWVB?=
 =?utf-8?B?aHlaYzBhUTgvNFF5Ri9KbERzMFpYTm80STFua2VIN215N29zcGU2VHJYekYz?=
 =?utf-8?B?RXBEWk1hSnR3Q3gxSXdwYmdSNTJ1clFUcHFIdi80T3JxWDM0eWEvMU1lblMv?=
 =?utf-8?B?ZXE4SEgzbjhVMmJiMzJIdHk3UDBNWHh5dUhEZi9wWXZxSERrU0l4ZmRRYUM4?=
 =?utf-8?B?Y3lFWnB6R0FYWUMzOUw3TElwa2RDcVlTNEFOQ3BDbkpPZkErYnowbURMVnBu?=
 =?utf-8?B?WXlUSDFxSmlqZHRZUHpoQXc4VE9hdEhzZjhnK3hNZ3BnRklMQnVUZVdoY21u?=
 =?utf-8?B?ZUMxOCs3c056ZTQzd3FSSlV6clhYTkJlOUU1OEtRenNXSWt4cENuQ09Qck1Y?=
 =?utf-8?B?ekExekh0aWlHa2xRNHMwWlZnRjJJL3k1eTdOajhubGpDMThaUG0xL3dlN0NS?=
 =?utf-8?B?VWdSQVdmL3IwbU12aHlPdTdyYUJBWjY0YkVReGR1TWR1YVlPa0p4Y0g5end3?=
 =?utf-8?B?NWlIQzFReUZUOS9iSjhDYzZKVVNIZ0wvSHJwU2h3eGR4TVRoYytpU0dPUXdn?=
 =?utf-8?B?QmMxWFNtbitRYmw0S1M2SE9GK1ZOWkJ3NGhyalh2bExOK3FQd0RTaEZLTlVG?=
 =?utf-8?B?SytwWDBFUFYyaWF5amdVOXJvQnRqUy9pYUp2aEZaVC9HQm5Pdmc1R2Q4UXZs?=
 =?utf-8?B?TEJoTVFORTFvVFFBTVNFRkdCNjdmSUx5bVRJanMrYjVGRVYweDdGQnRSM0Zs?=
 =?utf-8?B?UllMemxYSG8zRVMzM2RzeEhEQUkvNjZNMXpwcERLVGFBNklxWnZmRzVpcEl2?=
 =?utf-8?B?RXcvMEtTcHh0NnFTcUdsVHYxQWRxTUQ2cWdDeUR3T3FXVTE3OHdCcnBTYTZC?=
 =?utf-8?B?YTN1T1BhUlV1MUVmanJ6ejV0S3NQeGo5YStkMTBJTDBBcWpHUTJrMVJNbkxB?=
 =?utf-8?B?aXJnM2o5UE5acWR3blZHQ3RhdmNWQnAvaVNlU3NrQ2ladThwNGdvcGhja3Fh?=
 =?utf-8?B?L2wzbnRCNUwwOE96RXAzSWVmWE1vMEZjNnVaeWl2TkpTRlB1eTRHYzByZWND?=
 =?utf-8?B?TGdMempudFpScDRvWEpLaW10T1ZVNmdsLzNLUllWLzRZUzY3V1ZibVRLRnFz?=
 =?utf-8?B?ZVhveFFkUjZ6cmlBMi9GZXBQWEo3TlhTUlB1TGI1aEVTRmpHdzg2YUE2WWYz?=
 =?utf-8?B?UGNDc0lXalR1Y2dQRFc3Y1Y3Y2Z2TGRhUzdaWlIxVlAzdTNKMmxjd0VCZldv?=
 =?utf-8?B?U0JwTVhsMHJSNzIzTWZ5c0dBT0ZrbWNqYUlSM1QweVN4NktiV0lDam9qclUx?=
 =?utf-8?B?R2RsMElKVzlKWEM0V1lzSHg1aFdLemxyRWEyLzMzK0xXVmxVMWJIRVdNZndI?=
 =?utf-8?B?QzhOeW9Xa25ialFlelVreFFvak5tbWl1RVg3NXA0WUd2cU9XTUtFQk04TElD?=
 =?utf-8?B?YWc4Z21lM2dRMHdYbW9Wc1RNd1Y2YmVWRGo0VVIxc2tFQ2ZmSGU0MTN0NDRa?=
 =?utf-8?B?dUo3VTdETE11czBHMUhyMjVqSWUrdTBWYWlxS0IyaFVrOW8wYVo0NUlRUDNJ?=
 =?utf-8?B?c0JITnRqQTNtV1Y0Y1pNUExpVXVidmxLRkp1OVNNQVNqT2FDUmNscGJRVElL?=
 =?utf-8?B?NnU2WHlkcHpPMEVEMUVBNzRLVllqYUEyMWY3VjhpN2lSR1c3ZmxhQldZRktQ?=
 =?utf-8?B?R0ZWNGNGVmxOK2VQUUZLbE5Rblp2QUZXRkhESW9UTXVnbGY1a1FadU9mUTIy?=
 =?utf-8?B?RG9SWGQrUnNHSHFvY2UvSCtLaHFxeFJJVTZWU2V1RVpnVTBPWWV0dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a0375f-f246-4ce4-c147-08de631108b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:43:14.7127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYU6y+j6bfsETc430KZ1TlJcskyKXoatkEIMJFYQSABZve7kG8d1pGDo1ZtDyRivvAJ0bZumahM9voSdfadHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11197
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
 Utsav Agarwal <utsav.agarwal@analog.com>,
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
 Ilko Iliev <iliev@ronetix.at>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Maxim Moskalets <maximmosk4@gmail.com>,
 Alexander Feilke <alexander.feilke@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, Apurva Nandan <a-nandan@ti.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
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
Subject: [Uboot-stm32] [PATCH 03/14] common: cli_hush: Include vsprintf.h
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:GSS_MTK_Uboot_upstream@mediatek.com,m:uboot-imx@nxp.com,m:BMC-SW@aspeedtech.com,m:joel@jms.id.au,m:c.stoidner@phytec.de,m:kernel@puri.sm,m:me@samcday.com,m:sumit.garg@kernel.org,m:tudor.ambarus@linaro.org,m:uboot-snps-arc@synopsys.com,m:u-boot-amlogic@groups.io,m:u-boot@dh-electronics.com,m:upstream@lists.phytec.de,m:u-boot-qcom@groups.io,m:uboot-stm32@st-md-mailman.stormreply.com,m:adsp-linux@analog.com,m:debbie.horsfall@arm.com,m:heiko@sntech.de,m:mkorpershoek@kernel.org,m:angus@akkea.ca,m:antonio.borneo@foss.st.com,m:ian.ray@gehealthcare.com,m:mchitale@ventanamicro.com,m:alvin@pqrs.dk,m:finley.xiao@rock-chips.com,m:admin@hifiphile.com,m:vitor.soares@toradex.com,m:jorge.ramirez.ortiz@gmail.com,m:horatiu.vultur@microchip.com,m:jh80.chung@samsung.com,m:s-jain1@ti.com,m:Peter.Hoyes@arm.com,m:eoin.dickson@microchip.com,m:chiawei_wang@aspeedtech.com,m:lukma@denx.de,m:christophe.leroy@csgroup.eu,m:hal.feng@starfivetech.com,m:marcofrk@gmai
 l.com,m:n-francis@ti.com,m:rfried.dev@gmail.com,m:viorel.suman@nxp.com,m:s-vadapalli@ti.com,m:treding@nvidia.com,m:Eugeniy.Paltsev@synopsys.com,m:marek.vasut+renesas@mailbox.org,m:ye.li@nxp.com,m:e@freeshell.de,m:semen.protsenko@linaro.org,m:kojima.masahisa@socionext.com,m:t.remmet@phytec.de,m:B.Hahn@phytec.de,m:francesco@valla.it,m:lukas@mntre.com,m:hs@nabladev.com,m:paul.geurts@prodrive-technologies.com,m:tingting.meng@altera.com,m:t.preissl@proton.me,m:ilias.apalodimas@linaro.org,m:gilles.talis@gmail.com,m:kamil.lulko@gmail.com,m:chf.fritz@googlemail.com,m:l.anderweit@phytec.de,m:sbabic@nabladev.com,m:fenghua@phytium.com.cn,m:bb@ti.com,m:alice.guo@nxp.com,m:stefan.roese@mailbox.org,m:alexey.brodkin@synopsys.com,m:kever.yang@rock-chips.com,m:lucienzx159@gmail.com,m:stefan_b@posteo.net,m:jcmvbkbc@gmail.com,m:gabriel.dalimonte@gmail.com,m:paul.liu@linaro.org,m:dario.binacchi@amarulasolutions.com,m:mateusz.kulikowski@gmail.com,m:vicooodin@gmail.com,m:kettenis@openbsd.org,m:jerome@for
 issier.org,m:SkyLake.Huang@mediatek.com,m:gregory.clement@bootlin.com,m:frieder.schrempf@kontron.de,m:primoz.fiser@norik.com,m:jagan@amarulasolutions.com,m:alex.nemirovsky@cortina-access.com,m:michael@amarulasolutions.com,m:chenjh@rock-chips.com,m:zhangqing@rock-chips.com,m:tien.fong.chee@altera.com,m:iwamatsu@nigauri.org,m:sam.shih@mediatek.com,m:ravi@prevas.dk,m:m.othacehe@gmail.com,m:minda.chen@starfivetech.com,m:philipp.tomsich@vrull.eu,m:ant.v.moryakov@gmail.com,m:mahesh.rao@altera.com,m:sughosh.ganu@linaro.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[199];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,sntech.de,kernel.org,akkea.ca,foss.st.com,gehealthcare.com,ventanamicro.com,pqrs.dk,rock-chips.com,hifiphile.com,toradex.com,gmail.com,microchip.com,samsung.com,ti.com,aspeedtech.com,denx.de,csgroup.eu,starfivetech.com,nxp.com,nvidia.com,synopsys.com,mailbox.org,freeshell.de,linaro.org,socionext.com,phytec.de,valla.it,mntre.com,nabladev.com,prodrive-technologies.com,altera.com,proton.me,googlemail.com,phytium.com.cn,posteo.net,amarulasolutions.com,openbsd.org,forissier.org,mediatek.com,bootlin.com,kontron.de,norik.com,cortina-access.com,nigauri.org,prevas.dk,vrull.eu,amd.com,analog.com,andestech.com,timesys.com,chromium.org,csgraf.de,gdsys.cc,gmx.de,quicinc.com,foss.arm.com,ew.tq-group.com,cherry.de,collabora.com,konsulko.com,wytron.com.tw,at.abb.com,gerhold.net,kwiboo.se,ni.com,marvell.com,intel.com,ziyao.cc,siemens.com,oss.qualcomm.com,baylibre.com,renesas.com,epam.com,mentallysanemainliners.org,ronetix.at,engicam.com,kococonnector.com,blueri.se,postmarke
 tos.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,nxp.com:mid,nxp.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 6AB71D7F65
X-Rspamd-Action: no action

From: Peng Fan <peng.fan@nxp.com>

sprintf is used in this file, so include header vsprintf.h.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 common/cli_hush.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/common/cli_hush.c b/common/cli_hush.c
index 7bd6943d3ed65bb24c709af0b195825a26d65f39..fb087960c9206b1e7fe4454bae53f6bc1cec1bdf 100644
--- a/common/cli_hush.c
+++ b/common/cli_hush.c
@@ -83,6 +83,7 @@
 #include <cli.h>
 #include <cli_hush.h>
 #include <command.h>        /* find_cmd */
+#include <vsprintf.h>
 #include <asm/global_data.h>
 #endif
 #ifndef __U_BOOT__

-- 
2.37.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
