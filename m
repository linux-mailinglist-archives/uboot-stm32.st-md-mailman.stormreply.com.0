Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA29645771
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 11:19:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1146CC65E69;
	Wed,  7 Dec 2022 10:19:55 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2071.outbound.protection.outlook.com [40.107.14.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F511C65E5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 10:19:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3U6TlcKG6I+0YsVRLUuEPzZu2YFBPsCHfSyVgjrrEOw+btIcxpGQpSjSsAixTqSzlAKIfxn1RaeL2C40H+UWOOp28fTdLoYegXU2mtOGRTqpeXaWuJCT5q0y+vrSC1VT1fLlX/bmxp7+9cJ75Gv5HG5Gg85/LmvAER9jKNvgUMjmHcPrJO0U2VC4pdzqnyxTlJaIiHxovn9TeFLNqbjyd6pDnFK6wKh7s8+IGG6m1gVYX+MXU1/wR1VdE4etE+A/1/uh7A05WLzb15AGyCiA5CcleNFeTrJ9ykakaTkpWeD61Xuk7awtMbSRERPyTebbu7PUgK4sh2gck/uf3tmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vClzwrIdno0tCVUYsC948kiPc8AspiL3AC351CnGcxg=;
 b=mRdY4mpcwUJe0GDd7LMX8EEuPXQjG5p39kZO6btOTR4e2KQq8UFwlXZ97cOpyCvk4QrVr4snwKq5x48IRRcal4RXsZJ1+5d/J0/qYx9fV10hOkXAiggELfW9OF5Jsn1tWaSSsBPQQj0CydtHxNyoQYvhNVPKCPm+KHoIpNmfGGPnJLxCV0NenyZ6Q5GH05Z9zkdHd/EaCIE/UwYTe4X0qV4fXcgGe9WPBWqROiEDzwwCnNvGFcpl86lS4wsWYFRBrijcxLIc+0A8aWo3FrttGxKTaLrTqoqvJqfSez7kUk8j5dHraL8Xe8SgN1tIeI2zBYSoYeacIrudVr3DVQlHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vClzwrIdno0tCVUYsC948kiPc8AspiL3AC351CnGcxg=;
 b=bS2JW1qVrQO+/D9A529FsaahnIZ9Dq02uhszhaDwfNHTjNziJR5k2wn7aoFbRHm2X4QFVPrIim1no/BxDGjbYrfB8F9HyVDnJWXzOedNqAuXvmIa4ZPI/Qovegj+zT9F7kEiR+vUpBg9hFcBIjMRTmRHpUMLGi6B+dXAXAs8u9UqaEmH7lccdsE6bvhdtOQuAjfTi9XM5qji+WNNkn97tr7d5BdBOc2uhwOZVTOJ6BduJ9vQxWLTPviI81oRLkBesU4al7AbOV8GXrc/xC2ADM7G+QsYUYhe2xjUS7TOpvjg/V6cyamEyoVbS4gAOqJEFstzcwI+WtaZhN+eNfDKqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB8PR04MB7177.eurprd04.prod.outlook.com (2603:10a6:10:127::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Wed, 7 Dec
 2022 10:19:51 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:19:50 +0000
Message-ID: <f9bb49c1-df40-a4e8-9250-65aebfb826c4@theobroma-systems.com>
Date: Wed, 7 Dec 2022 11:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20221106224011.606743-1-sjg@chromium.org>
 <CAPnjgZ0U=pwxYiPNJddn9Zs_UXrChuvoc7wDVJ_XyU2Z52pB_Q@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CAPnjgZ0U=pwxYiPNJddn9Zs_UXrChuvoc7wDVJ_XyU2Z52pB_Q@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB8PR04MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: beda012e-8b98-4eae-092a-08dad83c931b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TP3/fCp6krQxoR+lGpAaqS+kBtzUi5XwlkwUIpcQD9nQXPYUwOxYsKNl2aONK3M3B+72VvmkdprVh/l949toLOmKO/B8gb6l+P2el4/eQr/DoKt/BcvWSSII3xj2Vhk+07f683bkk5gTtSnJKdWRWC+kDkONG1yXag8cJSMnwTS7CwMNmKnckc/S2u5UtlmcwSGKtiRWCn8NbseYdMCEaJ9dFoEwgcR7y7CVKWq1Hr4bd+QzjNpsnVIt8ouL1jmTXRHgcMZR61CpU5g1I4LtSURHquFlnI2u5/tKZ7NEOhS5mitpv56hFGT+ktG5DKbXSBZkx9gHXOuTehF5JKqPYHY+mxbSmT+UR6rmJ1/F6QasPmG1mn1LG6z8OwZIcmQndix+71DTooD60POYZbqb15OrMsfXHYtfX8iIcqDdrOIbpPrFg0l9136SHTrFobobRzcfplFVZqa0DMzm6rq4r4ytZrYiLnXsPfVSLVw0hEx2S3BcnJfyz6twAu8BycZ+wWjE6zAa3pbl2f8jmLReDq09nD4uG4UzFJj1bkXQnSQt1lwvsMJHMpRbOh2K1pyxiJbODokS1GaiEKHyNJKHYl9of1p6w9L976o2osIY/gWtMD8YrWD2iHNEEBxSK582Zgw6QGjALdJ/qdEarQIV8p7XR8Kszx4yO93JRqWq7F619CwpdHmXM+jT4xQEsoiwfomXoiSOKp7K30TTeYCOsw+00K39pu/NAdmEbxnC1O33Rz+xz4aPgmCR2wMhIApbRMDURYiM7O0TJ56Oy+l0QbbxKG4F6kNvrTVnTgNuzQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(451199015)(38100700002)(36756003)(31686004)(86362001)(41300700001)(8936002)(2906002)(7366002)(44832011)(5660300002)(7406005)(31696002)(4326008)(478600001)(6486002)(316002)(66476007)(110136005)(66946007)(2616005)(66556008)(7416002)(8676002)(54906003)(53546011)(966005)(6666004)(26005)(6512007)(186003)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmpNc0VRNkkycHRxdkZKTWRRcnMrMHgwYitoVW1EV0FFWkY5VE1yL01HS01n?=
 =?utf-8?B?MFFiekRUSENkSnp0WXNFRDQ3SlNVSGgrazVhWllkTTEyY1IzL2V5U1owU21S?=
 =?utf-8?B?a1JwbjhodzNFRDdLN3loVFRTeGdYN3d0c2dPQ2tqNzNmblpBMWp6MTBGeFZh?=
 =?utf-8?B?U3l5dWFLV09jYlkwUGJUUDZ3YzRiN3hDOGhwMUdoN1VROHI3emdnQWFhbFlS?=
 =?utf-8?B?ZXcrWTFFc0NiVTdEZko3YVZaaFdiUlF6NExIcEhLUDJYWGdkdkJPYWxWcmFR?=
 =?utf-8?B?enJvM0JKMXozdlhFMCtCSVVBNEhBVm5QMThRMTR0MWxyTEVZWkVmZVlZazhS?=
 =?utf-8?B?b0tqRHdtbjRTc0JhUDdpMC9MWktyU1RydU9JdkFyZWxJYm94ZlpMRkJVRmo5?=
 =?utf-8?B?alBxb3huMHhadTg2Y2pBM3p0Z2xlMHNydmZOTzVkM0wxMDFvdHVrZ3VPUEQ1?=
 =?utf-8?B?ZjVmb09JT0ZtY0diems2TzZ5YjlvWkJjNWRLVnQxdVlXQTdjSzRmbVpXcUNx?=
 =?utf-8?B?clUwd2FwOVFvLzN0b2JHcHF1Ym5Fcm8zQkdhQlB1cnlZRFh3RFFKSG1qWStm?=
 =?utf-8?B?UVlFbmtWWmdHN3JWTGVjRjZ5NWU5N2tJWlg2UmNjQk9hWCsvQkZVSktrMFJk?=
 =?utf-8?B?N3g2eVBuem5zMkQ5MHZMcDhicVZqZWFHUHBiRG5KL0dGeW1XSUNqV2dWNC9z?=
 =?utf-8?B?VWZTN2MvM3R6SVdPbXFZeDE0OWl4T3dpQlQrTDVWdUhpMnlDZHNSZVZzRVNU?=
 =?utf-8?B?TmxJTGY1OGdNbitsUzRSYnBDcTBhMnJZdnlnd1Q3RHNLWi9FT0lYL1RsUUhk?=
 =?utf-8?B?QS9Gbk5qbjhxcXZOUEpWenhMWjZEZXQ5Yi8xU3hQMHRXM05SbFU0dlhOcjFG?=
 =?utf-8?B?TGVOTHRmcFlEWEZ2TW1PdGZCa091Q0dSdnlJYkJTZEFPd28zdit6VlVQVnk5?=
 =?utf-8?B?V2krVHRjaW9LNldFNXFkak40M2NqTVlCQ1FVOUJLdUZxWmdDTk03eXNuQ0FP?=
 =?utf-8?B?VUZIYVk3dEd4RFNTcnpRcXM1OENHMCtCeHMzMzF3SCtPd2ExUS93NTc1TXUv?=
 =?utf-8?B?SEV0WVpvSjhNWWpxanRiNE44b2hrc2JsUjdOdm81eUI4QWlZOUxPQU5CelBx?=
 =?utf-8?B?NkQySFFlc3p6L0FYR2dmMFVjZ3NzdWVNQzJUbWVjbElNeFA2SVVHOVcrc3Vr?=
 =?utf-8?B?ZVVwc2xkaVFIc0NJS0dMU0dvVUVuTWp0SGRJczVWYU9TTk9KblhUeS9pcWh6?=
 =?utf-8?B?cG5CZkxsMUxRdkFCNjY2QkxRNzA4WkFhQ05nZDh0VWFZeGlFUDRHWG1nazg1?=
 =?utf-8?B?MmM3K2RoOEw4UmNtalQ5YnJDTmNGekQwc2RLUzBPSGQrUDhEd2cxTkdXdDZJ?=
 =?utf-8?B?YzVEeTY4dzQ5MU9heldaQml0NWYwSVhyMDFLNHRLTzE0VXcwcWJWbTFkYWl1?=
 =?utf-8?B?ZWdnbEE4c1EzaGpjcEplZzZaYVdEdG5nUFA2SnM0WUFDbWlscWVYc2ZvcWxF?=
 =?utf-8?B?RjMrcDZIRXgxZTFrMi9XOHRtbU51SXdqT3hjU0JVdEpnMzJhQUl4S0dFYUx6?=
 =?utf-8?B?R0dPYXBwcHdmZjhtM2Fha3BmbDBhSmhmQm5jbkcxZS9vMXJpd3NDWHhBVHo0?=
 =?utf-8?B?ZHA4M3JVdExiZkErYkhKY2Vralo5T3ZiRElONmpJQTdiMVBvemV0cWRyelNS?=
 =?utf-8?B?K2htcHJweDdIZ2NqODFUdVdMVDB5OWxnQUNBL3NUU2dtZHFHMGJPMGhpRnNs?=
 =?utf-8?B?MmFqNEZYZElkZ2s1TXE1YS9hTjZHVE1Felo3YjBVdGUxNmN0ZXJaQmNZRkFn?=
 =?utf-8?B?ZnljVTc5T0ZHcnJWdEsxTVp1cDZkS1UvMUlObENBZlNUK2N0aHJjZDkvNXVa?=
 =?utf-8?B?SDNzWG1DSmd1TnB1NWFSendmRE4vYU1rSnpaL0dra29UVTlHU0sxcDMzRTFu?=
 =?utf-8?B?QUhOSmNXaVo2dU16MEJMYkxxWXNGM0xwTFBMa2YxMzBSMFBGS2NzNGFTUnNE?=
 =?utf-8?B?QjFKR3E5dHdsRy9weG1zbi82QlhWVnRJNXFNeHlOeDNDdE1LUmxiMjZJMmRV?=
 =?utf-8?B?bUo4ekYzMTZxcXlRTUI4UDRsNDhSaUhBTERwMXV5eWVOVTNXaXByWmFoU3pF?=
 =?utf-8?B?cmRjbGZhZDU4UVErWHp6K1A3NGYxY3RVMGJjYUF1QjYyN0dmK29SeGtmS3Jl?=
 =?utf-8?Q?4+xoAZ4O9WkMelGPDUIjCyI=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beda012e-8b98-4eae-092a-08dad83c931b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:19:50.7143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ow6a9hahprs0hDjGvYO/9PnekpXLa1zrNKdpUETTbYY5x8VSvN6uNKJix098KklhUJ2rDtoaC0LYCUjtp3W8JURn3TMiPSKHzwJk9y8J7F2cIWIggK6mNGxisLqPsjn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7177
Cc: Peng Fan <peng.fan@nxp.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Angus Ainslie <angus@akkea.ca>,
 Kever Yang <kever.yang@rock-chips.com>, Chin-Liang See <clsee@altera.com>,
 Ivan Mikhaylov <ivan.mikhaylov@siemens.com>,
 Teresa Remmet <t.remmet@phytec.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Olaf Mandel <o.mandel@menlosystems.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, Tom Rini <trini@konsulko.com>,
 Chee Tien Fong <tien.fong.chee@intel.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, kernel@puri.sm,
 Mingkai Hu <mingkai.hu@nxp.com>, Le Jin <le.jin@siemens.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marco Franchi <marcofrk@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Ilko Iliev <iliev@ronetix.at>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Matteo Lisi <matteo.lisi@engicam.com>, Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Adam Ford <aford173@gmail.com>,
 Alifer Moraes <alifer.wsdm@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 huang lin <hl@rock-chips.com>, Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Lukasz Majewski <lukma@denx.de>, "Andrew F. Davis" <afd@ti.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Peter Geis <pgwipeout@gmail.com>,
 Luca Ceresoli <luca@lucaceresoli.net>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v4 0/7] binman: rockchip: Migrate from
 rockchip SPL_FIT_GENERATOR script
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

Hi Simon,

On 12/7/22 02:08, Simon Glass wrote:
> Hi Kevar,
> 
> On Mon, 7 Nov 2022 at 11:40, Simon Glass <sjg@chromium.org> wrote:
>>
>> At present rockchip 64-bit boards make use of a FIT-generator script
>> written in Python. The script supports splitting an ELF file into several
>> 'loadable' nodes in the FIT. Binman does not current support this feature.
>>
>> This series adds binman support for ELF splitting. This works by adding a
>> new 'fit,operation' property to the FIT subnodes, allowing this new way of
>> generating nodes.
>>
>> Some other fixes and improvements are needed along the way.
>>
>> A new, common binman description is added for 64-bit boards which includes
>> the required u-boot.itb file.
>>
>> The existing script is removed, so that only a few zynq boards are now
>> using a SPL_FIT_GENERATOR script:
>>
>>     avnet_ultrazedev_cc_v1_0_ultrazedev_som_v1_0
>>     xilinx_zynqmp_virt
>>
>> Migration of those is hopefully in progress.
>>
>> Note however that tools/k3_fit_atf.sh remains, used by a few boards that
>> enable CONFIG_TI_SECURE_DEVICE so this series is copied there too:
>>
>>      am335x_hs_evm
>>      am335x_hs_evm_uart
>>      am43xx_hs_evm
>>      am57xx_hs_evm
>>      am57xx_hs_evm_usb
>>      am65x_hs_evm_a53
>>      am65x_hs_evm_r5
>>      dra7xx_hs_evm
>>      dra7xx_hs_evm_usb
>>      j721e_hs_evm_a72
>>      j721e_hs_evm_r5
>>      k2e_hs_evm
>>      k2g_hs_evm
>>      k2hk_hs_evm
>>      k2l_hs_evm
>>
>> Ivan Mikhaylov has sent a patch to help with these, but I need to take a
>> look at the testing side. In any case they should really be using binman
>> for the image generation.
>>
>> Changes in v4:
>> - Add new patch to disable USE_SPL_FIT_GENERATOR by default
>>
>> Changes in v3:
>> - Add an offset to the FIT description
>> - Add support for writing sections in binman
>> - Rebase to master
>>
>> Changes in v2:
>> - Rename op-tee to tee-os
>> - Drop use of .itb2
>> - Drop patches previously applied
>> - Add various suggestions from Alper Nebi Yasak
>> - Add patches to refactor binman's FIT support
>>
>> Simon Glass (7):
>>    binman: Allow writing section contents to a file
>>    rockchip: evb-rk3288: Drop raw-image support
>>    rockchip: Include binman script in 64-bit boards
>>    rockchip: Support building the all output files in binman
>>    rockchip: Convert all boards to use binman
>>    rockchip: Drop the FIT generator script
>>    treewide: Disable USE_SPL_FIT_GENERATOR by default
>>
> 
> Can this one please be applied in time for the release?
> 

You still have review/questions left unanswered/unaddressed:
https://lore.kernel.org/u-boot/a29f8d62-c7be-60e7-8a79-b52f589a93e7@linaro.org/
https://lore.kernel.org/u-boot/67717a66-13d5-a72c-a34c-fac191a238ad@theobroma-systems.com/
https://lore.kernel.org/u-boot/67717a66-13d5-a72c-a34c-fac191a238ad@theobroma-systems.com/

Cheers,
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
