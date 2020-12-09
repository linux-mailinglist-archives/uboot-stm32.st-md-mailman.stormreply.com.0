Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 169EE2D4768
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Dec 2020 18:05:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00ADAC3FADA;
	Wed,  9 Dec 2020 17:05:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03E90C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 17:05:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B9H2tq2014326; Wed, 9 Dec 2020 18:04:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=30PuGUKbI2r9XXa3kiVQNdreHV6QW4wQYSro01F2mVM=;
 b=xaV7utPnixZEP69nSKXeeVjUZ4DFQq1fI2BTuYa4iFRgy2NczfMNgwoViXlJAzGY6v7D
 8SeSEpz2p2xxEyQkxP7Y1vDKOQaz86fVcNJktRb+W4ZapTcP+c6tA57ArHnjyOmJmep+
 yiSn8cQAD4wH7hFn9VjFYr/5tGThDDutWF4GZXQC414ZaBodq2jksG3tRuK4uN3NDU+J
 g9VcEsIIQeV6M6EBeujGpjBKHtgRZwVSwZMQJO7Og8oDuvCEJyKx3kSiBqL0G4fdK3W9
 cBxV0/qVPHzNy/vD/tbiFO2UKBtwtEXbCKH3ff4Vp2TiobCFgOPGFGhpdRFZQE4Zi6nD 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35agt9681d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 18:04:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F7D310002A;
 Wed,  9 Dec 2020 18:04:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72BF3250B53;
 Wed,  9 Dec 2020 18:04:54 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec
 2020 18:04:53 +0100
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>, Kever Yang
 <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>, U-Boot STM32
 <uboot-stm32@st-md-mailman.stormreply.com>, Amelie DELAUNAY
 <amelie.delaunay@foss.st.com>
References: <20201015144856.1.I77269d852e0f410c31f9d1f869815c4328510c12@changeid>
 <9ea18aa8-2c87-85cf-fba3-d753382f32e7@denx.de>
 <7fd5050f277643a78bb185b4c272b6c4@SFHDAG2NODE3.st.com>
 <eeaec9e8-764f-8869-33c3-0b3d4d74348e@denx.de>
 <b4e675d5caff47d1b207b67e6ca03e1f@SFHDAG2NODE3.st.com>
 <a86babf0-e628-1f10-848e-5fbdf9dd698a@denx.de>
 <6b18d5817aa84b92852d70132c0b7b8c@SFHDAG2NODE3.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <6d85c0c5-3922-6c3a-15a5-eefb33d50d50@foss.st.com>
