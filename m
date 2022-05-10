Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9512521435
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 13:50:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EEC2C03FC0;
	Tue, 10 May 2022 11:50:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B484FC035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 11:50:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AAb334011337;
 Tue, 10 May 2022 13:50:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aXZ4knug4/1G41BuRxEiVkGjKArVuu0sWsAbJ5rCWPE=;
 b=Cso6fSCk9MlYVaIjlxyZOyd6wN0Ost1x4oIqtaFFRo2OKhLiO+TCZurmMdyu+22CxwZb
 P8QkKPXCK1OoakTnxU1yPeiAryDeaUfZxWOYhAqi9zGDKjT4Xqym1NFkPpJFGjbgYodW
 joH7I+Qn1s09/Uv3ZMaPlWJu2uQVxgHGvtVaRQIUgD9unUfXiDisbcrlnrHIOmKKPs2S
 DuYbeg7BCCLLA9UAe3o9dN4/oCKAsAWGdYAEyLwOFjMWNr6p2By8t+e+CRx5Gzlmzn7c
 cqrdz/Dk6aGovZCdngckkWrRRMpiPAWPbzuRgY2GHM6NDjmiTPE0H3rGnU2hMFKwgpZU Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kr5xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:50:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2891310002A;
 Tue, 10 May 2022 13:50:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FB1B21B53C;
 Tue, 10 May 2022 13:50:01 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 13:50:00 +0200
Message-ID: <93b168ef-5a2b-762a-3d59-726d15060f19@foss.st.com>
Date: Tue, 10 May 2022 13:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073900.15786-1-patrice.chotard@foss.st.com>
 <53a81962-1ef9-3796-cae7-8072afd6af4c@foss.st.com>
 <bd53472a-3406-954c-40db-0bc9ea7e9772@foss.st.com>
In-Reply-To: <bd53472a-3406-954c-40db-0bc9ea7e9772@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-10_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] phy: stm32-usbphyc: stm32-usbphyc: Add DT
 phy tuning support
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

QWZ0ZXIgZGlzY3Vzc2lvbiB3aXRoIFBhdHJpY2ssIHRoZSB3aG9sZSBzZXJpZXMgd2lsbCBub3Qg
YmUgbWVyZ2VkIGluIHN0bTMyIGdpdCBjdXN0b2RpYW4gbWFzdGVyIGJyYW5jaAoKUGF0cmljZQoK
T24gNS8xMC8yMiAxMDoxMCwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDUvNi8y
MiAxMDo1MCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4gSGkKPj4KPj4gT24gNC8yMi8yMiAw
OTozOSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+Pj4gQWRkIHN1cHBvcnQgb2YgcGh5LXR1bmlu
ZyBwcm9wZXJ0aWVzIGZvciBzbTMyLXVzYnBoeWMncyBwaHkgdHVuaW5nCj4+PiBhbGlnbmVkIHdp
dGggdjUuMTUga2VybmVsIGJpbmRpbmdzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gwqAg
ZHJpdmVycy9waHkvcGh5LXN0bTMyLXVzYnBoeWMuYyB8IDE2NyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspCj4+
Pgo+Pgo+PiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBm
b3NzLnN0LmNvbT4KPj4KPj4gVGhhbmtzCj4+IFBhdHJpY2sKPj4KPj4KPiBBcHBsaWVkIHRvIHUt
Ym9vdC1zdG0zMgo+IAo+IFRoYW5rcwo+IFBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
