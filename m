Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F74BDC21C
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Oct 2025 04:18:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23532C56615;
	Wed, 15 Oct 2025 02:18:15 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17619C56613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 02:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaR43fxfOXE9ZJ7+GL3REAYtnK3ve8N96dQVefNsMF729nMeDC5F5NpoVWmO+fLzo3P7jGCBzBQvo4unEsh/VXe1MPrn4O48cbKLDzVTrplzyJo67JurTUBdUNljPT8hs+Ob84yBBzrLHGe6pKw+Wy03FcvTZT+k2uuezU0f1RsTshwYaJWLK6Z10EVF68qUrH+KjlQq2Lje02HdtOYHkkiPKARzvbVMjpnylWUM3ztbkvSOtzmxPKdRrABbaDeBDmHKg1OQC6cK7b5czXWXecagqZGm5zY60sGx3mWJTWmJSRFl5TEDcXPP7rcrysaQB6SGWDH4tLpmwV8WMqJ0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzJHWNMo5SG2bu1IaIRSkCFPK8YlrTEk1DZprxrgxAM=;
 b=suxcNb37wl1Eim3OP+HUdMYm1GbhovfCOmiH30dteKuQHw/0cCsF/9DyptrAmhbfGacHdx+Fru6CzrhEHGZG/SWI4OVsEX8u0pXIdcoluf/pDdxyGIfr/LQP1hO0hEOzSEmtby0dqzFOunUVopwUEkbzAhuKK9yyEWw68gDY8/y6iFFZvnSeQJ7h60+FRpierAYz7HmibBg9nF+9pXGFAMipVyDoyYF/cajAqNdZexeqGtXON+ZpWEiiuTBDEGiHBCNBpzUOzkZ5/udxUqQFHJOt4XK5t/Khpq4LK4STXl7HEmJquvgqOVszkN5wuaIvxZ/9OAFdiLdmqooNc3XBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzJHWNMo5SG2bu1IaIRSkCFPK8YlrTEk1DZprxrgxAM=;
 b=fACmn+T3ri9BjjArTmQN4SKrrGO7HUTTYL9SVUL+1wBH4QkWq0VQ2/AlmVgOJEdSabUxN6DlRcuQ13Q6MLHMQCc89NZVf6M7V9yDHwVV1zz7yPrGu6NZ9iOE1s5U7Q0kJu+xdKSYXx7xKAggoAu3aeEjHDReProp/MS9ASoki9xCbV1j3rGCb/thVr4SH+WT0xfQMUMBy0+hqfCj3oQP+30k+F6J7fqPxF5CvMHA3qVCOE/pXNth17/m1HL8iywI+1v/RkbEkL7bH911ZZorv0+PjLkZuyykS3dnvkqHmNOu6oqZ7V0HcK8Nlkq+fpCnJeVD4sWbhlDk28d+bqr1jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 02:18:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 02:18:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Oct 2025 11:30:25 +0800
Message-Id: <20251015-imx-rproc-v2-0-26c6b3d16c35@nxp.com>
X-B4-Tracking: v=1; b=H4sIAFIV72gC/03MSwrCMBSF4a2UOzaSh6XiyH1IB2ke9g6ahBsJk
 ZK9GwuCw/9w+HbIjtBluA07kCuYMYYe8jSAWXV4Ooa2N0guR8GFZLhVRomiYeqq7DKN0ig/Qf8
 nch7rYT3m3ivmV6T3QRfxXX+K+lOKYJz55aK08toby++hprOJG8yttQ/dluy8oAAAAA==