Date: Wed, 9 Dec 2020 18:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b18d5817aa84b92852d70132c0b7b8c@SFHDAG2NODE3.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: add "u-boot,
	force-vbus-detection" for stm32
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWFyZWssCgpPbiAxMi85LzIwIDU6MjIgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4KPiBTZW50OiBtYXJkaSAyMCBvY3RvYnJlIDIwMjAgMTI6MjEKPgo+IE9uIDEwLzE2LzIw
IDY6MzIgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+IEhpIE1hcmVrLAo+IEhpLAo+Cj4g
Wy4uLl0KPgo+Pj4+PiBPbiAxMC8xNS8yMCAyOjQ5IFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3Rl
Ogo+Pj4+Pj4gT24gc29tZSBib2FyZCwgdGhlIElEIHBpbiBpcyBub3QgY29ubmVjdGVkIHNvIHRo
ZSBCIHNlc3Npb24gbXVzdAo+Pj4+Pj4gYmUgb3ZlcnJpZGRlbiB3aXRoICJ1LWJvb3QsZm9yY2Vf
Yl9zZXNzaW9uX3ZhbGlkIiBidXQgdGhlIFZCdXMKPj4+Pj4+IHNlbnNpbmcgbXVzdCBjb250aW51
ZSB0byBiZSBoYW5kbGUuCj4+Pj4+Pgo+Pj4+Pj4gVG8gbWFuYWdlZCBpdCwgdGhpcyBwYXRjaCBh
ZGRzIGEgbmV3IERUIGZpZWxkCj4+Pj4+PiAidS1ib290LGZvcmNlLXZidXMtZGV0ZWN0aW9uIiB0
byB1c2Ugd2l0aCAidS1ib290LGZvcmNlX2Jfc2Vzc2lvbl92YWxpZCIKPj4+Pj4gSG93IGlzIHRo
aXMgc29sdmVkIGluIExpbnV4ID8KPj4+PiBJdCBpcyBtYW5hZ2VkIGJ5IExpbnV4IERXQzIgZHJp
dmVyOiBpdCBpcyBhIHJlYWwgT1RHIGRyaXZlciwgd2l0aAo+Pj4+IGR1YWwgbW9kZSBzdXBwb3J0
IGFuZCBieSB1c2IgZnJhbWV3b3JrCj4+Pj4KPj4+PiBUaHJvdWdodCB0aGUgcHJvcGVydGllcwo+
Pj4+ICZ1c2JvdGdfaHMgewo+Pj4+IAl1c2Itcm9sZS1zd2l0Y2g7Cj4+Pj4gfTsKPj4+Pgo+Pj4+
IGEgZ2x1ZSB0cmVhdCB0aGUgc2Vzc2lvbiBhbmQgdGhlIHNlbnNpbmcgbWFuYWdlbWVudCBzZWUK
Pj4+PiBsaW51eC9kcml2ZXJzL3VzYi9kd2MyL2RyZC5jIGluIGxpbnV4LW5leHQKPj4+Pgo+Pj4+
IFBTOiBhY3RpdmF0ZV9zdG1faWRfdmJfZGV0ZWN0aW9uIGlzIGFsc28gdXNlZCBpbiBkcml2ZXIg
PSBoc290Zy0+cGFyYW1zLgo+Pj4+Cj4+Pj4gQXMgSUQgcGluIC8gdmJ1cyBpcyBjb21wbGV0bHkg
bWFuYWdlZCBieSB0aGUgVVNCIFRZUEUgZHJpdmVyIEMKPj4+PiAoU1RVU0IxNjAwIGZvciBTVE1p
Y3JvZWxlY3Ryb25pY3MgYm9hcmQpIGFuZCBEV0MyIGRyaXZlciB3aXRoIGR1YWwKPj4+PiByb2xl
IHN0YWNrIChob3N0L2dhZGdldCkuCj4+Pj4KPj4+PiBJIGRvbid0IGZvdW5kIGEgYmV0dGVyIHNv
bHV0aW9uIHRoYW4gZGV2aWNlIHRyZWUgcHJvcGVydHkgZm9yIHRoaXMKPj4+PiB0YXNrIGluIFUt
Qm9vdCBhcyBEV0MyIGRyaXZlciBkb24ndCBzdXBwb3J0IGR1YWwgcm9sZSBhbmQgVS1Cb290Cj4+
Pj4gZG9uJ3QgaGF2ZQo+Pj4gZnJhbWV3b3JrIGZvciBVU0IgdHlwZSBDIGNvbnRyb2xsZXIuCj4+
Pj4+IGJ0dyBjYW4geW91IGRvIHNvbWV0aGluZyBhYm91dCB0aGF0IGh1Z2UgY2hhbmdlIGluIGlu
ZGVudCA/IElzIGl0IG5lY2Vzc2FyeSA/Cj4+Pj4gSSBtb3ZlIGFsbCB0aGlzIGNvZGUgdW5kZXIg
YWN0aXZhdGVfc3RtX2lkX3ZiX2RldGVjdGlvbiAobGlua2VkIHRvCj4+Pj4gY29tcGF0aWJsZSAi
c3Qsc3RtMzJtcDEtaHNvdGciKSB0byBhdm9pZCBpbXBhY3Qgb24gb3RoZXIgcGxhdGZvcm0gYXMK
Pj4+PiB0aGlzICJzZW5zaW5nIiBwcm9wZXJ0aWVzIGFyZSBvbmx5IHN1cHBvcnQgZm9yIFNUTTMy
TVAxNVggKGl0IGlzCj4+Pj4gbGlua2VkIHRvIFVTQiBibG9jayBkZXRlY3Rpb24gaW50ZWdyYXRl
ZCBpbiBTT0MpCj4+Pj4KPj4+PiBBbmQgYWZ0ZXIgSSBuZWVkIHRvIGNoZWNrIHRoZQo+Pj4+IDEv
IFRoZSB1c2IzM2Qtc3VwcGx5IGlzIHJlcXVpcmVkIG9mIHZidXMgb3IgSURQSU4gc2Vuc2luZyAy
LyBtYW5hZ2UKPj4+PiBWYnVzIHNlbnNpbmcgb3Igb3ZlcnJpZGUgKGFjY29yZGluZyBkdCkgMy8g
bWFuYWdlIElEUElOIG9yIG92ZXJyaWRlCj4+Pj4gKGFjY29yZGluZyBkdCkKPj4+Pgo+Pj4+IEkg
YWRkIGEgbmV3IHByb3BlcnR5IHRvIGJlIGJhY2t3YXJkIGNvbXBhdGlibGUgKGV2ZW4gaXQgdGhl
Cj4+Pj4gY29tYmluYWlzb24gaXMgbGVzcyBjbGVhcikgSSBwcm90ZWN0IHJlZ3VsYXRvciBmdW5j
dGlvbiBjYWxsIHRvCj4+Pj4gYXZvaWQgY29tcGlsYXRpb24KPj4+IGlzc3VlIGZvciBvdGhlciBw
bGF0Zm9ybS4KPj4+PiBQUzogYWZ0ZXIgcmVhZGluZyB0aGUgcmVmbWFudWFsLCBJIGFsc28gc3Bs
aXQgVkFMT0VOIGFuZCBWQUxPVkFMIGJpdAo+Pj4+IHVwZGF0ZQo+Pj4gYXMgaXQgaXMgcmVxdWly
ZWQuCj4+Pj4gU28geWVzIEkgdGhpbmsgaXQgaXMgbmVlZGVkIGJ1dCBJIGNhbiBzcGxpdCB0aGUg
cGF0Y2ggdG8gc2ltcGxpZnkgdGhlIHJldmlldy4KPj4+IEkgcHJlc3VtZSB5b3UgZG9uJ3QgZmVl
bCBsaWtlIGltcGxlbWVudGluZyBwcm9wZXIgT1RHIHN1cHBvcnQsIHJpZ2h0ID8KPj4gWWVzLCBJ
IGFtIGFmcmFpZCBvZiB0aGlzIHRhc2suCj4gQ2FuIHlvdSB0YWtlIGEgbG9vayA/Cj4KPiBJIHdp
bGwgcGljayB0aGlzIHBhdGNoIGludG8gbmV4dCBmb3Igbm93LgoKSSBjaGVjayB0aGlzIHRvcGlj
LCBJIHRoaW5rIEkgZG9uJ3QgbmVlZCB0byBzdXBwb3J0IE9URyBpbiBkd2MyCgpidXQgSSBuZWVk
IHRvIHN1cHBvcnQgVVNCIHBvcnQgYW5kIGNvbm5lY3RvciBhcyBpdCBpcyBkb25lIGluIGxpbnV4
IGtlcm5lbC4KCmFuZCBJIHRoaW5rIHRoYXQgSSBjYW4gcHJvcG9zZSBhIHBsYW4gKDYgbW9udGgt
MSB5ZWFyKQoKLSBBZGQgYSBuZXcgdS1jbGFzcyBmb3IgVVNCIGNvbm5lY3RvciBiYXNlZCBvbiAK
bGludXgvZHJpdmVycy91c2IvdHlwZWMvY2xhc3MuYwoKIMKgwqDCoCA9PiBBbGxvdyB0byBkZXRl
Y3QgY2FibGUgY29ubmVjdGlvbiBhbmQgVVNCIG1vZGUgKGRldmljZSAvIGhvc3QpCgotIEFkZCBh
IG5ldyBkcml2ZXIgZm9yIFVTQiB0eXBlIEMgY29ubmVjdG9yIChjb21wYXRpYmxlICJ1c2ItYy1j
b25uZWN0b3IiKQoKLSBNaWdyYXRlIHN0dXNiMTYwMCBkcml2ZXIgdG8gdXNlIHRoaXMgbmV3IGRy
aXZlcgoKLSBVcGRhdGUgZHJpdmVyIChkd2MyIG9yIHVzYnBoeWMgb3IgZGlyZWN0bHkgaW4gdWNs
YXNzID8pIHRvIHVzZSAKY29ubmVjdG9yIHdoZW4gcHJlc2VudCBpbiBkZXZpY2UgdHJlZSAKKGRl
dmljZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbCkKCldpdGggdGhl
c2UgbW9kaWZjYXRpb25zLCBJIGhvcGUgdG8gaGF2ZSB0aGUgc2FtZSBob29rcyB0aGFuIExpbnV4
LgoKCkFuZCBmb3IgZnV0dXJlCgotIEFkZCBhIFVTQiB0eXBlQyBjb25uZWN0b3IgZHJpdmVyIGJh
c2VkIG9uIFVDU0kgCihsaW51eC9kcml2ZXJzL3VzYi90eXBlYy91Y3NpKQoKaHR0cHM6Ly93d3cu
aW50ZWwuY29tL2NvbnRlbnQvZGFtL3d3dy9wdWJsaWMvdXMvZW4vZG9jdW1lbnRzL3RlY2huaWNh
bC1zcGVjaWZpY2F0aW9ucy91c2ItdHlwZS1jLXVjc2ktc3BlYy5wZGYKCi0gQWRhcHQgb3RoZXIg
ZHJpdmVyIHRvIHVzZSBVU0IgY29ubmVjdG9yLi4uLi4gKGFzIERXQzMgZm9yIGV4YW1wbGUgdG8g
Cm1hbmFnZSBkdWFsIHJvbGUgd2l0aCB0eXBlLWMpCgpQYXRyaWNrCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
