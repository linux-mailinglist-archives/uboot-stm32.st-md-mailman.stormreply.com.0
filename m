Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60C206DBD
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 09:30:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64803C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 07:30:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D937C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 07:30:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05O7Relu013858; Wed, 24 Jun 2020 09:30:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DC2Z2LwyowBu38cgOZP0vFXU0yvLJg707QpjdCS28rk=;
 b=u2sxh5bjVFi2MCmN/MQp5ymVmmjy3iMpMg3056f68LCD/xWYus7ZeLA1ehwc1QLOyZvX
 hxIvaplWt72nh/RFTRXmotkvbfNk+sl9Gp77RZkjexV5uSdC3rrH0gdrxCuxMplSPtPi
 sTbIeJl9Zf6kBzFB/6d9XOTqIT2SvCpnTDJzhMAa7yZroddFx7vudc70zWViiEG0EGHF
 ySfHwmE4gg+ckIKNkAU9XPiRTYHdPF8rZ1VbgzhdrTr3A9G7PZ69Y0wrEFYQB889mwbQ
 Mz2e/xAvA3krxtAPOlABv7bwURlXxsNEDJhpjx3RABck2BjzE9FPJXBxUNNKy3yFOByv og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuuma392-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 09:30:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 340AA10002A;
 Wed, 24 Jun 2020 09:30:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 249792A9939;
 Wed, 24 Jun 2020 09:30:36 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jun
 2020 09:30:35 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 24 Jun 2020 09:30:35 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [RESEND PATCH v5 4/4] test: env: add test for env info
 sub-command
Thread-Index: AQHWRjGwOUr8IJHrHkaYAuIaCsv90ajk3h8AgAFYK6CAAFR4gIAA2wyQ
Date: Wed, 24 Jun 2020 07:30:35 +0000
Message-ID: <e10eedda68bc4b3d9ea86f496561b6fa@SFHDAG6NODE3.st.com>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
 <20200619120337.17042-5-patrick.delaunay@st.com>
 <fe00c944-0f54-8c61-ee16-dc97844eba44@wwwdotorg.org>
 <7288c055b63149ce9b9c97035915f57c@SFHDAG6NODE3.st.com>
 <8651f65b-88a9-ac03-dab0-16d4f0d161a2@wwwdotorg.org>
In-Reply-To: <8651f65b-88a9-ac03-dab0-16d4f0d161a2@wwwdotorg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_04:2020-06-24,
 2020-06-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH v5 4/4] test: env: add test for env
 info sub-command
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

Hi Stephen,

> From: Stephen Warren <swarren@wwwdotorg.org>
> Sent: mardi 23 juin 2020 22:25
> 
> On 6/23/20 7:25 AM, Patrick DELAUNAY wrote:
> > Hi Stephen,
> >
> >> From: Stephen Warren <swarren@wwwdotorg.org>
> >> Sent: lundi 22 juin 2020 20:51
> >>
> >> On 6/19/20 6:03 AM, Patrick Delaunay wrote:
> >>> Add a pytest for testing the env info sub-command:
> >>>
...
> >
> >>> +def test_env_info(state_test_env):
> >> ...
> >>> +    for l in response.split('\n'):
> >>> +        if 'env_valid = ' in l:
> >>> +            assert '= invalid' in l or '= valid' in l or '= redundant' in l
> >>> +            nb_line += 1
> >>> +        elif 'env_ready =' in l or 'env_use_default =' in l:
> >>> +            assert '= true' in l or '= false' in l
> >>> +            nb_line += 1
> >>> +        else:
> >>> +            assert true
> >>
> >> Those last two lines don't seem terribly useful:-)
> >
> > Not really,
> > beacuse I add the nb_line check,
> > this first check can be removed.
> >
> > Do expect a V6 just for that?
> 
> Probably not.

OK I will keep this remark if I need to update the serie
(or the next planned updates of this test)

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