X-Change-ID: 20251012-imx-rproc-383db752c3f7
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com, 
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, 
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd5abb4-636a-4001-7306-08de0b91162e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEtPTDgrRFp4aWRET1M4cEJGQXIyazFkR1hpMmZKR1N0VHRaVlErdE1YenVh?=
 =?utf-8?B?NVUvZ0Q3allkd3o1L2h0OWlJWFVYcUp3YzdscG1hNDNDNURVd3dRZGtadW0w?=
 =?utf-8?B?UnVPSUFVTWZFQzNyMERtOXJqOHZIdkQ0Y3NYWVd1Nk1vNEpDdFludzVnREFp?=
 =?utf-8?B?Q1hIWlczeXFrSnoybnVyS2ozc1M1amQ2UkdJTDVBWTl0MVVucVAzemdRVExL?=
 =?utf-8?B?TytVUExmTW5ld055YTNHSGlMbGQ0NjUzR05aSW42YWxNRTRrTU5UWTJlREQ5?=
 =?utf-8?B?WlJsSjVBS2J4a2hyckVRRDRMOHVjSlMzdW5pUXgzaHFiNHl1ZkRzbTJ0RE5s?=
 =?utf-8?B?NlN4VWp0ZU54NTZCOCs0RHc3d2M3WWYwWU5nb0x0ZmlMMzRSTWltTjVTZDRD?=
 =?utf-8?B?aUtGaWhiMEN1elcxc2dVUzlYMm10elo0eG1PSHZOZi9YTHBoNzRMSlc5d0h1?=
 =?utf-8?B?UXRzOG80TUNCUnBtdWdvZXAwRWtTRGpMYnBkVW1sZzFBM0w1Z1k0MFhqU2Mw?=
 =?utf-8?B?cGJMNndHMzNwd20wUFZlSGxPZWY0RHJNSko4d1Q3dmtNNWpvakh6cjR2TjZq?=
 =?utf-8?B?NThiQ2I5S0RQVVA4dHYzeVRScDFzY3YrU3BwSGtmelNoQ1QvMTJ5MEhGWnFG?=
 =?utf-8?B?YktDenpQN3ZaUVhlZlo5SG5yVVRYTjkwVmM2TFdlRFdtMmJqK3FiLy9nODF1?=
 =?utf-8?B?SjY3b1B1RlhKdG4vakpvQ1R5Z1IvdnJ4NDQvclYvL3c0dWl1SEJsbmt3NExB?=
 =?utf-8?B?TEo5NWJCa3RiWE9DbXJjM0M4eTE4U3N3Qy8yc3h0YjJRTmx1NXZ2V0N1RGta?=
 =?utf-8?B?MkFJTUdQRWVFeURhbEYrMU1WZ0dGVDNhY0toK0FCZmRZcTJZRmllRnIzVDQv?=
 =?utf-8?B?Zi80V1pLTjN6N0VEQStGTWMrT1ZaaU81T25lR0dPekNjNE9HL0ZpaDlhVVpk?=
 =?utf-8?B?akVQZVRSUUF1LzNvRzNjUVRMV1hIWXNTQm9DbUxVSWV1d3pzdnowMEU3QlhX?=
 =?utf-8?B?bTZRUzVGemNkb2Zsemc4OVNVV2gxNDBlMi9PeFBUejJkYWR3VEMvbXVRejk1?=
 =?utf-8?B?T3FqbWk3VGU5WVNYcDhObUNOMEJDU3dCZmNsWFUydTN3MlA2Ynp0bFBGNkFw?=
 =?utf-8?B?SDNnb3FDQm5MOFl2ekUrNlVaUzMzU0NJZnU1NENMTXRrNFY3QlRLRWVyY0JS?=
 =?utf-8?B?RXV2YW9wVVlBRlFTME45MUY0b1UwN1FaUXJjaHo1RWF6d3lhUHoydDA3ZW5P?=
 =?utf-8?B?enNHLzMyeXlCcHBFaGtIS1FoSTZXeXE3Ri9CUGoxTDRFTDZHWUMzRVNRNTIx?=
 =?utf-8?B?NDNic2VtaE1mUGxaMTgySVM4QnBiSVhGNW1WcFJTS1VvWks5ZGpOYm9haGVQ?=
 =?utf-8?B?U09UcnZXVkxrUitWV2hXR0d5RkplODRUemlhRzN3N1JCNUdjTVV2VjZ4bUpR?=
 =?utf-8?B?YjN2MlFTcnNWY3dvNEtnYndDZEhlSGxURDNlRUN3WVFrdHg0cWJrejQxRVdQ?=
 =?utf-8?B?b2grOTgyTW8wSmxOQTF6Sks1RHNYb1RTZGZiMWJzSml4eHM1bXdGVFpaY1Zz?=
 =?utf-8?B?QkdXY3BmT0VsOHZROHpWWlYwQ0YySUJJQS8yNGxsa0x3ejRhaW9yZW5OWUpv?=
 =?utf-8?B?MTVPcVBQR2tpZGRMNXdmT3N2SC9STXdYS2s0WHFYRmlaUjBHQ1VUVDNCK3M4?=
 =?utf-8?B?aFpaQU5SWk0xMysvbGxjWmRrZm45WlNoVWloR1FGZXFsZ25YZThOck43Wm1n?=
 =?utf-8?B?bnZjaTBHOTdBN1pLWXViODJDSzM1YlUxeGVHalFDd3hGTzRFcGpVQlUrWUgx?=
 =?utf-8?B?TlhqN0kvc3c4Y2dxU3ZOUUE1WmNteHAvazJmRnZTUGxpM0RnbFA1dWYwcjdC?=
 =?utf-8?B?TmZ6cU01c0pBQjdkNWd0bXg1a2RWU0NBK2pqTDRoZC9HVEFqcjJqZk5pcGRw?=
 =?utf-8?B?SUoyOXJpaTNyNThXdVpGTWQxeklqTlVkWnlhY0dPRHZKNlNmNlV0TklPNzlr?=
 =?utf-8?B?V1dqemc0L2hjcTBxc2NaSjFvTGhmTFMzbVIyYnlqUFMxbmJWNFJ2L1RiT0lW?=
 =?utf-8?Q?tVptuw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXRlZ0xtNVdjU3BYRHF2dG04U2FsMlFDUmxnNGVSb3liRTRBTWZWNVZ5ZkJk?=
 =?utf-8?B?THp4VnBBTktRS0pOWXI4eGYwdmErcFpOTldtcC9lVFltTGVnYTBWYXQxRTZP?=
 =?utf-8?B?a2hlWURwQ3hvd281U1RaaHhHWUpkdHB6YWpJekZhOG40eUc1WjMvWlhUdFI0?=
 =?utf-8?B?Q2V1SHJidys4bW9BNDRnY2lvdTcySEU2dDdBR2RIQkFjelFhOGpQdDAxSDdX?=
 =?utf-8?B?SXJFSDNJdjZHMlYyK3pVWEgwRlBVbU9ad3N4ZlpGZnlQclo4Q09HYWhIQkJK?=
 =?utf-8?B?WHQvb1lFcmZWUzBQb1pJWktlQm94clkzeHBYR0FEYU0xaDhLejU5cXY0amNw?=
 =?utf-8?B?N1pPZU52ZjZnS1ZNdzM3VUd2enVqSlc3dXJ3aWl1L2dlUGcwMFgvaVFXYk9H?=
 =?utf-8?B?QmlaenFtcXNOZkVwL0h0Zy82bDEvNFZJckdMWk1DUTMyL3JNMlZMbE9YK3lm?=
 =?utf-8?B?RlRqY045NkNCUnc0dmEybjA3ei9PU3ZjYllMSEhkUmpJbUpURjhjQWhBOEVB?=
 =?utf-8?B?Z3dzWW8yWmdlVHhoSERiWUpvbUxuR2ZtRFNuUmhJSVhnSlpFWm4xZUNBQ1No?=
 =?utf-8?B?VndEK1EwYWo4SVBUaUhqRytubzgxRDJpcXc5cWVnOVI1L2tWYnloQ0hqVWRE?=
 =?utf-8?B?UnhocVMwbWtuaXlIUjEyQk4vb081bktFa0xjdnNKVkN0RTl2T1ZVRTVuUTZ1?=
 =?utf-8?B?UWl4cGd6NC81QVRzR2RGK3NNMEZOS0hqOUkrTVVsRW1zaXIybGIxeU1CR2xO?=
 =?utf-8?B?c3lRM1lLMi9wbGErRlNsemFRb1czZ2NqRVlYKzByVTJFbnpkek4zNVE5VUdy?=
 =?utf-8?B?aXFFSTU0ZGlueFc2bzBrbk1RK3ZQRDJyUTlqRFY5ZTltWXRtZ0NhMEh6TFhP?=
 =?utf-8?B?WkZueEpGNE5Fd3lYb0E4TUt0UWs2Nkxua0tCMkJqMnA4NUNJeGgvR1R2U1FV?=
 =?utf-8?B?a1ZLb1ZQRzNoUFlYaE5ycnMxWnFuamV1dG0wejd0TUpQRnJWL3J4MHpOWWs4?=
 =?utf-8?B?eGRwUFZ4enh5K0E1dHFHcFNicDFld1Y3TWhxcVkrQ1hkcHpBRHNmMnRjVEhP?=
 =?utf-8?B?NVlKUm93UE9hcmlmaHpRR21sdy8yYXFRVkNsb1pId1ZHeW9CUzBUd2lQeWl1?=
 =?utf-8?B?NTZBV1FzTXRzTlVueG5nMFh2QWRXR2JabGFUQnczeENPMitvZmxiMFBWekpQ?=
 =?utf-8?B?MEJpS1RYZi9ZTmtsRTgrRjNZYVRReTN4aERNYU1GN2psUFNkMmR0VUQ2dU5L?=
 =?utf-8?B?RndvNXZIVE5CSDZkZExOamVkak83MTVPV094SVY5ZWwrbWd2WGVGRXFVUm91?=
 =?utf-8?B?R1JodWVHT0tiL2JvN1A3OFdOSXhKdmtnL0UzNFUyWS9mZzFCd2NUakw2Um1E?=
 =?utf-8?B?TVdRSVNiU05uOEhUNE9hc3VzVWhyUjV6bWR0Q2F6SjVUc0Z0TngyekNuYnFO?=
 =?utf-8?B?cHF4aDVPalpTNkdVSzg5RnNLaGNzNHJYbGV6eHFtNERMZ2o4cnJ1SkhhNjVn?=
 =?utf-8?B?UWRDRjVRTkJ4OXk1NWlMaUlRT2RHSlVOQUswcUpRY1prZTNnNVFqQnlXODQ0?=
 =?utf-8?B?L3Q3Ry9wSVlJM0ZRRHNmS3NrQkVHaWRmSVdzbW8rTFBsY1pBRjc1YnRTY0tt?=
 =?utf-8?B?R0w2N2Vnbm1qNFdqRzFVbDlGZGRIclhlR1FMWnBIL1VTbzVPeVRLRXFzNVF3?=
 =?utf-8?B?TFFITkRDSWNJVzdmZ1VyeXNQOWNIUE1QZlBrWmkrbU1iT0ExcXZTMEJBM00y?=
 =?utf-8?B?RCtVN3crd215U1lvTnpkeEJlckxSQW96MERBek1ubk9pNHNUYXgycU1JclVk?=
 =?utf-8?B?WlJxU09oeEtqOGtlcC83d3hGTTEwN0liUzJSM2ZVaDZJNDhJb0FKWHFwN01K?=
 =?utf-8?B?cVhhaVFDRlJ0MUNzOFliYVB5b25QVlg1SVZqUURMOENIckpLNnJ3Zk5CeVU5?=
 =?utf-8?B?VmhhWHdMUng1WmQyNmdvbGluVlhaYVUxVmJpT3VCRHBiS2RZejR3K0krV2Fk?=
 =?utf-8?B?S2lkanlpT25wdDQvQnZ3SHozUzBONzA0bGgyc0hoVDlUZldjdTFJMjJGdmZp?=
 =?utf-8?B?NUljVmtVQ01Va0dSRnRZVkp1am9mN0xJUEhvSjd5RzUwd0xEcVNmZldZSzNE?=
 =?utf-8?Q?B3NVjB+uNP16rqjf5PamaEcSk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd5abb4-636a-4001-7306-08de0b91162e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:18:10.5360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btmlM1ikpyT7AAtk3RRqfAVaTuqUu7qyMMxI+H4LFNnaR9K2/e9zONX6dARSHkpoI9N8ny3eY1h6lM0jctMtiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9444
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Udit Kumar <u-kumar1@ti.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andrew Davis <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ryan Eatmon <reatmon@ti.com>, Hari Nagalla <hnagalla@ti.com>
Subject: [Uboot-stm32] [PATCH v2 00/10] remoteproc: Add support for
 i.MX8M[M/N/P/Q] and i.MX93
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

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyByZW1vdGVwcm9jIHN1cHBvcnQgZm9yIE5YUCBp
Lk1YOE0gYW5kIGkuTVg5MwpwbGF0Zm9ybXMuIE1vc3Qgb2YgdGhlIGkuTVgtc3BlY2lmaWMgbG9n
aWMgaXMgcG9ydGVkIGZyb20gdGhlIExpbnV4IGtlcm5lbCB0bwplbnN1cmUgY29tcGF0aWJpbGl0
eSBhbmQgbWFpbnRhaW5hYmlsaXR5LgoKVGhlIGV4aXN0aW5nIGJvb3RhdXggY29tbWFuZCBpbiBV
LUJvb3Qgb25seSBzdXBwb3J0cyBsb2FkaW5nIHJhdyBiaW5hcnkgaW1hZ2VzLgpIb3dldmVyLCB0
aGlzIGFwcHJvYWNoIGZhaWxzIHdoZW4gdGhlIHJlbW90ZSBwcm9jZXNzb3IgZmlybXdhcmUgY29u
dGFpbnMKc2VjdGlvbnMgdGhhdCBtdXN0IGJlIGxvYWRlZCBpbnRvIGJvdGggVENNIGFuZCBERFIu
IFRvIGFkZHJlc3MgdGhpcyBsaW1pdGF0aW9uLApuZWVkIHRvIHVzZSByZW1vdGVwcm9jIGZyYW1l
d29yayBFTEYgbG9hZGVyLCBlbmFibGluZyBwcm9wZXIgbG9hZGluZyBvZgpzZWdtZW50ZWQgZmly
bXdhcmUgaW1hZ2VzLgoKUGF0Y2ggU3VtbWFyeToKClBhdGNoZXMgMeKAkzI6IEltcG9ydCBtZW1j
cHlfaW8gYW5kIG1lbXNldF9pbyBmcm9tIHRoZSBMaW51eCBrZXJuZWwgYW5kIGVuYWJsZQogICAg
ICAgICAgICAgdGhlbSBpbiB0aGUgcmVtb3RlcHJvYyBzdWJzeXN0ZW0uClBhdGNoZXMgM+KAkzEx
OiBBZGQgcGxhdGZvcm0tc3BlY2lmaWMgcmVtb3RlcHJvYyBzdXBwb3J0IGZvciBpLk1YOE0gYW5k
IGkuTVg5My4KUGF0Y2ggNjogVGVtcG9yYXJpbHkgYWRkcyBDb3J0ZXgtTSBub2RlcyB0byB4LXUt
Ym9vdC5kdHNpIHNpbmNlIHRoZXkgYXJlIG5vdAogICAgICAgICB5ZXQgYXZhaWxhYmxlIGluIHRo
ZSB1cHN0cmVhbSBMaW51eCBkZXZpY2UgdHJlZS4gVGhlc2Ugbm9kZXMgY2FuIGJlCgkgcmVtb3Zl
ZCBvbmNlIHRoZXkgYXJlIG1lcmdlZCB1cHN0cmVhbS4KCk5YUCBpbnRlcm5hbCBSLWIgdGFncyBh
cmUga2VwdCwgYmVjYXVzZSB0aGUgcGF0Y2hlcyBhcmUgZGlyZWN0bHkKY2hlcnJ5LXBpY2tlZCBm
cm9tIE5YUCBMVFMgdHJlZS4KClNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBEcm9wIHBhdGNoIDEgaW1wb3J0IG1lbWNweV9mcm9t
aW8gd2hpY2ggaXMgbm90IHJlZHVuZGFudAotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNTEwMTMtaW14LXJwcm9jLXYxLTAtZmI0M2EzZmFmY2QwQG54cC5jb20KCi0t
LQpQZW5nIEZhbiAoMTApOgogICAgICByZW1vdGVwcm9jOiBFeHRlbmQgZGV2aWNlX3RvX3ZpcnQg
d2l0aCBhIGlzX2lvbWVtIHBhcmFtZXRlcgogICAgICByZW1vdGVwcm9jOiBBZGQgaW14X3Jwcm9j
IGRyaXZlciB0byBzdXBwb3J0IE5YUCBpLk1YOE1QL04KICAgICAgcmVtb3RlcHJvYzogaW14X3Jw
cm9jOiBTdXBwb3J0IGkuTVg4TVEvTQogICAgICByZW1vdGVwcm9jOiBpbXhfcnByb2M6IEFkZCBz
dXBwb3J0IGZvciBpLk1YOTMgQ00zMwogICAgICBhcm06IGR0czogaW14OG06IEFkZCByZW1vdGVw
cm9jIG5vZGUKICAgICAgaW14OG1wOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNUCBFVksK
ICAgICAgaW14OG1tOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNTSBFVksKICAgICAgaW14
OG1uOiBFbmFibGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNTiBFVksKICAgICAgaW14OG1xOiBFbmFi
bGUgcmVtb3RlcHJvYyBmb3IgaS5NWDhNUSBFVksKICAgICAgaW14OTM6IEVuYWJsZSByZW1vdGVw
cm9jIGZvciBpLk1YOTMtRVZLL1FTQi9GUkRNCgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMSArCiBhcmNoL2FybS9kdHMvaW14OG1tLXUtYm9vdC5kdHNpICAgICAg
IHwgICA0ICsKIGFyY2gvYXJtL2R0cy9pbXg4bW4tdS1ib290LmR0c2kgICAgICAgfCAgIDQgKwog
YXJjaC9hcm0vZHRzL2lteDhtcC11LWJvb3QuZHRzaSAgICAgICB8ICAgNCArCiBhcmNoL2FybS9k
dHMvaW14OG1xLXUtYm9vdC5kdHNpICAgICAgIHwgICA0ICsKIGFyY2gvYXJtL21hY2gtaW14L2lt
eDhtL0tjb25maWcgICAgICAgfCAgMjAgKysKIGFyY2gvYXJtL21hY2gtaW14L2lteDkvS2NvbmZp
ZyAgICAgICAgfCAgMTIgKysKIGRyaXZlcnMvcmVtb3RlcHJvYy9LY29uZmlnICAgICAgICAgICAg
fCAgIDcgKwogZHJpdmVycy9yZW1vdGVwcm9jL01ha2VmaWxlICAgICAgICAgICB8ICAgMSArCiBk
cml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMgICAgICAgIHwgMzcwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuaCAgICAg
ICAgfCAgNTYgKysrKysKIGRyaXZlcnMvcmVtb3RlcHJvYy9yZW5lc2FzX2FwbXUuYyAgICAgfCAg
IDMgKy0KIGRyaXZlcnMvcmVtb3RlcHJvYy9ycHJvYy1lbGYtbG9hZGVyLmMgfCAgOTMgKysrKysr
LS0tCiBkcml2ZXJzL3JlbW90ZXByb2Mvc2FuZGJveF90ZXN0cHJvYy5jIHwgICAzICstCiBkcml2
ZXJzL3JlbW90ZXByb2Mvc3RtMzJfY29wcm8uYyAgICAgIHwgICAzICstCiBkcml2ZXJzL3JlbW90
ZXByb2MvdGlfazNfZHNwX3Jwcm9jLmMgIHwgICAyICstCiBkcml2ZXJzL3JlbW90ZXByb2MvdGlf
azNfcjVmX3Jwcm9jLmMgIHwgICAyICstCiBpbmNsdWRlL3JlbW90ZXByb2MuaCAgICAgICAgICAg
ICAgICAgIHwgICAzICstCiAxOCBmaWxlcyBjaGFuZ2VkLCA1NTcgaW5zZXJ0aW9ucygrKSwgMzUg
ZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogNDhmMjFlNjZlMzYwNTUyYzc1ZDcwYTUwNDIx
ZDBlMGVkMWY1OWU5MApjaGFuZ2UtaWQ6IDIwMjUxMDEyLWlteC1ycHJvYy0zODNkYjc1MmMzZjcK
CkJlc3QgcmVnYXJkcywKLS0gClBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
