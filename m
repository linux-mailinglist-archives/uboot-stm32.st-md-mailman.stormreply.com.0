Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C791FEED5
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 11:42:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1591EC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 09:42:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABA44C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 09:42:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05I9eGX4025236; Thu, 18 Jun 2020 11:42:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Sz70bl6PqoeUZDJD2ZJ0anNhVphzEOcmauPCthIw3YQ=;
 b=KYTjNzh9J6JS3GefaphU0c488yi10dJhsa/jR9f2buagwIaNGthgcVIyyfcWrlNcN9bb
 10ZbfdRml2SWKn+3DMLeXNwzrLJvQTnLFB3QJH50oBvK+TzagBF1iw03ZB/jbbCh02ex
 Vn5E+ln24ZUBImOB1d1CkbZFjhanLmULpR8DasEBtvxh24RzReAUNA6lo+eFXgrxV6VF
 3ENxgMHuWw/PWD9l3dBK3mCj7uymMfaXm3VKllyWsZWZrtwM/8OUWjDOe6c7gizeLPy2
 NvZsf59B6ULD2E2VAzsb5bRBp0874UvPM/Jb+6Gfm8/ApE1hMYs8h1aMgG9/QlguakPP jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64ahuem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 11:42:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7C3610002A;
 Thu, 18 Jun 2020 11:41:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AAFB820F370;
 Thu, 18 Jun 2020 11:41:58 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jun
 2020 11:41:58 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 18 Jun 2020 11:41:58 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [PATCH v4 4/4] test: env: add test for env info sub-command
Thread-Index: AQHWQx1/R/l4elmvDU6GVyE/L/zF+6jaG3MAgADDSYCAAme3gIAAzp3w
Date: Thu, 18 Jun 2020 09:41:58 +0000
Message-ID: <aad19cd162744215871ae9b52e6d90e4@SFHDAG6NODE3.st.com>
References: <20200615140137.21186-1-patrick.delaunay@st.com>
 <20200615140137.21186-5-patrick.delaunay@st.com>
 <7b4b0f62-2ee9-d806-dca3-f5b046b41e0d@wwwdotorg.org>
 <4aaf99c13bbf4c2a94c3f4c40efbeb37@SFHDAG6NODE3.st.com>
 <2306274c-b93c-2934-b4d8-7e803a88a9e8@wwwdotorg.org>
In-Reply-To: <2306274c-b93c-2934-b4d8-7e803a88a9e8@wwwdotorg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_07:2020-06-17,
 2020-06-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH v4 4/4] test: env: add test for env info
	sub-command
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
> Sent: jeudi 18 juin 2020 00:32
> 
> On 6/16/20 2:01 AM, Patrick DELAUNAY wrote:
> > Hi Stephen,
> >
> >> From: Stephen Warren <swarren@wwwdotorg.org>
> >> Sent: mardi 16 juin 2020 00:09
> >>
> >> On 6/15/20 8:01 AM, Patrick Delaunay wrote:
> >>> Add a pytest for testing the env info sub-command:
> >>>
> >>> test_env_info: test command with several option
> >>>
> >>> test_env_info_quiet: test the result of the sub-command with quiet
> >>> option, '-q' as used for support in shell test; for example:
> >>>   if env info -p -d -q; then env save; fi
> >>
> >>> diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
> >>
> >>> +@pytest.mark.boardspec('sandbox')
> >>> +@pytest.mark.buildconfigspec('cmd_nvedit_info')
> >>> +def test_env_info(state_test_env):
> >>
> >> The body of these tests doesn't look like it tests something that's
> >> specific to sandbox, so I'm not sure why the test function is marked to only run
> on sandbox.
> >> Is it simply because other boards may store the environment
> >> differently and/or have valid saved environment in flash, so the
> >> responses to e.g. "env info" aren't the same everywhere? If so, I
> >> imagine that test_env_info_quiet() doesn't need to be sandbox-only, since
> there's no output in that case.
> >
> > The test is not really sandbox specific but I don't have easy way to
> > know on real board the ENV configuration (for the resut of command env info -p
> -d).
> >
> > In the test, I assume that  at least  CONFIG_ENV_IS_.... is activated
> > (for persistent storage) and if this target is selected in the weak function
> env_get_location.
> > And "env save" as be not be executed (default environment is used).
> >
> > And with quiet option, the test  the environment if is persistent
> > (result of "env -p -q" is 0) or using default ("env -d -q" result is 0).
> >
> > And in the next patch
> > http://patchwork.ozlabs.org/project/uboot/patch/20200616074048.7898-10
> > -patrick.delaunay@st.com/
> >
> > As the command "env erase" is not always supported according he environment
> target.
> >
> > I could test on real hardware but I need to check if I test all the possible result.
> 
> OK, I guess that makes sense for a start.

But I will propose a V5  to check command on real hardware
Just modify test_env_info to check the all possible strings.
 
> For testing on real HW, the typical approach would be to require that the board's
> test configuration define some env__xxx variables that define its capabilities.
> Then, the test can be made to depend on those values, or whether those variables
> are set at all.

For the next steps, I need to thinks about tests because ENV location is not only impacted
by CONFIG_ENV_IS_IN_.... or CONFIG_ENV_IS_NOWHERE 

These defined can be activated simultaneously and env location is detected at run
time: so it is difficult to predict the 'env info' result on real hardware.

On sandbox it is fixed because ENVL_NOWHERE is selected by default.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
