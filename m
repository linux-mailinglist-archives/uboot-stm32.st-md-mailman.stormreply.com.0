Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F3715F3A
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 May 2023 14:27:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5564BC6A608;
	Tue, 30 May 2023 12:27:24 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C026FC65E5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 12:27:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jO51VUREKYoGGUIxKeCbaZU0PIFEWDAAxhaAul82c4LoXA9c1802YN2pIyG5PayFS+UOQfOGWoxnVsHEgaVC+w0XNyt9qnfYG5uQg8NtZyCuvbbMzW/51Y/RuBRRhncOKPpERyGIzOMMBh0dk8wi6l5TKoG4YZQNCd7eQA+w75SP2NcgGL6Ahfkjb/1X1oLU4WhWJbIYIFhq+Xw5cMkUF4FBz+ucBnmQJ0ADyiHdLAPZ9BLaQpd5rOYKTS9TbUigsy6TqXwrIREWu8FIcjy4TyTmxtRPe7DcYpwccdGMRpu6TeXsy6UmZS9cSQseNVniyFDZ/Piwc9BAJaY7H17Jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCncz0py/LySkY/PiQVSGvKP8aJVVusAyVHHBVCnCJ0=;
 b=NCTq/yuLXxJ2VS+b+ulcLw0CSMvmgvfXIsjKlo81lvqP/djAo8cYm64AR59OPzurnbojbPAwq2UvJ0MFZ4RZ+an+0bry2R2eEK0OeZq7/8ZIfhXy0Z5Vn6oWO/Wk/MdalvZCt0UBf/Tu5FtbPzbKsSH1wMiI8ntF3Pqb5XxSf4/+2JYJSR68BnQIGkSZ1YA1RQNuspbSkTFKXjEu5AjZ5NwEWY+LgIlW5HIjMOkx4GIsp2p5uDBAw2i54VSkEl6HT6mFsdgzg93AYfRImpCHWSx/EHTZbECkB7Fcquoo1eHie+m3mGzGC/mLyb5lARYEmNUTJ/Jm5RVh0t39pAGTWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCncz0py/LySkY/PiQVSGvKP8aJVVusAyVHHBVCnCJ0=;
 b=Ia/D9VEThsMb7diXEEIFtiV96s0HUyRqllbj2G2ux6rG2+kqYJ3FZA/EJ5XBWywD/af+C4qAhG9P7/Yru0JANK4gMfhHWr82JAiysOEDy5mb9j9lbTr72b/bdg07Sm9w56nZ9spnH6yLv9S7PznRCxhUunKHpqBRARvK3nnhYFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 12:27:17 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::fc48:5c4b:7360:913b]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::fc48:5c4b:7360:913b%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 12:27:17 +0000
Message-ID: <505d3ba9-33c3-6dbb-5eaa-7468e1dfe02d@amd.com>
Date: Tue, 30 May 2023 14:26:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: neil.armstrong@linaro.org, u-boot@lists.denx.de, git@xilinx.com,
 Tom Rini <trini@konsulko.com>
References: <0dbdf0432405c1c38ffca55703b6737a48219e79.1684307818.git.michal.simek@amd.com>
 <4e3a7b8f-b5e0-4f66-fa10-a37df0eee7c4@linaro.org>
From: Michal Simek <michal.simek@amd.com>
In-Reply-To: <4e3a7b8f-b5e0-4f66-fa10-a37df0eee7c4@linaro.org>
X-ClientProxiedBy: VI1PR0602CA0022.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::32) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8219c5-2a93-449c-adc9-08db61093487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qtsVYtwx4GC4mYFvd+xAA7WAmCeVQMdRKfil5srpdBICYOfE759/RvTCwcL6gPL4kZbuRGiDb7T7aojXJALuN4fzegXd1tFklxoBXLOSHi7aVx3tIafeTbdvuAZLtVE6NPK7CHeNnHrFAnmMp7YtkVQb4Z0nJ8BvtwUIvw7jYLIFBqkrHjZto28Vd/i0vfKLN4wZ9XrjxD2uouxnJY/k7i3ykmvTVuOSZX24sb5xkv+ycoT6iAvsxRmCyjN3hQdv4pgPiiI7ULG5jVXePnAi2c5tJDzahuA7mQRteGDBC2gY2SS33I42fHVARJUtJzP5ZGrQqoMjiGbjyAKQUJm4ju0tYUaDQXEPlQbdjU8U38FEZpBTVYHlwQZlQPGJZSmnweyGH8gM3cRmT45FwPaVZYORuTpAt99PvpRnEL7VDpEDtASxSMitRvsD4TV0rAZh0pu682wkMMqKJiHuKn7pm71Yml5YGpMhnplXvQrE1ABL1ALBhAMjria8k3BuFeW3H39mhMVFt+x9/Jb/UjCdRnBKgcppP7MH1x/RXFQgdO9at61ihqFNPLEcn5efe1FI/LcgUa5FaUpGe5drxa7QNPRdN4hyckqvi0IhwAbuUVgFuVzk/5fIuxheM3CriJjGzj8FD9ir4h1nDCTfd5LKLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4758.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(186003)(38100700002)(2616005)(41300700001)(31686004)(53546011)(6512007)(26005)(6486002)(6506007)(6666004)(478600001)(54906003)(66556008)(66476007)(66946007)(6916009)(4326008)(316002)(7366002)(7406005)(7416002)(8676002)(5660300002)(4744005)(44832011)(86362001)(36756003)(31696002)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3ZGblowVjNxbFNBWTc3VG5ENUViZ2owQTN4TUV5eExzU2ZWQ2VrclJwd1J4?=
 =?utf-8?B?UjBDWFlsWFZHbWZCdkFzaTZueE40Q3hHZ05DaGgwOWVRd3RtT3c4ak92TWlp?=
 =?utf-8?B?cGR2cmdtTzViTWt0aGpHbERMNlV1SW5iMGliWElIVzQxSFBGMUV0elRMdkgr?=
 =?utf-8?B?TDlPRmgwdzQ5Znk2RXMvMFdhSHdIZ2UwcTgxWVRvemx6NGxQZFR4Y2lwamJa?=
 =?utf-8?B?TFR3WlRWMnJvNTFwTkpNM2hFSGdNSnZ0ZC9uTnBFWlM1UTdicW1sYmpPTFJG?=
 =?utf-8?B?YlBEM1k1bzVSdVQ4b1RadUI3QU5CNitNVTBZbSt0QmZCejBxeHdJTlJrNFFk?=
 =?utf-8?B?ZVJCeEZETTN0SCtseGxPVDJ1Z0Y0VFNFell0R1Y0aFV2VFdmU25HN0FqQWdV?=
 =?utf-8?B?L3pNaENMZW9tOWpRd2JJUVJUSitSWVBvd3U4ajV3MytSOGd6dktFMEl6ZGdJ?=
 =?utf-8?B?czJHZWdZZEpiVmwreHRBQU4wbXd1NDFpRGsvaVcwbjBvc2tuenpFWmt0SzJJ?=
 =?utf-8?B?SHNtYWFBUjZuTXgyUnlzZ1Q0RHlCUTBldFFVVmVhZHpmTS83aDhtWkJpdk5p?=
 =?utf-8?B?MEtsTGtnUWhQYjRzK3FYS2pFRC9SRXdEbGptWFJrMzZoZFV1eFdmMTlBeFJz?=
 =?utf-8?B?VEIvaHd4M1hGQlluK3MvN1Q4L3ltRGhNaXlZWnFMU0M5bko3b1cwd2xhSnJM?=
 =?utf-8?B?SUlLZkNNT2NWREE2MU9YbkNyMS8yaGJkc01DSFppanorNWNpUnJ1eDF3M2FQ?=
 =?utf-8?B?d2NadmtwcWEvTTRKQzJiMDdtdzg3M2drWkpMd2Q1SXpRbDFGcnI2Q0NEdlRz?=
 =?utf-8?B?d0hZSkk4MEJZVmEza01xVTRpQ2tyWkR6UnVNUEI2MXQwZHBQS2FhYjRtVXY5?=
 =?utf-8?B?Z2lucDN1M0NqKzhkNDhMRWk4MWlwWEtSMlN2MWVEd05wMEhmdHBDLys5MjMw?=
 =?utf-8?B?ZGFBUUxUZVpDWEJRaTl5V084eThSVUx5MFBJTlV2ZldRSG1YOGxGcnN4eW81?=
 =?utf-8?B?TERVTzF1SE5ZYnVmK0ZDbVpiN0FSQTFxR1c5YVF5Nms1Z1cvYUVlSENheFFh?=
 =?utf-8?B?SmhFMVk0ZWlsY2dKTjZFaHY5eENZRU44ejdnZWVqejJ6RTVSb0dVSmhkMklB?=
 =?utf-8?B?UnNrTmlSRk5NRmlKdWozWUxnZE16UGNMem9GUS90c1JQZ0VUVHFRa2N1Wkh6?=
 =?utf-8?B?dm4ybDJadHk2enZCN09scW9Cb1NPcEVPcEJ1c3JWK3J1SUI5Mmd2bzV4ajBI?=
 =?utf-8?B?d0Z4SzNQbXpXN3pyVkx5bFdqSmhpWGpTRWdLdVh6cDJDblZKQ3h0VTZKZmhG?=
 =?utf-8?B?ejVHdTVtUUpVVTFpMVlZSlhHby9td3lpTHlyK1o3akVwMjRpWlpJaHc4SEMr?=
 =?utf-8?B?S0JFR3hnVEp2U2JYMW1EM2o4WFZ1YnptbzhtNzZTZUpYQS8xc1BNcDJJU2Uz?=
 =?utf-8?B?VlVaOU45Q3ZWRHpNY1VtTmxmWU1MVG9ORytSem9TVHNsdWNLVTVtanQ4Wm1N?=
 =?utf-8?B?ZSt1Z3I2elExcTlJaDdSV2Jzdzc0c05SNllQaHV0U2tLRjMyZHFyOEV1QTZz?=
 =?utf-8?B?aW0wWm9JUzE5Q0RrclNDSXRtcnhMVVdnRGVqZDJ2dTB4bUlBcCtXekN1OFNT?=
 =?utf-8?B?a2EzYnMvVnQwek9pT0xKRDg3VkFKVXRlWWJrTVFqSEQ2cVFEc0RNc3pzYkpo?=
 =?utf-8?B?N0QwNEc1b1NoTWozZUpjbGRQTy9hak1teVFNUUFxR1ZyWlJRaWF3MU1lT091?=
 =?utf-8?B?NnBabXlmMlh6SjVkMWE1TGFqblBJdHZNKzRZTXBaZGRQTzBxMkJtbjhZRkZk?=
 =?utf-8?B?ZDg2dCtHTjZ5bThwVGZzMmRhekV6aGR3OUtzMXJ1Z09BNEhOT09jMStneXdY?=
 =?utf-8?B?ZWowK1JZY0d1T0sxaWswZmFzZnVGaXhQMFVjTFUyUHptTGJJN3gzS0hSQUxk?=
 =?utf-8?B?SDRlVGRvRWdTUjV3cWxNNnhIYkhDZjlvM3lsMkdkSWNodjRNQ0kyZUhaUDdu?=
 =?utf-8?B?R1N5cWd6ODBSZzFCNEorNzNvYmc4L1pDNkFrenB5S0taQ3pDeUtJQXFWa0Np?=
 =?utf-8?B?Sy9vUFVKYU1aSDRLRGpveGZVRGlxUWtYdEtnYnlLMjA1V1JOTngwTGprRGVr?=
 =?utf-8?Q?Aw2h846ENUBlRy744w4qydL4S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8219c5-2a93-449c-adc9-08db61093487
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 12:27:17.0587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qu/63OPOQDzbpxl0qfLme+COBlDH9a6EXZwV/tK4/u9KFpIpTdqCmOwoHHiBzPDG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787
Cc: uboot-snps-arc@synopsys.com, Fabio Estevam <festevam@denx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Joe Hershberger <joe.hershberger@ni.com>,
 Michael Walle <michael@walle.cc>, Will Deacon <willdeacon@google.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Luka Perkov <luka.perkov@sartura.hr>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Matthias Winker <matthias.winker@de.bosch.com>, Niel Fourie <lusus@denx.de>,
 Lukasz Majewski <lukma@denx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Roger Knecht <rknecht@pm.me>,
 Stefan Roese <sr@denx.de>,
 =?UTF-8?Q?Javier_Mart=c3=adnez_Canillas?= <javier@dowhile0.org>,
 Harald Seiler <hws@denx.de>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Holger Brunck <holger.brunck@hitachienergy.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Jonas Karlman <jonas@kwiboo.se>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Philip Oberfichtner <pro@denx.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Nikhil M Jain <n-jain1@ti.com>,
 Chris Morgan <macromorgan@hotmail.com>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Johan Jonker <jbx6244@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Dillon Min <dillon.minfei@gmail.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 =?UTF-8?Q?Pierre-Cl=c3=a9ment_Tosi?= <ptosi@google.com>,
 Heiko Schocher <hs@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot-amlogic@groups.io,
 Kamil Lulko <kamil.lulko@gmail.com>, Qu Wenruo <wqu@suse.com>,
 Luka Kovacic <luka.kovacic@sartura.hr>, FUKAUMI Naoki <naoki@radxa.com>,
 Marc Zyngier <maz@kernel.org>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Shawn Guo <shawn.guo@linaro.org>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Uboot-stm32] [PATCH] global: Use proper project name U-Boot
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



On 5/22/23 10:16, Neil Armstrong wrote:
> On 17/05/2023 09:17, Michal Simek wrote:
>> Use proper project name in comments, Kconfig, readmes.
>>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
> 
> 
> For amlogic changes:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> 
>> ---
>>
>> I am ignoring these for now because they can break automated scripts or
>> user setting that's why they should be fixed separately.
>>
> 
> <snip>
> 
>> doc/board/amlogic/pre-generated-fip.rst:77:- bl33.bin: U-boot binary image
> 
> You can add this change safely,
> 
> Neil
> 
> 
> 
> <snip>
> 

Applied.
M
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
